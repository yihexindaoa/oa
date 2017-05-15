package examination
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.examination.ExaminationUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.CheckBox;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import myExamination.ExaminationDetail;
	
	import trade.Trade;

	/**
	 * 审批管理
	 */
	public class Examination extends Trade
	{
		protected var _container:Sprite;
		protected var exam:ExaminationUI;
		protected var _page:PageFlip;
		protected var req:Object;
		protected var detail:ExaminationDetail;
		public function Examination(container:Sprite)
		{
			_container = container;
			initExamination();
			super.initPopu(container,exam);
			queryExamination();
		}
		
		private function initExamination():void
		{
			exam = new ExaminationUI();
			exam.x = 161;
			_container.addChild(exam);
			req = new Object();
			_page = new PageFlip();
			_page.x = 62;
			_page.y = 317;
			_page.setWidth(930);
			_page.pageSize = 10;
			_page.pageNum = 1;
			exam.addChild(_page);
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			exam.search.addEventListener(MouseEvent.CLICK,onSearchHandler);
			var exportExaminationInfoBtn:Button=exam.exportExaminationInfo as Button;
			detail=new ExaminationDetail(_container);
			exportExaminationInfoBtn.addEventListener(MouseEvent.CLICK, onexportExaminationInfoBtnHandler);
			exam.table.renderHandler = new Handler(listRender);
		
			
		}
		/**
		 * 导出审批管理
		 */
		protected function onexportExaminationInfoBtnHandler(event:MouseEvent):void
		{
			req.applicationNumber="";
			if(exam.applicationNumber.selectedIndex!=-1 ){
				req.applicationNumber = exam.applicationNumber.selectedIndex;
			}
			req.keyword=exam.keyword.text;
			var ids="";
			for(var i:int = 0;i< exam.table.length;i++){
				var cell:Box = exam.table.getCell(i);
				var check:CheckBox = cell.getChildByName("check") as CheckBox;
				if(check.selected){
					if(i==0){
						ids+=(cell.getChildByName("id") as Label).text;
					}else{
						ids+=","+(cell.getChildByName("id") as Label).text;
					}
					
				}
			}
			req.ids=ids;
			//send("examination/exportExaminationInfo",req, onComplete, onError,URLRequestMethod.POST);
			__JS__("window.open('http://192.168.1.122:8080/oa_system/examination/exportExaminationInfo?keyword='+this.req.keyword+'&&ids='+this.req.ids+'&&applicationNumber='+this.req.applicationNumber);");
		}
		
		protected function queryTableHandler(e:PageEvent):void
		{
			queryExamination();
		}
		protected function queryExamination():void{
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			if(exam.applicationNumber.selectedIndex!=-1 ){
				req.applicationNumber = exam.applicationNumber.selectedIndex;
			}
			req.keyword=exam.keyword.text;
			send("examination/getExaminationInfo",req, onComplete, onError,URLRequestMethod.POST);
		}
		
		private function onError(e:String):void
		{
			popu(e);
		}
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < exam.table.length) {
				
				var auditBtn:Button = cell.getChildByName("auditBtn") as Button;
				auditBtn.addEventListener(MouseEvent.CLICK, onauditBtnHandler);
				var noBtn:Button = cell.getChildByName("noBtn") as Button;
				noBtn.addEventListener(MouseEvent.CLICK, onnoBtnHandler);
				var delBtn:Button = cell.getChildByName("del") as Button;
				delBtn.addEventListener(MouseEvent.CLICK, ondelBtnHandler);
				var applicationText:Button =cell.getChildByName("applicationText") as Button;
				applicationText.addEventListener(MouseEvent.CLICK, onShowEditailsHandler);
			}
		}
		//详情
		protected function onShowEditailsHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			detail.showDetail(id);
		}
		//删除
		protected function ondelBtnHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			popuConfirm("确定删除要删除该条信息吗！", function():void{
				req.ids=id;
				send("examination/deleteExaminationById",req, onUpdate, onError,URLRequestMethod.POST);
				
			});
			
			
			
			
		}
		//审核
		protected function onnoBtnHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			req.id=id;
			req.status=0;
			send("examination/modifyStateByid",req, onUpdate, onError,URLRequestMethod.POST);
			
			
		}
		
		protected function onauditBtnHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			req.id=id;
			req.status=1;
			send("examination/modifyStateByid",req, onUpdate, onError,URLRequestMethod.POST);
			
		}
		private function onUpdate(data:Object):void
		{
			if(data.status == 200){
				popu("操作成功！");
				queryExamination();
				//			trace("接收数据",list);
			}else{
				popu(data.status+"");
			}
		}
		
		private function onComplete(data:Object):void
		{
			if(data.status == 200){
				var list:Array = data.data;
				for(var key:String in list){
					var item:Object = list[key];
					item.index=parseInt(key)*1+_page.pageSize*(_page.currentPage-1)+1;
					if(item.submitTime){
						var date:Date = new Date( item.submitTime );
						item.submitTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
						trace(item.submitTime);
					}
					if(item.examinationTime){
						var date:Date = new Date( item.examinationTime );
						item.examinationTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
						trace(item.examinationTime);
					}
					
				}
				var len:int = list.length;
				exam.table.array = list;
				
				exam.table.repeatY= len;
				_page.y = exam.table.y+len*37+30;
				_page.totalPage = data.total;
				//			trace("接收数据",list);
			}else{
				popu(data.status+"");
			}
		}
		private function onSearchHandler(data:Object):void
		{
			queryExamination();
		}
	}
}