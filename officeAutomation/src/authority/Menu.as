package authority
{
	import flash.display.Sprite;
	
	import trade.Trade;
	
	import game.ui.role.EntryMenuUI;

	public class Menu extends Trade
	{
		protected var _container:Sprite;
		protected var menu:EntryMenuUI;
		public function Menu(container:Sprite)
		{
			_container = container;
			initMenu();
			super.initPopu(container,menu);
			
		}
		
		/**初始化菜单管理**/
		private function initMenu():void
		{
			menu = new EntryMenuUI();
			_container.addChild(menu);
			menu.x = 161;
		}
		
		
		
	}
}