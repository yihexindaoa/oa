package authority
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.role.RoleControlUI;
	import game.ui.role.RoleEditUI;
	import game.ui.role.RoleManagementUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	public class Authority extends Trade
	{
		protected var _container:Sprite;
		protected var role:RoleManagementUI ;
		protected var edit:RoleEditUI;//添加或者编辑角色
		public function Authority(container:Sprite)
		{
			_container = container;
			initNuth();
			super.initPopu(container,role);
			queryRole();
		}
		
		protected function initNuth():void
		{
			role = new RoleManagementUI();
			_container.addChild(role);
			role.x = 161;
			var con:RoleControlUI = new RoleControlUI();
			con.x = 960;
			_container.addChild(con);
			edit = new RoleEditUI(); 
			edit.confirmBtn.addEventListener(MouseEvent.CLICK, onAddAndEditHandler);
			role.table.renderHandler = new Handler(listRender);
			role.addBtn.addEventListener(MouseEvent.CLICK, onAddHandler);
//			role.table.array=[{roleId:"111",roleCode:"222",roleNme:"习近平"},{roleId:"112",roleCode:"223",roleNme:"李克强"}];
			//role.table.mouseHandler = new Handler(onCheckListMouse);
		}
		
		protected function onAddAndEditHandler(e:MouseEvent):void
		{
			if(edit.title.text == "添加角色"){
				var req:Object = new Object();
				req.rolename = edit.rolename.text;
				req.roleNumber = edit.roleNumber.selectedIndex;
				send("role/saveRole", req, function(data:Object):void{
					edit.close();
					popu("添加成功!");
					queryRole();
				},function(v:String):void{
					
				},"POST");
				
			}else if(edit.title.text == "编辑角色"){
				
			}
		}
		
		protected function onAddHandler(e:MouseEvent):void
		{
			edit.title.text = "添加角色";
			edit.show();
		}
		
		
		
		protected function queryRole():void{
			send("role/findAllRole", {}, function(data:Object):void{
				role.table.array = data.data;
			}, function(v:String):void{
				popu(v);
			},"POST");
		}
		
		
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < role.table.length) {
//				var label:Label = cell.getChildByName("roleNme") as Label;
				var editBtn:Button = cell.getChildByName("editBtn") as Button;
				editBtn.addEventListener(MouseEvent.CLICK,onEditHandler);
//				label.text = "这里是:" + index;
				cell.graphics.beginFill(0x55ccee,0.5);
				cell.graphics.drawRect(0,0,cell.width+5,cell.height+5);
				cell.addEventListener(MouseEvent.MOUSE_OVER, onOverHandler);
				cell.addEventListener(MouseEvent.MOUSE_OUT, onOutHandler);
			}
		}
		
		protected function onOutHandler(e:MouseEvent):void
		{
			var cell:Box;
			if(e.target is Box){
				cell = e.target as Box;
				
			}else{
				cell = e.target.parent as Box;
			}
			if(cell){
				cell.graphics.clear();
				cell.graphics.beginFill(0x55ccee,0.5);
				cell.graphics.drawRect(0,0,cell.width+5,cell.height+5);
			}
		}
		
		protected function onOverHandler(e:MouseEvent):void
		{
			var cell:Box;
			if(e.target is Box){
				cell = e.target as Box;
				
			}else{
				cell = e.target.parent as Box;
			}
			if(cell){
				cell.graphics.lineStyle(6,0x0cc,0.9);
				cell.graphics.drawRect(-5,-3,cell.width+10,cell.height+13);
			}
		}
		
		protected function onEditHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var rolename:Label = cell.getChildByName("rolename") as Label;
			var roleNumber:Label = cell.getChildByName("roleNumber") as Label;
			trace("edit="+rolename.text);
			edit.title.text = "编辑角色";
			edit.rolename.text = rolename.text;
			edit.roleNumber.selectedLabel = roleNumber.text;
			edit.show();
		}
		
		/**处理选择框选中效果*/
		private function onCheckListMouse(e:MouseEvent, index:int):void {
			var cell:Box = role.table.getCell(index);
			if (e.type == MouseEvent.CLICK) {
				
				var label:Label = cell.getChildByName("roleId") as Label;
				trace(label.text);
			}
		}
	}
}