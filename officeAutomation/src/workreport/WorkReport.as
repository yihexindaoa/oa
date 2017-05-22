package workreport
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.events.ModelChange;
	
	import game.ui.workReport.PersonMsgUI;
	import game.ui.workReport.myDailyUI;
	
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
	public class WorkReport extends Trade
	{
		protected var _container:Sprite;
		protected var myDaily:myDailyUI;
//		protected var req:Object;
		protected var personMsg:PersonMsgUI;
		protected var _personList:Array;//保存要发送的人员
		protected var recipientId:String = "";//发送人的id值
		protected var currentId:int ;//目前修改的id
		public function WorkReport(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,myDaily);
			querySatement();
		}
		
		private function initWork():void
		{
			_personList = new Array();
			myDaily = new myDailyUI();
			myDaily.x = 161;
			_container.addChild(myDaily);
			
			myDaily.submit.addEventListener(MouseEvent.CLICK,onSubmitHandler);
			myDaily.addBtn.addEventListener(MouseEvent.CLICK,onShowPersonHandler);
			myDaily.table.renderHandler = new Handler(renderHandler);
			personMsg = new PersonMsgUI();
			personMsg.table.renderHandler = new Handler(listRender);
			personMsg.submit.addEventListener(MouseEvent.CLICK,onAddPersonMsgHandler);
		}
		
		private function renderHandler(cell:Box,index:int):void
		{
			if( myDaily.table.length >0 ){
				var modfiy:Button = cell.getChildByName("modfiy") as Button;
				modfiy.addEventListener(MouseEvent.CLICK, onModfiyhandler);
			}
		}
		
		protected function onModfiyhandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent;
			myDaily.submit.label = "修改发送";
			myDaily.submit.visible = true;
			myDaily.noticeContent.text = (cell.getChildByName("noticeContent") as TextArea).text;
			currentId = parseInt((cell.getChildByName("id") as Label).text);
		}
		
		//查询接受人
		protected function onShowPersonHandler(e:MouseEvent):void
		{
			send("user/findByUser",{"pageNum":0,"pageSize":100000000},onUserComp,onUserError,"POST");
			
		}
		
		private function onUserComp(data:Object):void
		{
			if(data.status==200){
				//如果返回值等于200，弹出操作框
//				if(!personMsg){
//					
//					personMsg.show();
//				}else{
					personMsg.show();
//				}
				var list:Array = data.data;
				personMsg.table.array = list;
				personMsg.table.repeatY = list.length;
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
				myDaily.removeChild(lable);
				lable = null;
			}
			_personList = [];
			recipientId = "";
			for(var i:int=0;i< personMsg.table.length;i++){
				
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
					myDaily.addChild(lable);
					_personList.push(lable);
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
			var req:Object = new Object();
			req.noticeContent = myDaily.noticeContent.text;
			//发送人Id
//			req.senderId = 
			//接收人Id
			req.recipientId = recipientId;
			if(myDaily.submit.label == "提交"){
				send("daily/save",req,onComp,onError,"POST");
			}else if(myDaily.submit.label == "修改发送"){
				req.id = currentId;
				send("daily/update",req,function(data:Object):void{
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
				querySatement();
			}
		}
		
		//查询页面加载今昨两天的日报
		private function querySatement():void
		{
			var req:Object = new Object();
			var today:Date = new Date();
			var yeasterday:Date = new Date();
			yeasterday.setDate(today.getDate()-1);
			req.endTime = today.getTime();
			req.beginTime = yeasterday.getTime();
			send("daily/findAllMyDaily",req,onCompleteHandler,onError,"POST");
			
		}
		
		//如果查询成功则渲染数据
		private function onCompleteHandler(data:Object):void
		{
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					var toady:Date = new Date();
					myDaily.table.array = data.data;
					for(var i:int,m:int= data.data.length ;i<m;i++){
						var item:Object = data.data[i];
						
						var date:Date = new Date();
						date.setTime(item.sendTime);
						if(toady.getFullYear()==date.getFullYear()&&toady.getMonth() == date.getMonth()&&toady.getDate()==date.getDate()){
							myDaily.submit.label = "请点选下面的修改按钮进行修改";
							myDaily.submit.visible = false;
							break;
						}
					}
					
				}else{
					myDaily.table.array= null;	
				}
			}else{
				popu(data.msg);
			}
		}	
	}
}