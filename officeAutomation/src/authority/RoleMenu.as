package authority
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import game.ui.role.RoleControlUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.CheckBox;
	import morn.core.components.Clip;
	import morn.core.components.Label;
	
	import trade.Trade;

	/**
	 * 
	 * @author QS
	 * 
	 */	
	public class RoleMenu extends Trade
	{
		protected var _container:Sprite;
		protected var con:RoleControlUI;//菜单权限
		protected var boxContainer:Box;
		protected var saveBtn:Button;//保存角色菜单设置按钮
		protected var modfiyBtn:Button;//修改角色权限按钮
		protected var _roleId:int;
		/**
		 *保存所有的菜单box 
		 */		
		protected var _boxList:Array ;
		/**
		 * 
		 * @param container
		 * 
		 */		
		public function RoleMenu(container:Sprite)
		{
			_container = container;
			initRoleMenu();
			super.initPopu(container,con);
		}
		
		private function initRoleMenu():void
		{
			con = new RoleControlUI();
			con.x = 960;
			_container.addChild(con);
			_boxList = new Array();
			boxContainer = new Box();
			boxContainer.left = 8;
			boxContainer.top = 37;
			con.addChild(boxContainer);
			saveBtn = new Button("png.comp.button","分配");
			saveBtn.x = 20;
			saveBtn.addEventListener(MouseEvent.CLICK, onSaveHandler);
			con.addChild(saveBtn);
			modfiyBtn = new Button("png.comp.button","修改");
			modfiyBtn.x = 90;
			modfiyBtn.addEventListener(MouseEvent.CLICK, onModfiyHandler);
			con.addChild(modfiyBtn);
		}
		
		protected function onModfiyHandler(e:MouseEvent):void
		{
			var count:int=0;
			for(var j:int = 0,n:int = _boxList.length; j<n ;j++){
				var box:Box = _boxList[j];
				var check:CheckBox = box.getChildByName("check") as CheckBox ;
				if(check.selected){
					count++;
					var req:Object = new Object();
					req.roleId = _roleId;
					req.levelMenuid = box.tag.id;
					req.authType = 1;
					send("roleMenuAuth/update", req, function(data:Object):void{
						if(data.status == 200){
							
							count--;
							if(count==0){
								popu("修改成功!");
							}
						}else{
							popu(data.msg);
						}
					},function(v:String):void{
						popu(v);
					},URLRequestMethod.POST);
				}
			}
			
			
		}
		
		protected function onSaveHandler(e:MouseEvent):void
		{
			var count:int=0;
			for(var j:int = 0,n:int = _boxList.length; j<n ;j++){
				var box:Box = _boxList[j];
				var check:CheckBox = box.getChildByName("check") as CheckBox ;
				if(check.selected){
					count++;
					var req:Object = new Object();
					req.roleId = _roleId;
					req.levelMenuid = box.tag.id;
					req.authType = 1;
					send("roleMenuAuth/save", req, function(data:Object):void{
						if(data.status == 200){
							
							count--;
							if(count==0){
								popu("分配成功!");
							}
						}else{
							popu(data.msg);
						}
					},function(v:String):void{
						popu(v);
					},URLRequestMethod.POST);
				}
			}
			
			
		}
		
		/**
		 *创建父菜单 
		 * @param menu
		 * 
		 */		
		public function createParentMenu( menu:Object ):void{
			var box:Box = new Box();
			var clip:Clip = new Clip("png.comp.clip_tree_arrow");
			clip.index = 0;
			clip.name = "clip";
			box.addChild(clip);
			var check:CheckBox = new CheckBox("png.comp.checkbox");
			check.x = 17;
			check.name = "check";
			box.addChild(check);
			var label:Label = new Label(menu.meunName);
			label.x = 35;
			label.name = "meunName";
			box.addChild(label);
			box.tag = menu;
			_boxList.push(box);
		}
		
		/**
		 * 创建子菜单
		 * @param menu
		 * 
		 */		
		public function createChildMenu( menu:Object ):void{
			var box:Box = new Box();
			var check:CheckBox = new CheckBox("png.comp.checkbox");
			check.x = 29;
			check.name = "check";
			box.addChild(check);
			var label:Label = new Label(menu.meunName);
			label.x = 46;
			label.name = "meunName";
			box.addChild(label);
			box.tag = menu;
			_boxList.push(box);
			
		}
		
		/**
		 *规制所有菜单的位置 
		 * 
		 */		
		public function posMenu():void{
			boxContainer.removeAllChild();
			for( var i:int = 0, m:int = _boxList.length ; i < m ;i++ ){
				var box:Box = _boxList[i];
				box.y = i*25;
				boxContainer.addChild(box);
			};
			saveBtn.y = _boxList.length*25+50;
			modfiyBtn.y = _boxList.length*25+50;
		}
		
		/**
		 * 获取那些菜单check
		 * 
		 */		
		public function checkList(data:Array):void{
			
			clearCheck();
			
			for( var i:int = 0, m:int = data.length ; i<m ;i++ ){
				var d:Object = data[i];
				
				for(var j:int = 0,n:int = _boxList.length; j<n ;j++){
					var box:Box = _boxList[j];
					var c:Object = box.tag;
					
					if(c.id == d.levelMenuid){
						var check:CheckBox = box.getChildByName("check") as CheckBox ;
						check.selected = true;
					}
				}
			}
		}
		
		/**清楚所有的check已选择的**/
		protected function clearCheck():void{
			for(var j:int = 0,n:int = _boxList.length; j<n ;j++){
				var box:Box = _boxList[j];
				var check:CheckBox = box.getChildByName("check") as CheckBox ;
				check.selected = false;
			}
		}

		/**
		 *角色id 
		 */
		public function set roleId(value:int):void
		{
			_roleId = value;
		}

	}
}