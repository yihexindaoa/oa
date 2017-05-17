package myExamination
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.myExamination.MyExaminationUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import myExamination.ExaminationUpdate;
	
	import trade.Trade;

	/**
	 * 我提交审批
	 */
	public class MyExamination extends Trade
	{
		protected var _container:Sprite;
		protected var exam:MyExaminationUI;
		protected var _page:PageFlip;
		protected var req:Object;
		protected var approvla:ExaminationSave;
		protected var detail:ExaminationDetail;
//		protected var update:ExaminationUpdate;
		public function MyExamination(container:Sprite)
		{
			
			_container = container;
			initMyExamination();
			super.initPopu(container,exam);
			queryMyExamination();
		}
		private function initMyExamination():void
		{
			exam = new MyExaminationUI();
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
			var outputExcelMyApplyBtn:Button=exam.outputExcelMyApply as Button;
			
			outputExcelMyApplyBtn.addEventListener(MouseEvent.CLICK, outputExcelMyApplyHandler);
			exam.table.renderHandler = new Handler(listRender);
			approvla = new ExaminationSave(_container);
			approvla.addEventListener("SUCCESS", onApprovalHandler);
			detail=new ExaminationDetail(_container);
			exam.submit.addEventListener(MouseEvent.CLICK, onGoTOApprovalHandler);
//			update=new ExaminationUpdate(_container);
		}
		
		/**添加申请成功后的回调**/
		protected function onApprovalHandler(e:Event):void
		{
			queryMyExamination();
		}
		
		/**进入审批流程**/
		protected function onGoTOApprovalHandler(e:MouseEvent):void
		{
			approvla.show();
		}
		/**
		 * 导出
		 */
		
		protected function outputExcelMyApplyHandler(event:MouseEvent):void
		{
			req.applicationNumber="";
			if(exam.applicationNumber.selectedIndex!=-1){
				req.applicationNumber = exam.applicationNumber.selectedIndex;
			}
			//send("examination/exportExaminationInfo",req, onComplete, onError,URLRequestMethod.POST);
			__JS__("window.open(this.path+'/oa_system/examination/outputExcelMyApply?applicationNumber='+this.req.applicationNumber);");
		}
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < exam.table.length) {
				
				var detailBtn:Button = cell.getChildByName("detailBtn") as Button;
				detailBtn.addEventListener(MouseEvent.CLICK, detailBtnHandler);
				var delBtn:Button = cell.getChildByName("del") as Button;
				delBtn.addEventListener(MouseEvent.CLICK, ondelBtnHandler);
			}
		}
		
		protected function ondelBtnHandler(e:MouseEvent):void
		{
			
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			
			//update.show();
			//update.setDetail(id);
			popuConfirm("确定删除要删除该条信息吗！", function():void{
				req.ids=id;
				send("examination/deleteExaminationById",req, onUpdate, onError,URLRequestMethod.POST);
			
			});
			
			
			
		}
		/**
		 * 详情
		 */
		
		protected function detailBtnHandler(event:MouseEvent):void
		{
			var cell:Box = event.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			detail.showDetail(id);
			
		}
		protected function queryMyExamination():void{
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			if(exam.applicationNumber.selectedIndex!=-1 ){
				req.applicationNumber = exam.applicationNumber.selectedIndex;
			}
			
			send("examination/getExaminationInfoById",req, onComplete, onError,URLRequestMethod.POST);
		}
		
		private function onError(e:String):void
		{ 
			popu(e);
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
		protected function queryTableHandler(e:PageEvent):void
		{
			queryMyExamination();
		}
		private function onSearchHandler(data:Object):void
		{
			queryMyExamination();
		}
		private function onUpdate(data:Object):void
		{
			if(data.status == 200){
				popu("操作成功！");
				queryMyExamination();
				//			trace("接收数据",list);
			}else{
				popu(data.status+"");
			}
		}
	}
}