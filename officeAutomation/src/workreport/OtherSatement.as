package workreport
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.workReport.DelectPopUI;
	import game.ui.workReport.OtherSatementUI;
	import game.ui.workReport.ReportDetailsUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	import unitl.date.Calendar;
	import unitl.date.CalendarEvent;
	
	/**
	 * 他人工作报表统计
	 * @author zk
	 * 
	 */	
	public class OtherSatement extends Trade
	{
		protected var _container:Sprite;
		protected var otherSatement:OtherSatementUI;
		protected var delectPop:DelectPopUI;
		protected var reportDetails:ReportDetailsUI;
		protected var _page:PageFlip;
		protected var req:Object;
		protected var calendar:Calendar;
		public function OtherSatement(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,otherSatement);
			querySatement();
		}
		
		private function initWork():void
		{
			//初始化
			otherSatement = new OtherSatementUI();
			otherSatement.x = 161;
			_container.addChild(otherSatement);
			_page = new PageFlip();
			_page.x = 47;
			_page.y = 317;
			_page.setWidth(590);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			otherSatement.addChild(_page);
			otherSatement.dateBeginBtn.addEventListener(MouseEvent.CLICK, onShowDateBeginHandler);
			otherSatement.dateEndBtn.addEventListener(MouseEvent.CLICK, onShowDateEndHandler);
			req = new Object();
			otherSatement.search.addEventListener(MouseEvent.CLICK,onTabHandler);
			otherSatement.table.renderHandler = new Handler(tableRenderHnadler);
			otherSatement.table.overWidth = 580;
			calendar = new Calendar(otherSatement);
			calendar.addEventListener(CalendarEvent.DATE, onCalendarHandler);
			delectPop = new DelectPopUI();
			delectPop.submit.addEventListener(MouseEvent.CLICK, onShowdelectHandler);
			reportDetails = new ReportDetailsUI();
		}
		
		protected var currentReportType:Label;
		protected var currentBox:Box;
		protected function onDetailsDelectHandler(e:MouseEvent):void
		{
			var cell:Box = (e.target).parent;
			currentReportType = cell.getChildByName("reportType") as Label;
			currentBox = cell;
			delectPop.show();
			
		}
		
		protected function onShowdelectHandler(e:MouseEvent):void
		{
			var cell:Box = currentBox;
			var reportType:Label = currentReportType;
			if(reportType.text=="1"){
				//日报表
				var id:Label = cell.getChildByName("id") as Label;
				req.id=id.text;
				send("daily/delect",req,onCompleteDelectHandler,onDelectError,"POST");
			}else if(reportType.text=="2"){
				//周报表
				var id:Label = cell.getChildByName("id") as Label;
				req.id=id.text;
				send("weekly/delect",req,onCompleteDelectHandler,onDelectError,"POST");
			}else if(reportType.text=="3"){
				//月报表
				var id:Label = cell.getChildByName("id") as Label;
				req.id=id.text;
				send("monthly/delect",req,onCompleteDelectHandler,onDelectError,"POST");
			}else{
				//出错
			}
		}		
		
		private function onDelectError(data:Object):void
		{
			delectPop.close();
		}
		
		private function onCompleteDelectHandler(data:Object):void
		{
			if(data.status==200){
				delectPop.close();
				req.pageNum = _page.currentPage;
				req.pageSize = _page.pageSize;
				send("userReport/findAllReport",req,onCompleteHandler,onError,"POST");
			}else{
				popu(data.msg);
			}
		}
		
		//操作栏按钮处理
		private function tableRenderHnadler(cell:Box,index:int):void
		{
				if(otherSatement.table.length>0){
				//详情
				var  details:Button = cell.getChildByName("details") as Button;
//				details.labelColors
				details.addEventListener(MouseEvent.CLICK, onDetailsHandler);
				//删除
				var  delect:Button = cell.getChildByName("delect") as Button;
//				delect.labelColors
				delect.addEventListener(MouseEvent.CLICK, onDetailsDelectHandler);
				}
		} 
		
		//详情弹框
		protected function onDetailsHandler(e:MouseEvent):void
		{
			var cell:Box = (e.target).parent;
			var reportType:Label = cell.getChildByName("reportType") as Label;
			if(reportType.text=="1"){
				var noticeContent:Label = cell.getChildByName("noticeContent") as Label;
				var userName:Label = cell.getChildByName("userName") as Label;
				var sendTime:Label = cell.getChildByName("sendTime") as Label;
				reportDetails.userName.text = userName.text;
				reportDetails.dateTime.text = sendTime.text;
				reportDetails.content.text = noticeContent.text;
				reportDetails.show();
			}else if(reportType.text=="2"){
				var weeklyContent:Label = cell.getChildByName("weeklyContent") as Label;
				var userName:Label = cell.getChildByName("userName") as Label;
				var sendTime:Label = cell.getChildByName("sendTime") as Label;
				reportDetails.userName.text = userName.text;
				reportDetails.dateTime.text = sendTime.text;
				reportDetails.content.text = weeklyContent.text;
				reportDetails.show();
			}else if(reportType.text=="3"){
				var monthlyContent:Label = cell.getChildByName("monthlyContent") as Label;
				var userName:Label = cell.getChildByName("userName") as Label;
				var sendTime:Label = cell.getChildByName("sendTime") as Label;
				reportDetails.userName.text = userName.text;
				reportDetails.dateTime.text = sendTime.text;
				reportDetails.content.text = monthlyContent.text;
				reportDetails.show();
			}else{
				popu("没有此报表内容");
			}
			
		}
		
		//时间选择
		protected var isFirstCalendar:Boolean = true;
		protected function onShowDateEndHandler(e:MouseEvent):void
		{
			calendar.show(259,72);
			isFirstCalendar = false;
		}
		
		protected function onShowDateBeginHandler(e:MouseEvent):void
		{
			calendar.show(139,72);
			isFirstCalendar = true;
		}
		
		/*日历选择事件*/
		protected var beginTime:String = "";
		protected var endTime:String = "";
		protected function onCalendarHandler(e:CalendarEvent):void
		{
			if(isFirstCalendar){
				otherSatement.dateBeginTxt.text = e.date;
				beginTime=otherSatement.dateBeginTxt.text;
			}else{
				otherSatement.dateEndTxt.text = e.date;
				endTime=otherSatement.dateEndTxt.text;
			}
			calendar.hide();
		}
		
		//查询按钮
		protected function onTabHandler(e:MouseEvent):void
		{
			req.beginTime=beginTime;
			req.endTime=endTime;
			req.userName=otherSatement.queryTxt.text; 
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			_page.y = otherSatement.table.y +otherSatement.table.height*_page.pageSize;
			send("userReport/findAllReport",req,onCompleteSearchHandler,onError,"POST");
		}
		
		private function onCompleteSearchHandler(data:Object):void
		{
			
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					otherSatement.table.array = data.data;
					otherSatement.table.repeatY = data.data.length;
					_page.totalPage = data.total;
					_page.y = otherSatement.table.y +data.data.length*37;//*_page.pageSize;
				}else{
					otherSatement.table.array= null;
				}
			}else{
				popu(data.msg);
			}
		}
		
		//点击页码，再次查询页面数据
		protected function queryTableHandler(e:PageEvent):void
		{
			querySatement();
		}
		
		//查询页面加载数据
		private function querySatement():void
		{
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			send("userReport/findAllReport",req,onCompleteHandler,onError,"POST");
			
		}
		
		private function onError(e:String):void
		{
			popu(e);
		}
		
		//如果查询成功则渲染数据
		private function onCompleteHandler(data:Object):void
		{
//			_page.totalPage = data.total;
//			
//			_page.y = 450;
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					
					otherSatement.table.array = data.data;
					otherSatement.table.repeatY = data.data.length;
					_page.totalPage = data.total;
					_page.y = otherSatement.table.y +data.data.length*37;//otherSatement.table.height;//*_page.pageSize;
				}else{
					otherSatement.table.array= null;	
				}
			}else{
				popu(data.msg);
			}
		}	
	}
}