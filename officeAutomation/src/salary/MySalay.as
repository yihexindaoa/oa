package salary
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.salary.MySalaryUI;
	import game.ui.salary.WageStatisticsUI;
	
	import trade.Trade;
	
	import unitl.date.Calendar;
	import unitl.date.CalendarEvent;
	
	public class MySalay extends Trade
	{
		protected var _container:Sprite;
		protected var _mySalary:MySalaryUI;
		protected var _page:PageFlip;
		protected var req:Object;
		protected var calendar:Calendar;
		
		public function MySalay(container:Sprite)
		{
			super();
			_container = container;
			//			TweenLite.to(_container,5,{scaleX:0.5,scaleY:0.5});
			initMySalary();
			super.initPopu(container,_mySalary);
			//页面数据加载
			queryNotice();
		}
		
		//初始化
		private function initMySalary():void
		{
			_mySalary = new MySalaryUI();
			_mySalary.x = 161;
			_container.addChild(_mySalary);
			_page = new PageFlip();
			_page.x = 82;
			_page.y = 317;
			_page.setWidth(887);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			_mySalary.addChild(_page);
			_mySalary.table.repeatY = _page.pageSize;
			req = new Object();
			calendar = new Calendar(_mySalary);
			calendar.addEventListener(CalendarEvent.DATE, onCalendarHandler);
			
		}
		
		//点击页码，再次查询页面数据
		protected function queryTableHandler(e:PageEvent):void
		{
			queryNotice();
		}
		
		/*工资统计表日历选择事件*/
		protected function onCalendarHandler(e:CalendarEvent):void
		{
			_mySalary.dateTime.text = e.date;
			calendar.hide();
		}
		
		//页面加载数据查询
		protected function queryNotice():void{
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			if(_mySalary.dateTime.text!=null && _mySalary.dateTime.text!=""){
				req.payOffTime = _mySalary.dateTime.text;
			}
			send("OaWage/MySalary",req,onCompleteHandler,onError,"GET");
		}
		//回调错误方法，显示弹框
		private function onError(e:String):void
		{
			popu(e);
		}
		//查询工资单回调方法
		private function onCompleteHandler(data:Object):void
		{
			_page.totalPage = data.total;
			_mySalary.table.repeatY = _page.pageSize;
			_page.y = _mySalary.table.y +_mySalary.table.height*_page.pageSize+95;
			//数据渲染进入列表
			if(data.data!=null && data.data.length >0  ){
				for(var i=0;i<data.data.length ;i++){
					data.data[i]["SerialNumber"] = i+_page.pageSize*(_page.currentPage-1)+1;
				}
				_mySalary.table.array = data.data;
				
				//				popu(data.data);
			}else{
				_mySalary.table.array= null;	
			}
		}
		
	}
}