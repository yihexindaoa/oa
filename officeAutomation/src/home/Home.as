package home
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import game.ui.homePage.HomeEvent;
	import game.ui.homePage.HomePageUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Clip;
	import morn.core.components.Label;
	
	import notice.NoticeDetail;
	
	import trade.Trade;

	/**
	 * 首页
	 * @author QS
	 * 
	 */	
	public class Home extends Trade
	{
		protected var _container:Sprite;
		protected var homeUI:HomePageUI;
		protected var noticeManager:Box;
		protected var agencyBusiness:Box;
		protected var detail:NoticeDetail;//显示通知详情
		/**
		 *首页 
		 * @param container
		 * 
		 */		
		public function Home(container:Sprite)
		{
			_container = container;
			initHome();
			super.initPopu(container,homeUI);
			queryNotice();
		}
		
		/**初始化首页**/
		private function initHome():void
		{
			homeUI = new HomePageUI();
			homeUI.x = 161;
			generateNotificationManagement();
			generateAgencyBusiness();
		}
		
		/**生成通知告示管理模块**/
		private function generateNotificationManagement():void{
			noticeManager = new Box();
			noticeManager.graphics.beginFill(0x066480,0.5);
			noticeManager.graphics.drawRoundRect(0,0,260,160,30,30);
			noticeManager.graphics.lineStyle(1,0x0);
			noticeManager.graphics.moveTo(0,25);
			noticeManager.graphics.lineTo( 250,25 );
			noticeManager.x = 30
			noticeManager.y = 50;
			homeUI.addChild(noticeManager);
			
			var clip:Clip = new Clip("png.comp.clip_timg",4,4);
			clip.index = 1;
			clip.width = 21;
			clip.height = 19;
			clip.x = 8;
			clip.y = 5;
			noticeManager.addChild(clip);
			
			var tip:Label = new Label("通知告示");
			tip.x = 28;
			tip.y = 5;
			noticeManager.addChild(tip);
			
			var more:Button = new Button(null,"更多 >>");
			more.buttonMode = true;
			more.x = 215;
			more.y = 5;
			more.graphics.beginFill(0xffffff,0.1);
			more.graphics.drawRect(0,0,more.width,more.height);
			noticeManager.addChild(more);
			more.addEventListener(MouseEvent.CLICK, onNoticeHandler);
			detail = new NoticeDetail(_container);
			
		}
		
		
		protected function queryNotice():void{
			var req:Object = new Object();
			req.pageNum = 1;
			req.pageSize = 5;
			
			send("notice/noticePageInfo",req, function(data:Object):void{
				var list:Array = data.data;
				if(list.length < 0){
					popu("没有数据记录！");
					return;
				};
				for( var i:int = 0, m:int = list.length ; i < m ;i++){
					if(i>5)break;//一般显示五条数据
					var item:Object = list[i];
					var button:Button  = new Button(null,item.typeName+"-"+item.title);
					button.buttonMode = true;
					button.x = 10;
					button.y = 40+i*20;
					button.name = item.id;
					button.graphics.beginFill(0xffffff,0.1);
					button.graphics.drawRect(0,0,button.width,button.height);
					noticeManager.addChild(button);
					button.addEventListener(MouseEvent.CLICK, onNoticeDetailHandler);
				}
			}, function(v:String):void{
				popu(v);
			},URLRequestMethod.POST);
		}
		
		/**首页显示通告详情**/
		protected function onNoticeDetailHandler(e:MouseEvent):void
		{
			detail.showDetail( parseInt((e.target as Button).name) );
		}
		
		/**由更多转到通知**/
		protected function onNoticeHandler(e:MouseEvent):void
		{
			dispatchEvent( new HomeEvent(HomeEvent.NAME, "通知告示统计表") );
		}		
		
		
		/**生成代办事务模块**/
		protected function generateAgencyBusiness():void{
			
			agencyBusiness = new Box();
			agencyBusiness.graphics.beginFill(0x066480,0.5);
			agencyBusiness.graphics.drawRoundRect(0,0,260,160,30,30);
			agencyBusiness.graphics.lineStyle(1,0x0);
			agencyBusiness.graphics.moveTo(0,25);
			agencyBusiness.graphics.lineTo( 250,25 );
			agencyBusiness.x = 320
			agencyBusiness.y = 50;
			homeUI.addChild(agencyBusiness);
			
			var clip:Clip = new Clip("png.comp.clip_timg",4,4);
			clip.index = 2;
			clip.width = 21;
			clip.height = 19;
			clip.x = 8;
			clip.y = 5;
			agencyBusiness.addChild(clip);
			
			var tip:Label = new Label("待办事务");
			tip.x = 28;
			tip.y = 5;
			agencyBusiness.addChild(tip);
			
			var more:Button = new Button(null,"更多 >>");
			more.buttonMode = true;
			more.x = 215;
			more.y = 5;
			more.graphics.beginFill(0xffffff,0.1);
			more.graphics.drawRect(0,0,more.width,more.height);
			agencyBusiness.addChild(more);
			more.addEventListener(MouseEvent.CLICK, onAgencyBusinessHandler);
		}
		
		protected function onAgencyBusinessHandler(e:MouseEvent):void
		{
			popu("暂时无此功能");
		}
	}
}