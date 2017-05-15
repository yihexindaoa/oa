package workreport
{
	import flash.display.Sprite;
	
	import game.ui.workReport.OtherDailyUI;
	
	import trade.Trade;
	
	/**
	 * 他人工作日报
	 */
	public class OtherDaily extends Trade
	{
		protected var _container:Sprite;
		protected var otherDaily:OtherDailyUI;
		protected var req:Object;
		public function OtherDaily(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,otherDaily);
			querySatement();
		}
		
		private function initWork():void
		{
			otherDaily = new OtherDailyUI();
			otherDaily.x = 161;
			_container.addChild(otherDaily);
			req = new Object();
		}
				
		private function onError(e:String):void
		{
			popu(e);
		}
		
		//查询页面加载周报
		private function querySatement():void
		{
			req.pageNum=1;
			req.pageSize=1;
			send("daily/findAllDaily",req,onCompleteHandler,onError,"POST");
			
		}
		
		//如果查询成功则渲染数据
		private function onCompleteHandler(data:Object):void
		{
			if(data.status==200){
				//数据渲染进入列表
				if(data.data!=null && data.data.length >0  ){
					otherDaily.table.array = data.data;
				}else{
					otherDaily.table.array= null;	
				}
			}else{
				popu(data.msg);
			}
		}	
	}
}