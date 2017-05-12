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
			var shape:Shape = new Shape();
			_infor.panelTable.addChildAt(shape,0);
			shape.graphics.lineStyle(2,0x000000);
			shape.graphics.moveTo(0,0);
			shape.graphics.lineTo(0,150);
			shape.graphics.lineTo(2340,150);
			shape.graphics.lineTo(2340,0);
			shape.graphics.lineTo(0,0);
			shape.graphics.drawRect(0,0,70,158);
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
			
			
		}
		
		/**初始化编辑**/
		protected function initInfoEdit():void{
			_edit = new EditInforUI();
			
			_page = new PageFlip();
			_page.x = 82;
			_page.y = 317;
			_page.setWidth(887);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			_infor.panelTable.addChild(_page);
			_infor.panelTable.height = 700;
			_edit.inductionTime.setCalendar(_edit);
			_edit.contractStartTime.setCalendar(_edit);
			_edit.graduationTime.setCalendar(_edit);
			_edit.dateBirth.setCalendar(_edit);
			_edit.creationTime.setCalendar(_edit);
			_edit.personalBirthday.setCalendar(_edit);
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
					_list = data.data;
					
					
					var len:int = _list.length;
					_infor.table.array = data.data;
					_infor.table.repeatY = len;
					_page.y = 165+len*37;
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
				
				var detailsBtn:Button = cell.getChildByName("detailsBtn") as Button;
				detailsBtn.addEventListener(MouseEvent.CLICK, onDetailsHandler);
			}
		}
		
		/**显示员工信息详情**/
		protected function onDetailsHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			_edit.dataSource = _list[cell.tabIndex];
			_edit.title.text = "详情";
			
			_edit.show();
		}
		
		/**修改员工信息**/
		protected function onModifyHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			_edit.dataSource = _list[cell.tabIndex];
			_edit.title.text = "修改";
			
			_edit.show();
		}		
		
		protected function onEditHandler(e:MouseEvent):void
		{
			var req:Object = new Object();
			if(_edit.title.text == "新增"){
				send("employeeInformation/saveEmploy", getData(_edit), function(data:Object):void{
					popu(data.msg);
					if(data.status == 200){
						
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