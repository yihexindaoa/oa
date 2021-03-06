package salary
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import assembly.PageEvent;
	import assembly.PageFlip;
	
	import game.ui.salary.EditSalaryUI;
	import game.ui.salary.WageStatisticsUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	import unitl.date.Calendar;
	import unitl.date.CalendarEvent;

	/**
	 * 工资
	 * @author lq
	 * 
	 */	
	public class Salary extends Trade
	{
		protected var _container:Sprite;
		protected var _salary:WageStatisticsUI;
		protected var _page:PageFlip;
		protected var req:Object;
		protected var calendar:Calendar;
		protected var editSalary:EditSalaryUI;//编辑调薪记录
//		private var ip = "192.168.1.119:8089";
		/**
		 * 工资
		 * @param container
		 * 
		 */		
		public function Salary(container:Sprite)
		{
			_container = container;
//			TweenLite.to(_container,5,{scaleX:0.5,scaleY:0.5});
			initSalary();
			super.initPopu(container,_salary);
			//页面加载时加载页面数据
//			queryNotice();
			onPayrollRecord();
		}
		//初始化
		private function initSalary():void
		{
			_salary = new WageStatisticsUI();
			_salary.x = 161;
			_container.addChild(_salary);
			_page = new PageFlip();
			_page.x = 82;
			_page.y = 317;
			_page.setWidth(887);
			_page.pageSize = 10;
			_page.pageNum = 1;
			_page.addEventListener(PageEvent.CURRENT_PAGE, queryTableHandler);
			_salary.addChild(_page);
			_salary.addBtn.addEventListener(MouseEvent.CLICK, addOaWage);
			_salary.dateTime.addEventListener(MouseEvent.CLICK, onShowCalendar1);
			_salary.year.addEventListener(MouseEvent.CLICK, onShowCalendar2);
			_salary.table.repeatY = _page.pageSize;
			req = new Object();
			_salary.tab01.graphics.beginFill(0xffffff, 0.1);
			_salary.tab01.graphics.drawRect(0,0,_salary.tab01.width,_salary.tab01.height);
			_salary.tab02.graphics.beginFill(0xffffff, 0.1);
			_salary.tab02.graphics.drawRect(0,0,_salary.tab01.width,_salary.tab01.height);
			_salary.addSalaryIncrease.graphics.beginFill(0xffffff, 0.1);
			_salary.addSalaryIncrease.graphics.drawRect(0,0,_salary.tab01.width,_salary.tab01.height);
			_salary.payrollRecord.graphics.beginFill(0xffffff, 0.1);
			_salary.payrollRecord.graphics.drawRect(0,0,_salary.tab01.width,_salary.tab01.height);
			_salary.tab01.addEventListener(MouseEvent.CLICK,onTab01Handler);
			_salary.tab02.addEventListener(MouseEvent.CLICK,onTab02Handler);
			_salary.outputExcel.addEventListener(MouseEvent.CLICK,outputExcel);
			_salary.find.addEventListener(MouseEvent.CLICK,onFind);
			calendar = new Calendar(_salary);
			calendar.addEventListener(CalendarEvent.DATE, onCalendarHandler);
			calendar.addEventListener(CalendarEvent.DATE, onCalendarHandler2);
			_salary.outputExcelSample.addEventListener(MouseEvent.CLICK,downloadExcel);
			_salary.imageOne.addEventListener(MouseEvent.CLICK,onImageOne);
			_salary.outputExcelSalaryIncrease.addEventListener(MouseEvent.CLICK,outputSalaryIncrease);
			_salary.addSalaryIncrease.addEventListener(MouseEvent.CLICK,onAddSalaryIncrease);
			_salary.payrollRecord.addEventListener(MouseEvent.CLICK,onTab02Handler);
			_salary.addSalary.addEventListener(MouseEvent.CLICK,addSalary);
			_salary.table2.renderHandler = new Handler(renderTable2Handler);
			
			editSalary = new EditSalaryUI();
			editSalary.saveBtn.addEventListener(MouseEvent.CLICK, onEditSalaryHandler);
		}
		
		/**编辑调薪记录**/
		protected function onEditSalaryHandler(e:MouseEvent):void
		{
			var req:Object = new Object();
			req.id = editSalary.id.text;
			req.name = editSalary.nameBtn.text ;
			req.position = editSalary.position.text ;
			req.workingTime = editSalary.workingTime.text ;
			req.originalBasicSalary = editSalary.originalBasicSalary.text ;
			req.salaryBasicWage = editSalary.salaryBasicWage.text ;
			req.salaryIncrease = editSalary.salaryIncrease.text;
			send("SalaryIncrease/updateSalaryIncrease",req,function(data:Object):void{
				if(data.status == 200){
					popu("编辑成功!");
					onPayrollRecord();
				}else{
					popu(data.msg);
				}
			},function(v:String):void{
				popu(v);
			},"POST");
		}
		
		/**调薪表格**/
		private function renderTable2Handler(cell:Box, index:int):void
		{
			if(_salary.table2.length>0){
				var edit:Button = cell.getChildByName("edit") as Button;
//				edit.graphics.beginFill(0xffffff, 0.1);
//				edit.graphics.drawRect(0,0,edit.width,edit.height);
				edit.addEventListener(MouseEvent.CLICK, onEditHandler);
				var dele:Button = cell.getChildByName("delete") as Button;
//				dele.graphics.beginFill(0xffffff, 0.1);
//				dele.graphics.drawRect(0,0,dele.width,dele.height);
				dele.addEventListener(MouseEvent.CLICK, onDeleteHandler);
			}
		}
		
		/**删除调薪记录**/
		protected function onDeleteHandler(e:MouseEvent):void
		{trace("删除");
			var cell:Box = e.target.parent as Box;
			
			popuConfirm("确定删除"+(cell.getChildByName("name") as Label).text+"的调薪记录！", function():void{
				var req:Object = new Object();
				req.id = (cell.getChildByName("id") as Label).text;
				send("SalaryIncrease/deleteSalaryIncrease",req,function(data:Object):void{
					if(data.status == 200){
						popu("删除成功!");
						onPayrollRecord();
					}else{
						popu(data.msg);
					}
				},function(v:String):void{
					popu(v);
				},"POST");
			
			});
		}
		
		/**编辑调薪记录表**/
		protected function onEditHandler(e:MouseEvent):void
		{
			var cell:Box = e.target.parent as Box;
			editSalary.id.text = (cell.getChildByName("id") as Label).text;
			editSalary.nameBtn.text = (cell.getChildByName("name") as Label).text;
			editSalary.position.text = (cell.getChildByName("position") as Label).text;
			editSalary.workingTime.text = (cell.getChildByName("workingTime") as Label).text;
			editSalary.originalBasicSalary.text = (cell.getChildByName("originalBasicSalary") as Label).text;
			editSalary.salaryBasicWage.text = (cell.getChildByName("salaryBasicWage") as Label).text;
			editSalary.salaryIncrease.text = (cell.getChildByName("salaryIncrease") as Label).text;
			editSalary.show();
		}
		//导出工资单列表
		private function  outputExcel(e:MouseEvent){
			if(_salary.input.text!=null && _salary.input.text!=""){
				req.input = _salary.input.text;
			}
			if( _salary.dateTime.text!=null&&_salary.dateTime.text!="" ){
				req.date = _salary.dateTime.text;
			}
//			send("OaWage/exportExcel",req,null,onError,"GET");	
			/*[IF-FLASH-BEGIN]*/
			navigateToURL(new URLRequest(path+"OaWage/exportExcel?input="+encodeURI(req.input)+"&&date="+req.date));
			/*[IF-FLASH-END]*/ 
//		__JS__
//		("window.open" +
//			"('http://192.168.1.119:8089/oa_system/OaWage/exportExcel?Inpute='+this.req.Inpute+'&&date='+this.req.date);");
		}
		protected function onShowCalendar1(e:MouseEvent):void
		{
			calendar.show(150,100);
		}
		
		protected function onShowCalendar2(e:MouseEvent):void
		{
			calendar.show(150,100);
		}
		
		/*工资统计表日历选择事件*/
		protected function onCalendarHandler(e:CalendarEvent):void
		{
			_salary.dateTime.text = e.date;
			calendar.hide();
		}
		//新增工资单页面日历选择时间
		private function onCalendarHandler2(e:CalendarEvent):void{
			_salary.year.text = e.date;
			calendar.hide();
		}
		//工资统计表页面
		protected function onTab01Handler(e:MouseEvent=null):void
		{
			_salary.item1.visible = true;
			_salary.item2.visible = false;
			_salary.line.x = 343;
			_page.visible = true;	
			queryNotice();
		}
		//新增工资单
		private function addOaWage(e:MouseEvent){
			_salary.line.x = 343;
			_salary.item1.visible = false;
			_salary.item2.visible = true;
			_page.visible = false;
		}
		//调薪记录
		protected function onTab02Handler(e:MouseEvent):void
		{
			_salary.imageTwo.x = -17;
			_page.visible = true;
			_salary.item3.visible = true;
			_salary.item.visible = false;
			_salary.item5.visible = true;
			_salary.item6.visible = false;
			onPayrollRecord();
		}
		//新增调薪记录
		private function onAddSalaryIncrease(e:MouseEvent){
			_salary.imageTwo.x = 76;
			_page.visible = false;
			_salary.item3.visible = true;
			_salary.item.visible = false;
			_salary.item5.visible = false;
			_salary.item6.visible = true;
		}
		
		//导出样本
		private function downloadExcel(e:MouseEvent){
			navigateToURL(new URLRequest("http://"+path+"OaWage/downloadExcel"));
		}
		
		//页面加载数据查询
		protected function queryNotice():void{
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			req.input = _salary.input.text;
			req.date = calendar.millisecondsNumber;//_salary.dateTime.text;
			send("OaWage/findAllOaWage",req,onCompleteHandler,onError,"GET");
		}
		//点击页码，再次查询页面数据
		protected function queryTableHandler(e:PageEvent):void
		{
			queryNotice();
		}
		//回调错误方法，显示弹框
		private function onError(e:String):void
		{
			popu(e);
		}
		//查询工资单回调方法
		private function onCompleteHandler(data:Object):void
		{
			_page.totalPage = data.total;
			_salary.table.repeatY = _page.pageSize;
			_page.y = _salary.table.y +_salary.table.height*_page.pageSize+95;
			//数据渲染进入列表
			if(data.data!=null && data.data.length >0  ){
				for(var i=0;i<data.data.length ;i++){
					data.data[i]["SerialNumber"] = i+_page.pageSize*(_page.currentPage-1)+1;
				}
				_salary.table.array = data.data;
				
//				popu(data.data);
			}else{
				_salary.table.array= null;	
			}
		}
		//查询按钮
		private function onFind(e:MouseEvent){
			queryNotice();
		}
	
		
		//调薪记录数据查询
		private function onPayrollRecord(){
			req.pageNum = _page.currentPage;
			req.pageSize = _page.pageSize;
			req.input = _salary.input2.text;
			send("SalaryIncrease/findAllSalaryIncrease",req,onComplete,onError,"GET");
		}
		//调薪记录数据查询回调方法
		private function onComplete(data:Object):void
		{
			_page.totalPage = data.total;
			_salary.table.repeatY = _page.pageSize;
			_page.y = _salary.table.y +_salary.table.height*_page.pageSize+95;
			//数据渲染进入列表
			if(data.data!=null && data.data.length >0  ){
				for(var i=0;i<data.data.length ;i++){
					data.data[i]["SerialNumber1"] = i+_page.pageSize*(_page.currentPage-1)+1;
				}
				_salary.table2.array = data.data;
			}else{
				_salary.table.array= null;	
			}
		}
		//条件查询调薪记录
		private function onImageOne(e:MouseEvent){
			onPayrollRecord();
		}
		//导出调薪记录
		private function outputSalaryIncrease(e:MouseEvent){
			var reqs:Object = new Object();
			reqs.input = _salary.input2.text;	
			/*[IF-FLASH-BEGIN]*/
			navigateToURL(new URLRequest(path+"SalaryIncrease/outputExcelSalaryIncrease?input="+encodeURI(reqs.input)));
			/*[IF-FLASH-END]*/ 
		}
		//保存调薪记录
		private function addSalary(e:MouseEvent){
			var reqs:Object = new Object();
			reqs.name = _salary.names.text;	
			reqs.position = _salary.position.text;	
			reqs.workingTime = _salary.workingTime.text;	
			reqs.originalBasicSalary = _salary.originalBasicSalary.text;	
			reqs.salaryBasicWage = _salary.salaryBasicWage.text;	
			reqs.salaryIncreaseReason = _salary.salaryIncreaseReason.text;	
			reqs.salaryIncrease = _salary.salaryIncrease.text;	
			send("SalaryIncrease/addSalaryIncrease",reqs,function(data:Object):void{
				popu(data.msg);
			},onError,"POST");
		}
		
	}
}