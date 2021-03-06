package authority
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.role.EditUserUI;
	import game.ui.role.UserMangUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.ComboBox;
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
		protected var _page:PageFlip;
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
			_page = new PageFlip();
			_page.x = 48;
			_page.y = 317;
			_page.setWidth(818);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			_user.addChild(_page);
			_edit.saveBtn.addEventListener(MouseEvent.CLICK, onSaveHandler);
			_user.queryBtn.addEventListener(MouseEvent.CLICK, onFindAllLinkEmployHandler);
		}
		
		/**模糊查询**/
		protected function onFindAllLinkEmployHandler(e:MouseEvent):void
		{
			var req:Object = new Object();
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			req.queryCriteria = _user.queryTxt.text;
			send("employeeInformation/findAllLinkEmploy",req, function(data:Object):void{
				if(data.status == 200){
					if(data.data.length > 0){
						_user.table.array = data.data;
						_user.table.repeatY = data.data.length;
					}
					
					_page.y = _user.table.y+data.data.length*38;
					_page.totalPage = data.total;
				}else{
					popu(data.msg);
				}
			}, function(v:String):void{
				popu(v);
			},URLRequestMethod.POST);
		}
		
		/**新增编辑用户**/
		protected function onSaveHandler(e:MouseEvent):void
		{
			var req:Object = new Object();
			
			req.userName = _edit.nmeTxt.text ;
			req.password = _edit.password.text;
			req.workNumber = _edit.workNumber.text;
			req.positionId = _edit.positionInformation.selectedIndex;
			req.officeId = _edit.officeId.selectedIndex;
			
			if(_edit.title.text == "新增用户"){
				req.loginName = _edit.accountTxt.text ;
				send("user/saveUser", req, function(data:Object):void{
					if(data.status == 200){
						_edit.close();
						popu("新增成功!");
						queryUser(  function(d:Object):void{
							for(var i:int = 0;i<d.data.length;i++){
								if(d.data[i].loginName == req.loginName){
									//添加用户对应角色
									var userRoleReq:Object = new Object();
									userRoleReq.roleId = _edit.positionInformation.key;
									userRoleReq.userId = d.data[i].id;
									send("userRole/save", userRoleReq , function(data:Object):void{
										if(data.status == 200){
											
										}else{
											popu(data.msg);
										}
									},function(v:String):void{
										popu(v);
									},URLRequestMethod.POST);
									break;
								}
							}
							
						
						}  );
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},URLRequestMethod.POST);
				
			}else{
				req.id = _edit.id.text;
				send("user/updateUser", req, function(data:Object):void{
					if(data.status == 200){
						_edit.close();
//						popu("修改成功!");
						popu(data.msg);
						queryUser(function(d:Object):void{
							for(var i:int = 0;i<d.data.length;i++){
								if(d.data[i].loginName == _edit.accountTxt.text){
									//添加用户对应角色
									var userRoleReq:Object = new Object();
									userRoleReq.roleId = _edit.positionInformation.key;
									userRoleReq.userId = d.data[i].id;
									send("userRole/update", userRoleReq , function(data:Object):void{
										if(data.status == 200){
											
										}else{
											popu(data.msg);
										}
									},function(v:String):void{
										popu(v);
									},URLRequestMethod.POST);
									break;
								}
							}
							
							
						});
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},URLRequestMethod.POST);
			}
		}
		
		/**查询用户信息**/
		protected function queryUser( func:Function = null ):void{
			var req:Object = new Object();
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			send("user/findByUser",req, function(data:Object):void{
				if(data.status == 200){
					if(data.data.length > 0){
						
						
						var ids:Object = {};
						
						send("role/findAllRole", {}, function(dat:Object):void{
							
							if(dat.data.length>0){
								
								for(var i:int ,m:int =  dat.data.length;i < m ; i++){
									ids[dat.data[i].id] = dat.data[i].roleNumber;
								}
								
							}
							for(var j:int ,n:int =  data.data.length;j < n ; j++){
								data.data[j].positionInformation=ids[data.data[j].positionId ];
							}
							_user.table.array = data.data;
							_user.table.repeatY = data.data.length;
						}, function(v:String):void{
							
						},"POST");
						
					}
					if(func)
					func(data);
					_page.y = _user.table.y+data.data.length*38;
					_page.totalPage = data.total;
				}else{
					popu(data.msg);
				}
			}, function(v:String):void{
				popu(v);
			},URLRequestMethod.POST);
		}
		protected function queryTableHandler(e:PageEvent):void
		{
			queryUser();
		}
		
		
		protected function onAddHandler(e:MouseEvent):void
		{
			_edit.title.text = "新增用户";
			_edit.show();
			_edit.accountTxt.editable = true;
			_edit.nmeTxt.editable = true;
		}
		
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < _user.table.length) {
				var editBtn:Button = cell.getChildByName("editBtn") as Button;
				editBtn.addEventListener(MouseEvent.CLICK,onEditHandler);
				var adbleBtn:Button = cell.getChildByName("adbleBtn") as Button;//启用
				adbleBtn.addEventListener(MouseEvent.CLICK, onEnadleHandler);
				var deleteBtn:Button = cell.getChildByName("deleteBtn") as Button;
				deleteBtn.addEventListener(MouseEvent.CLICK,onDeleteHandler);
				var disBtn:Button = cell.getChildByName("disBtn") as Button;//禁用
				disBtn.addEventListener(MouseEvent.CLICK,onDisableHandler);
			}
		}
		
		/**禁用**/
		protected function onDisableHandler(e:MouseEvent):void
		{
			popu("暂时无此功能");
		}
		
		/**删除**/
		protected function onDeleteHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var req:Object = new Object();
			req.id = (cell.getChildByName("id") as Label).text;
			req.delFlag = 0;
			popuConfirm("确定要删除“"+(cell.getChildByName("userName") as Label).text+"”用户",function():void{
				send("user/updateUser", req, function(data:Object):void{
					if(data.status == 200){
						
						popu("删除成功!");
						queryUser();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},URLRequestMethod.POST);
			});
			
		}
		
		/**启用**/
		protected function onEnadleHandler(e:MouseEvent):void
		{
			popu("暂时无此功能");
		}
		
		protected function onEditHandler(e:MouseEvent):void
		{
			
			
			_edit.title.text = "编辑用户";
			var cell:Box = e.target.parent as Box;
			_edit.accountTxt.text = (cell.getChildByName("loginName") as Label).text;
			_edit.nmeTxt.text = (cell.getChildByName("userName") as Label).text;
			_edit.accountTxt.editable = false;
			_edit.nmeTxt.editable = false;
			_edit.workNumber.text = (cell.getChildByName("workNumber") as Label).text;
			
			_edit.officeId.selectedLabel = (cell.getChildByName("officeId") as ComboBox).selectedLabel;
			_edit.id.text = (cell.getChildByName("id") as Label).text;
//			_edit.accountTxt.text = (cell.getChildByName("loginName") as Label).text;
//			_edit.accountTxt.text = (cell.getChildByName("loginName") as Label).text;
			queryRole();
			/**查询所有角色**/
			function queryRole():void{
				var req:Object = new Object();
				
				send("role/findAllRole", req, function(data:Object):void{
					var ids:String = "";
					var labels:String = "";
					if(data.data.length>0){
						
						for(var i:int ,m:int =  data.data.length;i < m ; i++){
							if(i<m-1){
								ids+=data.data[i].id+",";
								labels+=data.data[i].roleNumber+",";
							}else{
								ids+=data.data[i].id;
								labels+=data.data[i].roleNumber;
							}
						}
						_edit.positionInformation.keys = ids;
						_edit.positionInformation.labels = labels;
						_edit.positionInformation.selectedLabel = (cell.getChildByName("positionInformation") as Label).text;
					}
					
				}, function(v:String):void{
					
				},"POST");
			};
			_edit.show();
		}
	}
}