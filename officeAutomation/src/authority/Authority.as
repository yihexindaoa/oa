package authority
{
	import flash.display.Sprite;
	import flash.events.Event;
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
		protected var parent_menu:Array;//父菜单
		protected var son_menu:Object;//子菜单
		protected var roleMenu:RoleMenu;//菜单权限
//		protected var currentRoleId:int ;//当前选择的角色id
		public function Authority(container:Sprite)
		{
			_container = container;
			initNuth();
			super.initPopu(container,role);
			queryRole();
			findAllMenu();
		}
		
		protected function initNuth():void
		{
			role = new RoleManagementUI();
			_container.addChild(role);
			role.x = 161;
			roleMenu = new RoleMenu(_container);
			
			edit = new RoleEditUI(); 
			edit.confirmBtn.addEventListener(MouseEvent.CLICK, onAddAndEditHandler);
			role.table.renderHandler = new Handler(listRender);
			role.addBtn.addEventListener(MouseEvent.CLICK, onAddHandler);
			son_menu = new Object();
//			role.table.array=[{roleId:"111",roleCode:"222",roleNme:"习近平"},{roleId:"112",roleCode:"223",roleNme:"李克强"}];
			//role.table.mouseHandler = new Handler(onCheckListMouse);
			role.queryBtn.addEventListener(MouseEvent.CLICK, onQueryHandler);
			addEventListener("CLOSETRADE", hideConFunc);
			addEventListener("SHOWTRADE", showConFunc);
		}
		
		/**显示con**/
		protected function showConFunc(e:Event):void
		{
			roleMenu.show();
		}
		
		/**隐藏con**/
		protected function hideConFunc(e:Event):void
		{
			roleMenu.hide();
		}
		
		
		/**模糊查询**/
		protected function onQueryHandler(e:MouseEvent):void
		{
			queryRole();
		}
		
		protected function onAddAndEditHandler(e:MouseEvent):void
		{
			var req:Object = new Object();
			req.rolename = edit.rolename.text;
			req.roleNumber = edit.roleNumber.selectedLabel;
			
			if(edit.title.text == "添加角色"){
				
				
				send("role/saveRole", req, function(data:Object):void{
					if(data.status == 200){
					edit.close();
					popu("添加成功!");
					queryRole();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
				
			}else if(edit.title.text == "编辑角色"){
				req.id = edit.id.text;
				send("role/updateRole", req, function(data:Object):void{
					if(data.status == 200){
						edit.close();
						popu("修改成功!");
						queryRole();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
			}
		}
		
		protected function onAddHandler(e:MouseEvent):void
		{
			edit.title.text = "添加角色";
			edit.show();
		}
		
		
		/**查询所有角色**/
		protected function queryRole():void{
			var req:Object = new Object();
			if(role.queryTxt.text!="")
			req.rolename = role.queryTxt.text;
			send("role/findAllRole", req, function(data:Object):void{
				if(data.data.length>0){
					role.table.repeatY = data.data.length;
					role.table.array = data.data;
				}
				
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
				var deleteBtn:Button = cell.getChildByName("deleteBtn") as Button;
				deleteBtn.addEventListener(MouseEvent.CLICK, onDeleteHandler);
				var setBtn:Button = cell.getChildByName("setBtn") as Button;
				setBtn.addEventListener(MouseEvent.CLICK, onSetBtnHandler);
//				label.text = "这里是:" + index;
				cell.graphics.beginFill(0x55ccee,0.5);
				cell.graphics.drawRect(0,0,cell.width+5,cell.height+5);
				cell.addEventListener(MouseEvent.MOUSE_OVER, onOverHandler);
				cell.addEventListener(MouseEvent.MOUSE_OUT, onOutHandler);
			}
		}
		
		/**查询所有的菜单**/
		protected function findAllMenu():void{
			send("levelMenu/findAllMenu", {}, function(data:Object):void{
				if(data.status == 200){
					
					parent_menu = sortOn( "menuOrder", separatorArray("menuSeries",data.data, 1));
					for( var i:int = 0, m:int = parent_menu.length; i<m ; i++ ){
						roleMenu.createParentMenu(parent_menu[i]);
						son_menu[ parent_menu[i].id ] = sortOn( "menuOrder", separatorArray("parentMenuid",data.data,  parent_menu[i].id ));
						for( var j:int=0,n:int = son_menu[ parent_menu[i].id ].length ; j < n ; j++ ){
							roleMenu.createChildMenu(son_menu[ parent_menu[i].id ][j]);
						}
					}
					
					roleMenu.posMenu();
					
					
				}else{
					popu(data.msg);
				}
			},function(v:String):void{
				popu(v);
			},"POST");
		}
		
		
		/*权限设置*/
		protected function onSetBtnHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var id:Label = cell.getChildByName("id") as Label;
			var req:Object = new Object();
			req.roleId = id.text;
			roleMenu.roleId = req.roleId;
			roleMenu.setTitle("角色编码："+(cell.getChildByName("roleNumber") as Label).text+"角色名称:"+(cell.getChildByName("rolename") as Label).text);
			send("roleMenuAuth/findByAuth", req, function(data:Object):void{
				if(data.status == 200){
					roleMenu.show();
					roleMenu.checkList(data.data);
				}else{
					popu(data.msg);
				}
			},function(v:String):void{
				popu(v);
			},"POST");
		}
		
		/**
		 *根据菜单id 
		 * @param levelMenuid
		 * @return 
		 * 
		 */		
//		protected function queryMenuOfone( levelMenuid:int ):void{
//			for( var i:int = 0, m:int = parent_menu.length; i<m ; i++ ){
//				var p:Object = parent_menu[i];
//				if(p.id == levelMenuid)return p;
//				for( var j:int = 0, n:int = son_menu[ p.id ].length ; j < n ; j++ ){
//					var s:Object = son_menu[ p.id ][j];
//					if(s.id == levelMenuid)return s;
//				}
//			}
//		}
		
		
		/*删除角色*/
		protected function onDeleteHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var rolename:Label = cell.getChildByName("rolename") as Label;
			popuConfirm("确定删除角色“"+rolename.text+"”的记录！", function():void{
				var req:Object = new Object();
				req.id = (cell.getChildByName("id") as Label).text;
				req.delFlag = 0;
				send("role/updateRole", req, function(data:Object):void{
					if(data.status == 200){
						popu("删除成功!");
						queryRole();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
			});
		}
		
		/**/
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
		
		/**/
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
			edit.id.text = (cell.getChildByName("id") as Label).text;
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