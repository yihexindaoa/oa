package workreport
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.workReport.MyWeeklyUI;
	import game.ui.workReport.PersonMsgUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.CheckBox;
	import morn.core.components.Label;
	import morn.core.components.TextArea;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	/**
	 * 提交工作日报
	 */
	public class MyWeekly extends Trade
	{
		protected var _container:Sprite;
		protected var myWeekly:MyWeeklyUI;
//		protected var req:Object;
		protected var personMsg:PersonMsgUI;
		protected var _personList:Array;//保存要发送的人员
		protected var recipientId:String = "";//发送人的id值
		protected var currentId:int ;//目前修改的id
		public function MyWeekly(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,myWeekly);
			querySatement();
		}
		
		private function initWork():void
		{
			_personList = new Array();
			myWeekly = new MyWeeklyUI();
			myWeekly.x = 161;
			_container.addChild(myWeekly);
			myWeekly.submit.addEventListener(MouseEvent.CLICK,onSubmitHandler);
			myWeekly.addBtn.addEventListener(MouseEvent.CLICK,onShowPersonHandler);
			myWeekly.table.renderHandler = new Handler(renderHandler);
			personMsg = new PersonMsgUI();
			personMsg.table.renderHandler = new Handler(listRender);
			personMsg.submit.addEventListener(MouseEvent.CLICK,onAddPersonMsgHandler);
		}
		
		private function renderHandler(cell:Box,index:int):void
		{
			if( myWeekly.table.length >0 ){
				var modfiy:Button = cell.getChildByName("modfiy") as Button;
				modfiy.addEventListener(MouseEvent.CLICK, onModfiyhandler);
			}
		}
		
		protected function onModfiyhandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent;
			myWeekly.submit.label = "修改发送";
			myWeekly.submit.visible = true;
			myWeekly.weeklyContent.text = (cell.getChildByName("noticeContent") as TextArea).text;
			currentId = parseInt((cell.getChildByName("id") as Label).text);
		}
		
		//查询接受人
		protected function onShowPersonHandler(e:MouseEvent):void
		{
			send("user/findByUser",{"pageNum":0,"pageSize":10000000},onUserComp,onUserError,"POST");
			
		}
		
		private function onUserComp(data:Object):void
		{
			if(data.status==200){
				//如果返回值等于200，弹出操作框
				personMsg.show();
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
			for( var j:int = 0;j< _personList.length; j++){
				var lable:Label = _personList[j];
				myWeekly.removeChild(lable);
				lable = null;
			}
			_personList = [];
			recipientId = "";
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
					if(i<personMsg.table.length-1)
						recipientId+=id.text + ",";
					else
						recipientId+=id.text;
					myWeekly.addChild(lable);
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
		
		//添加周报
		protected function onSubmitHandler(event:MouseEvent):void
		{
			var req:Object = new Object();
			req.noticeContent = myWeekly.weeklyContent.text;
			//接收人Id
			req.recipientId = recipientId;
			if(myWeekly.submit.label == "提交"){
				send("weekly/save",req,onComp,onError,"POST");
			}else if(myWeekly.submit.label == "修改发送"){
				req.id = currentId;
				send("weekly/update",req,function(data:Object):void{
					if(data.status==200){
						
						querySatement();
					}
				},onError,"POST");
			}
		}
		
		private function onError(e:String):void
		{
			popu(e);
		}
		
		private function onComp(data:Object):void
		{
			if(data.status==200){
				popu(data.msg);
				querySatement();
			}
		}
		
		//查询页面加载周报
		private function querySatement():void
		{
			var req:Object = new Object();
			send("weekly/findAllMyWeekly",req,onCompleteHandler,onError,"POST");
			
		}
		
		//如果查询成功则渲染数据
		private function onCompleteHandler(data:Object):void
		{
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					myWeekly.table.array = data.data;
				}else{
					myWeekly.table.array= null;	
				}
			}else{
				popu(data.msg);
			}
		}	
	}
}