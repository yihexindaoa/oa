package home
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.homePage.HomeEvent;
	import game.ui.homePage.HomePageUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Clip;
	import morn.core.components.Label;
	
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
		}
		
		/**初始化首页**/
		private function initHome():void
		{
			homeUI = new HomePageUI();
			homeUI.x = 161;
			generateNotificationManagement();
			
		}
		
		/**生成通知告示管理模块**/
		private function generateNotificationManagement():void{
			noticeManager = new Box();
			noticeManager.graphics.beginFill(0x3399ff,0.5);
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
		}
		
		/**由更多转到通知**/
		protected function onNoticeHandler(e:MouseEvent):void
		{
			trace("通知");
			dispatchEvent( new HomeEvent(HomeEvent.NAME, "通知告示统计表") );
		}		
		
	}
}