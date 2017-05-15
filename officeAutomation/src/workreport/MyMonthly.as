package workreport
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.workReport.MyMonthlyUI;
	import game.ui.workReport.PersonMsgUI;
	
	import morn.core.components.Box;
	import morn.core.components.CheckBox;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	/**
	 * 提交工作日报
	 */
	public class MyMonthly extends Trade
	{
		protected var _container:Sprite;
		protected var myMonth:MyMonthlyUI;
		protected var req:Object;
		protected var personMsg:PersonMsgUI;
		public function MyMonthly(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,myMonth);
			querySatement();
		}
		
		private function initWork():void
		{
			myMonth = new MyMonthlyUI();
			myMonth.x = 161;
			_container.addChild(myMonth);
			req = new Object();
			myMonth.submit.addEventListener(MouseEvent.CLICK,onSubmitHandler);
			myMonth.addBtn.addEventListener(MouseEvent.CLICK,onShowPersonHandler);
		}
		
		//查询接受人
		protected function onShowPersonHandler(e:MouseEvent):void
		{
			send("user/findByUser",{"pageNum":0,"pageSize":100000000000},onUserComp,onUserError,"POST");
			
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
					lable.x = pos * 10+280;
					lable.y = 344;
					myMonth.addChild(lable);
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
		
		//添加月报
		protected function onSubmitHandler(event:MouseEvent):void
		{
			req.noticeContent = myMonth.monthlyContent.text;
			send("monthly/save",req,onComp,onError,"POST");
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
		
		//查询页面加载月报
		private function querySatement():void
		{
			send("monthly/findAllMyMonthly",req,onCompleteHandler,onError,"POST");
			
		}
		
		//如果查询成功则渲染数据
		private function onCompleteHandler(data:Object):void
		{
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					myMonth.table.array = data.data;
				}else{
					myMonth.table.array= null;	
				}
			}else{
				popu(data.msg);
			}
		}	
	}
}