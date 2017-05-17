package authority
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.role.EditInforUI;
	import game.ui.role.InforUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.CheckBox;
	import morn.core.components.Label;
	import morn.core.components.List;
	import morn.core.handlers.Handler;
	
	import trade.Trade;

	/**
	 * 员工信息
	 * @author QS
	 * 
	 */	
	public class Infor extends Trade
	{
		protected var _container:Sprite;
		protected var _infor:InforUI;
		protected var _edit:EditInforUI;
		protected var _list:Array;
		protected var _page:PageFlip;
		protected var currentIndex:int = 0;//目前选择的table，index
		protected var shape:Shape ;
		protected var contentShape:Shape;//内容
		public function Infor(container:Sprite)
		{
			_container = container;
			initInfor();
			super.initPopu(container,_infor);
			initInfoEdit();
			queryAllInfo();
		}
		
		private function initInfor():void
		{
			_infor = new InforUI();
			_container.addChild(_infor);
			_infor.x = 161;
			shape = new Shape();
			_infor.panelTable.addChildAt(shape,0);
			shape.graphics.lineStyle(2,0x000000);
			shape.graphics.moveTo(0,0);
			shape.graphics.lineTo(0,75);
			shape.graphics.lineTo(2482,75);
			shape.graphics.lineTo(2482,0);
			shape.graphics.lineTo(0,0);
//			shape.graphics.drawRect(0,0,70,158);
			shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(0,0,70,75);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(70,0,70,75);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(140,20,60,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(200,20,60,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(260,20,90,55);
//			//听说读写
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(350,20,120,20);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(350,40,30,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(380,40,30,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(410,40,30,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(440,40,30,35);
			//QQ
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(470,20,60,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(530,20,60,55);
			//工作邮箱
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(590,20,120,20);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(590,40,60,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(650,40,60,35);
			//紧急联系电话
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(710,20,95,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(805,20,105,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(910,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1010,20,60,55);
			//毕业院校
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1070,20,90,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1160,20,90,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1250,20,50,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1300,20,95,55);
			//出生年月
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1395,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1495,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1595,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1695,20,80,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1775,20,70,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1845,20,100,55);
			//生日信息
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1945,20,300,20);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1945,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2020,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2095,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2170,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2245,20,95,55);
			//私人信息
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1070,0,1270,20);
			
			//操作
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2340,0,142,75);
			
			contentShape = new Shape();
			_infor.panelTable.addChild(contentShape);
			
		}
		
		/**初始化编辑**/
		protected function initInfoEdit():void{
			_edit = new EditInforUI();
			
			_page = new PageFlip();
			_page.x = 5;
			_page.y = 300;
			_page.setWidth(760);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			_infor.addChild(_page);
			_infor.panelTable.height = 700;
			_edit.inductionTime.setCalendar(_edit);
			_edit.contractStartTime.setCalendar(_edit);
			_edit.graduationTime.setCalendar(_edit);
			_edit.dateBirth.setCalendar(_edit);
			_edit.creationTime.setCalendar(_edit);
			_edit.personalBirthday.setCalendar(_edit);
			_edit.parentsBirthday.setCalendar(_edit);
			_edit.childrenBirthday.setCalendar(_edit);
			_edit.spouseBirthday.setCalendar(_edit);
			_edit.dateBirth.setCalendar(_edit);
			_edit.saveBtn.addEventListener(MouseEvent.CLICK, onEditHandler);
			_infor.addBtn.addEventListener(MouseEvent.CLICK, onAddHandler);
			
			_infor.table.renderHandler = new Handler(listRender);
		}
		
		protected function queryTableHandler(e:PageEvent):void
		{
			queryAllInfo();
		}
		
		/**查询所有员工信息**/
		protected function queryAllInfo():void{
			var req:Object = new Object();
			req.pageNum= _page.currentPage;
			req.pageSize = _page.pageSize;
			send("employeeInformation/findAllEmploy",req,function(data:Object):void{
				if(data.data && data.data.length > 0){
					contentShape.graphics.clear();
					var len:int = data.data.length;
					_list = [];
					for(var i:int = 0;i<len;i++ ){
						var a:Object = data.data[i];
						var item:Object = new Object();
						for(var key:String in a){
							if(a[key]){
								item[key]=a[key];
							}
							
						}
						_list.push(item);
						contentShape.graphics.beginFill(0x000000,0.5);
						contentShape.graphics.drawRect(0,i*45+75,2482,30);
					}
					
					
					_infor.table.array = _list;
					_infor.table.repeatY = len;
					_infor.panelTable.height = 100+45*len
					_page.y = 140+_infor.panelTable.height;
					_page.totalPage = data.total;
				}
			},function(v:String):void{
				popu(v);
			},"POST");
		}
		
		/**按照指定的逻辑渲染List*/
		private function listRender(cell:Box, index:int):void {
			if (index < _infor.table.length) {
				
				var modify:Button = cell.getChildByName("modfiyBtn") as Button;
				modify.addEventListener(MouseEvent.CLICK, onModifyHandler);
				var deleteBtn:Button = cell.getChildByName("deleteBtn") as Button;
				deleteBtn.addEventListener(MouseEvent.CLICK, onDeleteHandler);
				var detailsBtn:Button = cell.getChildByName("detailsBtn") as Button;
				detailsBtn.addEventListener(MouseEvent.CLICK, onDetailsHandler);
				cell.tag = new Object();
				cell.tag.index = index;
			}
		}
		
		protected function onDeleteHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			popuConfirm("确定删除“"+(cell.getChildByName("name") as Label).text+"”的信息吗！", function():void{
				var req:Object = new Object();
				req.id = (cell.getChildByName("id") as Label).text;
				send("employeeInformation/delectEmploy", req, function(data:Object):void{
					if(data.status == 200){
						popu("删除成功!");
						queryAllInfo();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
			});
		}
		
		/**显示员工信息详情**/
		protected function onDetailsHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var data:Object = new Object();
			var item:Object = _list[cell.tag.index]  ;
			for( var key:String in item ){
				
				if(key == "inductionTime")
					data["employee_inductionTime"] = item["inductionTime"];
				else if(key == "contractStartTime")
					data["employee_contractStartTime"] = item["contractStartTime"];
				else if(key == "graduationTime")
					data["employee_graduationTime"] = item["graduationTime"];
				else if(key == "dateBirth")
					data["employee_dateBirth"] = item["dateBirth"];
				else if(key == "personalBirthday")
					data["employee_personalBirthday"] = item["personalBirthday"];
				else if(key == "parentsBirthday")
					data["employee_parentsBirthday"] = item["parentsBirthday"];
				else if(key == "childrenBirthday")
					data["employee_childrenBirthday"] = item["childrenBirthday"];
				else if(key == "spouseBirthday")
					data["employee_spouseBirthday"] = item["spouseBirthday"];
				else if(key == "creationTime")
					data["employee_creationTime"] = item["creationTime"];
				else
					data[key] = item[key];
			}
			
			trace("cell.tag.index=",cell.tag.index);
			_edit.dataSource = data;
			_edit.title.text = "详情";
			
			_edit.show();
		}
		
		/**修改员工信息**/
		protected function onModifyHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			var data:Object = new Object();
			var item:Object = _list[cell.tag.index]  ;
			for( var key:String in item ){
				
				if(key == "inductionTime")
					data["employee_inductionTime"] = item["inductionTime"];
				else if(key == "contractStartTime")
					data["employee_contractStartTime"] = item["contractStartTime"];
				else if(key == "graduationTime")
					data["employee_graduationTime"] = item["graduationTime"];
				else if(key == "dateBirth")
					data["employee_dateBirth"] = item["dateBirth"];
				else if(key == "personalBirthday")
					data["employee_personalBirthday"] = item["personalBirthday"];
				else if(key == "parentsBirthday")
					data["employee_parentsBirthday"] = item["parentsBirthday"];
				else if(key == "childrenBirthday")
					data["employee_childrenBirthday"] = item["childrenBirthday"];
				else if(key == "spouseBirthday")
					data["employee_spouseBirthday"] = item["spouseBirthday"];
				else if(key == "creationTime")
					data["employee_creationTime"] = item["creationTime"];
				else
					data[key] = item[key];
			}
			_edit.dataSource = data;
			_edit.title.text = "修改";
			
			_edit.show();
		}		
		
		protected function onEditHandler(e:MouseEvent):void
		{
			if(_edit.title.text == "新增"){
				send("employeeInformation/saveEmploy", getData(_edit), function(data:Object):void{
					popu(data.msg);
					
					if(data.status == 200){
						_edit.close();
						queryAllInfo();
					}
				},function(v:String):void{popu(v)},"POST");
			}else if(_edit.title.text == "修改"){
				send("employeeInformation/updateEmploy", getData(_edit), function(data:Object):void{
					popu(data.msg);
					
					if(data.status == 200){
						_edit.close();
						queryAllInfo();
					}
				},function(v:String):void{popu(v)},"POST");
			}
		}
		
		protected function onAddHandler(e:MouseEvent):void
		{
			clear(_edit);
			_edit.title.text = "新增";
			
			_edit.show();
		}
		
	}
}