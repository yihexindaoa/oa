package home
{
	import flash.display.Sprite;
	
	import game.ui.homePage.HomeLeftUI;
	
	import trade.Trade;
	/**
	 * 右边不动的框框
	 * @author QS
	 * 
	 */	
	public class HomeLeft extends Trade
	{
		protected var _container:Sprite;
		protected var homeLeft:HomeLeftUI;
		public function HomeLeft(container:Sprite)
		{
			_container = container;
			initHome();
			super.initPopu(container,homeLeft);
		}
		
		private function initHome():void
		{
			homeLeft = new HomeLeftUI();
			homeLeft.x = 1060;
			_container.addChild(homeLeft);
		}
	}
}