package myExamination
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequestMethod;
	
	import game.ui.myExamination.ExaminationLeaveSaveUI;
	
	import morn.core.handlers.Handler;
	
	import trade.Trade;
	
	import unitl.date.Calendar;
	import unitl.date.CalendarEvent;

	/**
	 *审批管理新增 
	 * @author Administrator
	 * 
	 */	
	public class ExaminationSave extends Trade
	{
		protected var _container:Sprite;	
		protected var exam:ExaminationLeaveSaveUI;
		protected var req:Object;
		protected var approvalList:Array;
		protected var calendar_qj_s:Calendar;
		protected var calendar_qj_e:Calendar;
		protected var calendar_jb_s:Calendar;
		protected var calendar_jb_e:Calendar;
		protected var calendar_jj_s:Calendar;
		protected var calendar_jj_e:Calendar;
		protected var calendar_qj_sNumber:Number;//时间
		protected var calendar_qj_eNumber:Number;
		protected var calendar_jb_sNumber:Number;
		protected var calendar_jb_eNumber:Number;
		protected var calendar_jj_sNumber:Number;
		protected var calendar_jj_eNumber:Number;
		public function ExaminationSave(container:Sprite)
		{
			_container = container;
			initApproval();
			super.initPopu(container,exam);
			getSubmitInfo();
			getApprover();
		}
		/**
		 * 获取审核人
		 */
		private function getApprover():void
		{
			
			send("examination/getApprover",req, getApproverOnComplete, onError,URLRequestMethod.POST);
		}
		
		private function getApproverOnComplete(data:Object):void
		{
			var list:Array = data.data;
			approvalList = data.data;
			var str:String = "";
			for(var i:int = 0;i< list.length;i++){
				var item:Object = list[i];
				if(i>0)
					str+= ","+item.approverName;
				else
					str+= item.approverName;
				//.addChildAt(item.approverId,item.approverName);
				
			}
			exam.approverqj.labels=str;
			exam.approver.labels=str;
			exam.approver_bx.labels=str;
			exam.approver_jj.labels=str;
		}
		/**
		 * 获取提交人信息
		 */
		private function getSubmitInfo():void
		{
			send("examination/getSubmitInfo",req, getSubmitInfoOnComplete, onError,URLRequestMethod.POST);
		}
		
		private function initApproval():void
		{
			exam = new ExaminationLeaveSaveUI();
			exam.x = 161;
//			_container.addChild(exam);
			//请假
			calendar_qj_s = new Calendar(exam);
			calendar_qj_s.addEventListener(CalendarEvent.DATE, onCalendarHandler);
			calendar_qj_e = new Calendar(exam);
			calendar_qj_e.addEventListener(CalendarEvent.DATE, onCalendar1Handler);
			
			//加班
			calendar_jb_s = new Calendar(exam);
			calendar_jb_s.addEventListener(CalendarEvent.DATE, onCalendarJbsHandler);
			calendar_jb_e = new Calendar(exam);
			calendar_jb_e.addEventListener(CalendarEvent.DATE, onCalendarJbeHandler);
			//奖金
			calendar_jj_s = new Calendar(exam);
			calendar_jj_s.addEventListener(CalendarEvent.DATE, onCalendarJjsHandler);
			calendar_jj_e = new Calendar(exam);
			calendar_jj_e.addEventListener(CalendarEvent.DATE, onCalendarJjeHandler);
			
			exam.applicationNumber.addEventListener(Event.CHANGE, onChandeHandler);
		
			exam.applicationNumber.addEventListener(Event.CHANGE, onChandeHandler);
			exam.approvalSubmitBtn.addEventListener(MouseEvent.CLICK,onSubimtHandler);//添加提交事件
			exam.applicationNumber.selectedIndex = 0;
			exam.qj.visible = false;
			exam.baoxiao.visible = false;
			exam.jb.visible = false;
			exam.jj.visible = false;
			//请假
			exam.eventEndtimeqj.addEventListener(MouseEvent.CLICK,onShowEndTimeFunc);
			exam.eventStartTimeqj.addEventListener(MouseEvent.CLICK, onShowStartFunc);
			//加班
			exam.eventStartTime.addEventListener(MouseEvent.CLICK,onShowStartJbFunc);
			exam.eventEndtime.addEventListener(MouseEvent.CLICK,onShowEndTimeJbFunc);
			//奖金
			exam.eventStartTime_jj.addEventListener(MouseEvent.CLICK,onShowStartJjFunc);
			exam.eventEndtime_jj.addEventListener(MouseEvent.CLICK,onShowEndTimeJjFunc);
			exam.closeHandler = new Handler(examCloseHandler);
			initForm();
			
		}
		
		private function examCloseHandler(type:String):void
		{
			hideForm();
		}
		
		protected function onShowEndTimeJjFunc(event:MouseEvent):void
		{
			calendar_jj_e.show(exam.eventEndtime_jj.x , exam.eventEndtime_jj.y);
			
		}
		
		protected function onShowStartJjFunc(event:MouseEvent):void
		{
			calendar_jj_s.show(exam.eventStartTime_jj.x , exam.eventStartTime_jj.y);
			
		}
		
		protected function onShowEndTimeJbFunc(event:MouseEvent):void
		{
			calendar_jb_e.show(exam.eventEndtime.x , exam.eventEndtime.y);
			
		}
		
		protected function onShowStartJbFunc(event:MouseEvent):void
		{
			calendar_jb_s.show(exam.eventStartTime.x , exam.eventStartTime.y);
			
		}
		
		protected function onCalendarJjsHandler(e:CalendarEvent):void
		{
			
			exam.eventStartTime_jj.text = e.date;trace(e.millisecondsNumber);
			calendar_jj_sNumber=e.millisecondsNumber;
			calendar_jj_s.hide();
			
		}
		
		protected function onCalendarJjeHandler(e:CalendarEvent):void
		{
			
			exam.eventEndtime_jj.text = e.date;trace(e.millisecondsNumber);
			calendar_jj_eNumber=e.millisecondsNumber;
			calendar_jj_e.hide();
			
		}
		
		protected function onCalendarJbeHandler(e:CalendarEvent):void
		{
			exam.eventEndtime.text = e.date;trace(e.millisecondsNumber);
			calendar_jb_eNumber=e.millisecondsNumber;
			calendar_jb_e.hide();
			
		}
		
		protected function onCalendarJbsHandler(e:CalendarEvent):void
		{
			exam.eventStartTime.text = e.date;trace(e.millisecondsNumber);
			calendar_jb_sNumber=e.millisecondsNumber;
			calendar_jb_s.hide();
			
		}
		
		protected function onShowStartFunc(e:MouseEvent):void
		{
			calendar_qj_s.show(exam.eventStartTimeqj.x , exam.eventStartTimeqj.y);
		}
		
		protected function onShowEndTimeFunc(e:MouseEvent):void
		{
			calendar_qj_e.show(exam.eventEndtimeqj.x , exam.eventEndtimeqj.y);
		}
		
		protected function onCalendarHandler(e:CalendarEvent):void
		{
			exam.eventStartTimeqj.text = e.date;trace(e.millisecondsNumber);
			calendar_qj_sNumber=e.millisecondsNumber;
			calendar_qj_s.hide();
			
		}
		protected function onCalendar1Handler(e:CalendarEvent):void
		{
			exam.eventEndtimeqj.text = e.date;trace(e.millisecondsNumber);
			calendar_qj_eNumber=e.millisecondsNumber;
			calendar_qj_e.hide();
			
		}
		/**
		 * 提交
		 */
		protected function onSubimtHandler(event:MouseEvent):void
		{	
			
			req = new Object();
			req.applicationNumber=exam.applicationNumber.selectedIndex+1;
			switch(exam.applicationNumber.selectedIndex+1)
			{
				
				case 1:
					req.eventStartTime=calendar_qj_sNumber;
					req.eventEndtime=calendar_qj_eNumber;
					req.contentExamination=exam.contentExamination_qj.text;
					req.leaveType=exam.radioGroup2.selectedValue;
					req.leaveDays=exam.dateqj.text;
					if(exam.approverqj.selectedIndex==-1){
					 return;
					}
					req.approver=approvalList[exam.approverqj.selectedIndex].approverId;
					
					break;
				case 2:
					req.expenseType=exam.expenseType_bx.text;
					req.contentExamination=exam.contentExamination_bx.text;
					req.reimbursementAmount=exam.rsementAmount_bx.text;
					req.project=exam.project_bx.text;
					if(exam.approver_bx.selectedIndex==-1){
						return;
					}
					req.approver=approvalList[exam.approver_bx.selectedIndex].approverId;
					break;
				case 3:
					req.eventStartTime=calendar_jb_sNumber;
					req.eventEndtime=calendar_jb_eNumber;
					req.contentExamination=exam.contentExamination_jb.text;
					req.project=exam.project_jb.text;
					if(exam.approver.selectedIndex==-1){
						return;
					}
					req.approver=approvalList[exam.approver.selectedIndex].approverId;
					break;
				default:
					req.eventStartTime=calendar_jj_sNumber;
					req.eventEndtime=calendar_jj_eNumber;
					req.contentExamination=exam.contentExamination_jj.text;
					req.project=exam.project_jj.text;
					if(exam.approver_jj.selectedIndex==-1){
						return;
					}
					req.approver=approvalList[exam.approver_jj.selectedIndex].approverId;
					break;
			}
			
//			send("examination/saveExamination",req, saveExaminationOnComplete, onError,URLRequestMethod.POST);
			sendFormFile(req,null,"examination/saveExamination",function(v:String):void{
				exam.close();
				hideForm();
				popu("添加成功");
				dispatchEvent(new Event("SUCCESS"));
			});
//			initForm();
			
		}
		
		private function saveExaminationOnComplete(data:Object):void
		{
			popu(data.data.msg);
			
		}
		
		private function onError(e:String):void
		{
			popu(e);
		}
		
		private function getSubmitInfoOnComplete(data:Object):void
		{
			if(data.data){
			exam.submitName_qj.text=data.data.userName;
			exam.submitName_bx.text=data.data.userName;
			exam.submitName_jb.text=data.data.userName;
			exam.submitName_jj.text=data.data.userName;
			exam.officeName_jj.text=data.data.officeName;
			exam.officeName_qj.text=data.data.officeName;
			exam.officeName_bx.text=data.data.officeName;
			exam.officeName_bm.text=data.data.officeName;
			exam.inductionTime.text=data.data.inductionTime;
			}
		}
		
		protected function onChandeHandler(e:Event):void
		{
			exam.qj.visible = false;
			exam.baoxiao.visible = false;
			exam.jb.visible = false;
			exam.jj.visible = false;
			hideForm();
			switch(exam.applicationNumber.selectedIndex )
			{
				case 0:
//					initForm();
					exam.qj.visible = true;
					showForm(exam,new Point(300,600));
					break;
				case 1:
					exam.baoxiao.visible = true;
					showForm(exam,new Point(300,600));
					break;
				case 2:
					exam.jb.visible = true;
					break;
				case 3:
					exam.jj.visible = true;
					break;
				default:
					break;
			}
		}
		
		override public function show():void
		{
			showForm(exam,new Point(300,600));
			exam.show();
			exam.qj.visible = true;
		}
		
		
		
	}
}