package workreport
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.workReport.PersonMsgUI;
	import game.ui.workReport.myDailyUI;
	
	import morn.core.components.Box;
	import morn.core.components.CheckBox;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	/**
	 * 提交工作日报
	 */
	public class WorkReport extends Trade
	{
		protected var _container:Sprite;
		protected var myDaily:myDailyUI;
		protected var req:Object;
		protected var personMsg:PersonMsgUI;
		public function WorkReport(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,myDaily);
			querySatement();
		}
		
		private function initWork():void
		{
			myDaily = new myDailyUI();
			myDaily.x = 161;
			_container.addChild(myDaily);
			req = new Object();
			myDaily.submit.addEventListener(MouseEvent.CLICK,onSubmitHandler);
			myDaily.addBtn.addEventListener(MouseEvent.CLICK,onShowPersonHandler);
		}
		
		//查询接受人
		protected function onShowPersonHandler(e:MouseEvent):void
		{
			send("user/findByUser",{"pageNum":0,"pageSize":10000000000},onUserComp,onUserError,"POST");
			
		}
		
		private function onUserComp(data:Object):void
		{
			if(data.status==200){
				//如果返回值等于200，弹出操作框
				if(!personMsg){
					personMsg = new PersonMsgUI();
					personMsg.table.renderHandler = new Handler(listRender);
					personMsg.submit.addEventListener(MouseEvent.CLICK,onAddPersonMsgHandler);
					personMsg.show();
				}else{
					personMsg.show();
				}
				var list:Array = data.data;
				personMsg.table.array = list;
			}else{
				var date:Object;
				popu(date.msg+"");
			}
			
		}
		
		
		
		protected function onAddPersonMsgHandler(e:MouseEvent):void
		{
			personMsg.close();
			var pos:int = 0;
			for(var i=0;i< personMsg.table.length;i++){
				
				var cell:Box = personMsg.table.getCell(i);
				var check:CheckBox = cell.getChildByName("check") as CheckBox;
				var userName:Label = cell.getChildByName("userName") as Label;
				var id:Label = cell.getChildByName("id") as Label;
				if(check.selected){
					var lable:Label = new Label();
					lable.text = userName.text;
					lable.x = pos * 50+100;
					lable.y = 347;
					myDaily.addChild(lable);
					pos++;
				}
			}
		}
		
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < personMsg.table.length) {
				var check:CheckBox = cell.getChildByName("check") as CheckBox;
				
			}
		}
		
		private function onUserError(e:String):void
		{
			popu(e);
			
		}
		
		//添加日报
		protected function onSubmitHandler(event:MouseEvent):void
		{
			req.noticeContent = myDaily.noticeContent.text;
			send("daily/save",req,onComp,onError,"POST");
		}
		
		private function onError(e:String):void
		{
			popu(e);
		}
		
		private function onComp(data:Object):void
		{
			if(data.status==200){
				
			}
		}
		
		//查询页面加载今昨两天的日报
		private function querySatement():void
		{
			send("daily/findAllMyDaily",req,onCompleteHandler,onError,"POST");
			
		}
		
		//如果查询成功则渲染数据
		private function onCompleteHandler(data:Object):void
		{
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					myDaily.table.array = data.data;
				}else{
					myDaily.table.array= null;	
				}
			}else{
				popu(data.msg);
			}
		}	
	}
}