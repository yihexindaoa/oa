package notice
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.ObjectEncoding;
	import flash.net.URLRequestMethod;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.notice.NoticeEditUI;
	import game.ui.notice.NoticeListUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.CheckBox;
	import morn.core.components.ComboBox;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	import morn.core.utils.ObjectUtils;
	
	import notice.vo.noticeList.NoticeListReq;
	import notice.vo.noticeList.NoticeListRsp;
	
	import trade.Trade;
	
	import unitl.date.Calendar;
	import unitl.date.CalendarEvent;
	
	public class Notice extends Trade
	{
		protected var _container:Sprite;
		protected var _notice:NoticeListUI;
		protected var _page:PageFlip;
		protected var noticeReq:NoticeListReq;
		protected var edit:NoticeEdit;
		protected var detail:NoticeDetail;
		protected var calendar:Calendar;
		public function Notice(container:Sprite)
		{
			_container = container;
			initNotice();
			super.initPopu(container,_notice);
			queryNotice();
		}
		
		private function initNotice():void
		{
			_notice = new NoticeListUI();
			_container.addChild(_notice);
			_notice.x = 161;
			_page = new PageFlip();
			_page.x = 43;
			_page.y = 317;
			_page.setWidth(916);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			_notice.addChild(_page);
			_notice.addBtn.addEventListener(MouseEvent.CLICK, onAddHandler);
//			_notice.editBtn.addEventListener(MouseEvent.CLICK,onEditHandler);
			_notice.dateBtn.addEventListener(MouseEvent.CLICK,onDateHandler);
			_notice.table.renderHandler = new Handler(listRender);
			edit = new NoticeEdit(_container);
			detail = new NoticeDetail(_container);
			noticeReq = new NoticeListReq();
			calendar = new Calendar(_notice);
			calendar.addEventListener(CalendarEvent.DATE, onCalendarHandler);
			edit.addEventListener("saveNotice", queryNotice);
			edit.addEventListener("modifyNotice", queryNotice);
		}
		
		/*日历选择事件*/
		protected function onCalendarHandler(e:CalendarEvent):void
		{
			_notice.dateTxt.text = e.date;//trace(e.millisecondsNumber);
			calendar.hide();
		}
		
		/*编辑*/
		protected function onEditHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			edit.showEdit(id);
		}
		
		/*日期回调函数*/
		protected function onDateHandler(e:MouseEvent):void
		{
			calendar.show(_notice.dateBtn.x,_notice.dateBtn.y);
		}
		
		/**新增**/
		protected function onAddHandler(event:MouseEvent):void
		{
			edit.showAdd();
		}		
		
		protected function queryNotice(e:Event = null):void{
			noticeReq.pageNum = _page.currentPage;
			noticeReq.pageSize = _page.pageSize;
			/*_notice.table.array=[{
				"signType": "1",
				"title": "momo1",
				"content": "asd",
				"attachment": null,
				"releaseTime": 1491551685000,
				"releasePeople": 1,
				"state": 1,
				"approver": 1,
				"releasePeopleName": "1",
				"approverName": "1",
				"typeName": "公司通知",
				"id": 47
			},{
				"signType": "2",
				"title": "momo1",
				"content": "asd",
				"attachment": null,
				"releaseTime": 1491551685000,
				"releasePeople": 1,
				"state": 1,
				"approver": 1,
				"releasePeopleName": "1",
				"approverName": "1",
				"typeName": "奖励通知",
				"id": 47
			}];*/
			
			var noticeObj:Object = new Object();
			noticeObj.pageNum = noticeReq.pageNum;
			if(noticeReq.date)
			noticeObj.date = noticeReq.date;
			if(noticeReq.keyword)
			noticeObj.keyword = noticeReq.keyword;
			noticeObj.pageSize = noticeReq.pageSize;
			send("notice/noticePageInfo",noticeObj, onComplete, onError,URLRequestMethod.POST);
		}
		
		protected function queryTableHandler(e:PageEvent):void
		{
			queryNotice();
		}
		
		/*通知告示统计表回调函数*/
		protected function onComplete(data:Object):void
		{
			if(data.status == 200){
				var list:Array = data.data;
				for(var key:String in list){
					var item:Object = list[key];
					if(item.releaseTime){
					var date:Date = new Date( item.releaseTime );
					item.releaseTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
//					trace(item.releaseTime);
					}
				}
				var len:int = list.length;
				_notice.table.array = list;
				_notice.table.repeatY= len;
				_page.y = 165+len*37;
				_page.totalPage = data.total;
				//			trace("接收数据",list);
			}else{
				popu(data.status+"");
			}
			
		}
		/*通知告示统计表错误回调函数*/
		protected function onError(t:String):void
		{
//			trace(t);
			popu(t);
		}
		
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < _notice.table.length) {
				var check:CheckBox = cell.getChildByName("check") as CheckBox;
				check.addEventListener(MouseEvent.CLICK, onSelectHandler);
				var noticeBtn:Button = cell.getChildByName("detailsBtn") as Button;
				noticeBtn.addEventListener(MouseEvent.CLICK, onNoticeDetailHandler);
				var edit:Button = cell.getChildByName("edit") as Button;
				edit.addEventListener(MouseEvent.CLICK,onEditHandler);
				var deleteBtn:Button = cell.getChildByName("delete") as Button;
				deleteBtn.addEventListener(MouseEvent.CLICK,onDeleteHandler);
				cell.graphics.beginFill(0x55ccee,0.5);
				cell.graphics.drawRect(0,0,cell.width+5,cell.height+5);
				cell.addEventListener(MouseEvent.MOUSE_OVER, onOverHandler);
				cell.addEventListener(MouseEvent.MOUSE_OUT, onOutHandler);
			}
		}
		
		/**删除**/
		protected function onDeleteHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			send("notice/deleteNoticeByid",{"ids":[id]},function(data:Object):void{
				popu(data.msg);
				if(data.status == 200){
					queryNotice();
				}
				
			},function(v:String):void{
				popu(v);
			},"POST");
		}
		
		/*查看详情*/
		protected function onNoticeDetailHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:int = parseInt((cell.getChildByName("id") as Label).text);
			detail.showDetail( id );
		}
		
		protected function onSelectHandler(e:MouseEvent):void
		{
			var check:CheckBox = e.target as CheckBox;
			
		}
		
		protected function onOutHandler(e:MouseEvent):void
		{
			var cell:Box;
			if(e.target is Box){
				cell = e.target as Box;
				
			}else{
				cell = e.target.parent as Box;
			}
			if(cell){
				cell.graphics.clear();
				cell.graphics.beginFill(0x55ccee,0.5);
				cell.graphics.drawRect(0,0,cell.width+5,cell.height+5);
			}
		}
		
		protected function onOverHandler(e:MouseEvent):void
		{
			var cell:Box;
			if(e.target is Box){
				cell = e.target as Box;
				
			}else{
				cell = e.target.parent as Box;
			}
			if(cell){
				cell.graphics.lineStyle(6,0x0cc,0.9);
				cell.graphics.drawRect(-41,-3,895,cell.height+13);
			}
		}
	}
}