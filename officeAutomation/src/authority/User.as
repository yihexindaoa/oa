package authority
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.role.EditUserUI;
	import game.ui.role.UserMangUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.handlers.Handler;
	
	import trade.Trade;

	/**
	 * 
	 * @author QS
	 * 
	 */	
	public class User extends Trade
	{
		protected var _container:Sprite;
		protected var _user:UserMangUI;
		protected var _edit:EditUserUI;
		public function User(container:Sprite)
		{
			_container = container;
			initUser();
			super.initPopu(container,_user);
		}
		
		private function initUser():void
		{
			_user = new UserMangUI();
			_container.addChild(_user);
			_user.x = 161;
			_user.table.array=[{roleId:"111",roleCode:"222",roleNme:"习近平"},{roleId:"112",roleCode:"223",roleNme:"李克强"}];
			_user.table.renderHandler = new Handler(listRender);
		}
		
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < _user.table.length) {
				var editBtn:Button = cell.getChildByName("editBtn") as Button;
				editBtn.addEventListener(MouseEvent.CLICK,onEditHandler);
			}
		}
		
		protected function onEditHandler(e:MouseEvent):void
		{
			if(!_edit){
				_edit = new EditUserUI();
			}
			if(_edit)_container.addChild(_edit)
		}
	}
}