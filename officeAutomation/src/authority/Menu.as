package authority
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import game.ui.menu.EditMenuUI;
	import game.ui.menu.EntryMenuUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Clip;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	

	public class Menu extends Trade
	{
		protected var _container:Sprite;
		protected var menu:EntryMenuUI;
		protected var edit:EditMenuUI;
		protected var parent_menu:Array;//父菜单
		protected var son_menu:Object;//子菜单

		public function Menu(container:Sprite)
		{
			_container = container;
			initMenu();
			super.initPopu(container,menu);
			queryMenu();
		}
		
		/**初始化菜单管理**/
		private function initMenu():void
		{
			menu = new EntryMenuUI();
			_container.addChild(menu);
			menu.x = 161;
			menu.entryBtn.addEventListener(MouseEvent.CLICK, onEntryMenuHandler);
			edit = new EditMenuUI();
			
			edit.confirmBtn.addEventListener(MouseEvent.CLICK, onConfirmHandler);
			edit.menuSeries.addEventListener(Event.CHANGE,onChangeHandler);
			menu.table.renderHandler = new Handler(renderHandler);
			menu.queryBtn.addEventListener(MouseEvent.CLICK, onQueryHandler);
			son_menu = new Object();
		}
		
		/**等级菜单选择**/
		protected function onChangeHandler(e:Event):void
		{
			if(edit.menuSeries.selectedLabel == "1"){//父菜单
				edit.parentMenu.visible = false;
				edit.parentMenuLab.visible = false;
				edit.menuOrder.y = 120;
				edit.menuOrderLab.y = 120;
				edit.menuAddress.y = 151;
				edit.menuAddressLab.y = 151;
				edit.height = 214;
			}else if(edit.menuSeries.selectedLabel == "2"){//子菜单
				edit.parentMenu.visible = true;
				edit.parentMenuLab.visible = true;
				edit.menuOrder.y = 151;
				edit.menuOrderLab.y = 151;
				edit.menuAddress.y = 182;
				edit.menuAddressLab.y = 182;
				edit.height = 245;
			}
		}
		
		/**查询所有菜单**/
		protected function onQueryHandler(e:MouseEvent):void
		{
			queryMenu();
		}		
	
		private function renderHandler(cell:Box, index:int):void
		{
			if(menu.table.length > 0){
				var edit:Button = cell.getChildByName("edit") as Button;
				edit.addEventListener(MouseEvent.CLICK, onUpdateHandler);
				var deleteBtn:Button = cell.getChildByName("delete") as Button;
				deleteBtn.addEventListener(MouseEvent.CLICK, onDeleteHandler);
			}
		}
		
		/**删除**/
		protected function onDeleteHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			popuConfirm("确定删除“"+(cell.getChildByName("meunName") as Label).text+"”菜单！", function():void{
				var req:Object = new Object();
				req.id = edit.id.text;
				req.delFlag = 0;
				send("levelMenu/update", req, function(data:Object):void{
					if(data.status == 200){
						popu("删除成功!");
						queryMenu();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
			});
		}
		
		/**显示修改菜单**/
		protected function onUpdateHandler(e:MouseEvent):void
		{
			edit.title.text = "编辑菜单";
			var cell:Box = e.target.parent as Box;
			var meunName:Label = cell.getChildByName("meunName") as Label;
			var menuOrder:Label = cell.getChildByName("menuOrder") as Label;
			edit.meunName.text = meunName.text;
			edit.menuOrder.text = menuOrder.text;
			edit.menuAddress.text = (cell.getChildByName("menuAddress") as Label).text;
			edit.menuSeries.selectedLabel = ( cell.getChildByName("menuSeries") as Label).text;
			edit.id.text = (cell.getChildByName("id") as Label).text;
			edit.show();
		}
		
		/**查询菜单**/
		protected function queryMenu():void{
			send("levelMenu/findAllMenu", {}, function(data:Object):void{
				if(data.status == 200){
					if(data.data.length>0){ 
//						var list:Array = new Array();
						menu.table.repeatY = data.data.length;
//						menu.table.array = data.data;
						menu.table.array = [];
						parent_menu = sortOn( "menuOrder", separatorArray("menuSeries",data.data, 1));
						for(var c:int = 0;c<parent_menu.length;c++){
//							trace("parent_menu[c].meunName=",parent_menu[c].meunName);
							menu.table.addItemAt( parent_menu[c],c);
						}
						var str:String = "";
						var currentIndex:int =0;
						var len:int  =0;
						for( var i:int = 0, m:int = parent_menu.length; i < m ; i++ ){
							if(i < m - 1 )
								str += parent_menu[i].meunName +",";
							else
								str += parent_menu[i].meunName;
							son_menu[ parent_menu[i].id ] = sortOn( "menuOrder", separatorArray("parentMenuid",data.data,  parent_menu[i].id ));
							
							
							if(i>0){
								len+=son_menu[ parent_menu[i-1].id ].length;
								currentIndex = i+len;//当前父菜单的位置
							}
									
							var cell:Box = menu.table.getCell(currentIndex);
							var clip:Clip = cell.getChildByName("clip") as Clip;
							clip.visible = true;
							clip.tag = new Object();
							clip.tag.index = i;
							
							if(son_menu[ parent_menu[i].id ] && son_menu[ parent_menu[i].id ].length>0){
								clip.addEventListener(MouseEvent.CLICK, onClipHandler);
								clip.index = 1;
								if(i>0)
								clip.tag.index = currentIndex;
								
								for( var j:int=0,n:int = son_menu[ parent_menu[i].id ].length ; j < n ; j++ ){
									menu.table.addItemAt( son_menu[ parent_menu[i].id ][j] , currentIndex+j+1 );
								}
							}
						}
						
						edit.parentMenu.labels = str;
					}
						
						
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},URLRequestMethod.POST);
		}
		
		protected function onClipHandler(e:MouseEvent):void
		{
			var parentMenuBox:Box = (e.target as Clip).parent as Box;
			var index:int = parseInt((e.target as Clip).tag.index);//menu.table.getChildIndex(parentMenuBox);
			
			if( (e.target as Clip).index == 0 ){//开始父菜单是关闭的,父菜单打开
				(e.target as Clip).index = 1;
				
				for( var i:int = index+1, m:int =  menu.table.length; i < m ; i++ ){
					var cell:Box = menu.table.getCell(i);
					var menuSeries:Label = cell.getChildByName("menuSeries") as Label;
					if(menuSeries.text == "2"){//表示子菜单
						cell.visible = false;
//						menu.table.array.splice(i,1);
						
					}else{
						break;
					}
				}
				
			}else if((e.target as Clip).index == 1){//父菜单关闭
				(e.target as Clip).index = 0;
				for( var i:int = index+1, m:int =  menu.table.length; i < m ; i++ ){
					var cell:Box = menu.table.getCell(i);
					var menuSeries:Label = cell.getChildByName("menuSeries") as Label;
					if(menuSeries.text == "2"){//表示子菜单
						cell.visible = true;
					}else{
						break;
					}
				}
			}
			
			resertTable();
		}
		
		/**根据cell.visible重置表格里面的位置**/
		protected function resertTable():void{
			
			
		}
		
		/**录入和编辑菜单**/
		protected function onConfirmHandler(e:MouseEvent):void
		{
			var req:Object = new Object();
			req.meunName  = edit.meunName.text;
			req.menuSeries = edit.menuSeries.selectedLabel;
			req.menuOrder = edit.menuOrder.text;
			req.menuAddress = edit.menuAddress.text ;
			if(edit.parentMenu.visible){
				req.parentMenuid = parent_menu[edit.parentMenu.selectedIndex].id;
			}
			if(edit.title.text == "录入菜单"){
				
				send("levelMenu/save", req, function(data:Object):void{
					if(data.status == 200){
						edit.close();
						popu("录入成功!");
						queryMenu();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},URLRequestMethod.POST);
			}else{
				req.id = edit.id.text;
				send("levelMenu/update", req, function(data:Object):void{
					if(data.status == 200){
						edit.close();
						popu("修改成功!");
						queryMenu();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
			}
		}
		
		/**显示录入菜单**/
		protected function onEntryMenuHandler(e:MouseEvent):void
		{
			edit.title.text = "录入菜单";
			clear( edit.box );
			edit.show();
		}		
		
		
	}
}