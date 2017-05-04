package authority
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.role.EditUserUI;
	import game.ui.role.UserMangUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Label;
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
			queryUser();
		}
		
		private function initUser():void
		{
			_user = new UserMangUI();
			_container.addChild(_user);
			_user.x = 161;
//			_user.table.array=[{roleId:"111",roleCode:"222",roleNme:"习近平"},{roleId:"112",roleCode:"223",roleNme:"李克强"}];
			_user.table.renderHandler = new Handler(listRender);
			_edit = new EditUserUI();
			_user.addBtn.addEventListener(MouseEvent.CLICK, onAddHandler);
		}
		
		/**查询用户信息**/
		protected function queryUser():void{
			
		}
		
		
		
		protected function onAddHandler(e:MouseEvent):void
		{
			_edit.title.text = "新增用户";
			_edit.show();
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
			_edit.title.text = "编辑用户";
			var cell:Box = e.target.parent as Box;
			_edit.accountTxt.text = (cell.getChildByName("loginName") as Label).text;
			_edit.nmeTxt.text = (cell.getChildByName("userName") as Label).text;
			_edit.accountTxt.text = (cell.getChildByName("loginName") as Label).text;
			_edit.accountTxt.text = (cell.getChildByName("loginName") as Label).text;
			_edit.show();
		}
	}
}