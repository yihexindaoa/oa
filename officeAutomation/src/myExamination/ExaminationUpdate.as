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
	 *审批管理修改 
	 * @author Administrator
	 * 
	 */	
	public class ExaminationUpdate extends Trade
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
		protected var approverStr:String;
		protected var id:String;//业务主键
		protected var calendar_qj_sNumber:Number;//时间
		protected var calendar_qj_eNumber:Number;
		protected var calendar_jb_sNumber:Number;
		protected var calendar_jb_eNumber:Number;
		protected var calendar_jj_sNumber:Number;
		protected var calendar_jj_eNumber:Number;
		public function ExaminationUpdate(container:Sprite)
		{
			_container = container;
			
			initApproval();
			super.initPopu(container,exam);
			//getApprover();
			getSubmitInfo();
			
		}
		
		private function getApprover():void
		{
			
			send("examination/getApprover",req, getApproverOnComplete, onError,URLRequestMethod.POST);
		}
		
		private function getApproverOnComplete(data:Object):void
		{
			if(data.status==200){
				var list:Array = data.data;
				approvalList = data.data;
				var str:String = "";
				var selectIndex:int;
				for(var i:int = 0;i< list.length;i++){
					var item:Object = list[i];
					if(item.approverId==approverStr){
						selectIndex=i;//获取选中索引
					}
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
				if(approverStr!=null &&""!=approverStr){
				exam.approverqj.selectedIndex=selectIndex;//选中索引
				exam.approver.selectedIndex=selectIndex;//选中索引
				exam.approver_bx.selectedIndex=selectIndex;//选中索引
				exam.approver_jj.selectedIndex=selectIndex;//选中索引
			    }
			}
			//						
			
		}
		
		private function getSubmitInfo():void
		{
			send("examination/getSubmitInfo",req, getSubmitInfoOnComplete, onError,URLRequestMethod.POST);
		}
		
		private function initApproval():void
		{
			exam = new ExaminationLeaveSaveUI();
			exam.x = 161;
			_container.addChild(exam);
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
		/**
		 * 获取详情并赋值
		 */
		public function setDetail(id:int):void
		{
			
			send("examination/findExaminationDetailsById",{"id":id},onGetDetailComplete, onError,URLRequestMethod.POST);
		}
		
		private function onGetDetailComplete(detailData:Object):void
		{
			if(detailData.status == 200){
		        exam.applicationNumber.selectedIndex=detailData.data.applicationNumber-1;
				var obj:Object=detailData.data;
				approverStr=obj.approver;
				getApprover();//选中审核人
				id=obj.id;//业务主键
				if(detailData.data.applicationNumber==1){//请假
					exam.qj.visible=true;
					exam.baoxiao.visible=false;
					exam.jb.visible=false;
					exam.jj.visible=false;
					exam.radioGroup2.selectedValue=obj.leaveType;
					exam.contentExamination_qj.text=obj.contentExamination;
					exam.dateqj.text=obj.leaveDays;
					//calendar_qj_s.=obj.eventStart;
					var dates:Date = new Date( obj.eventStart );
					calendar_qj_sNumber=obj.eventStart;
					var datee:Date = new Date( obj.eventEnd );
					calendar_qj_eNumber=obj.eventEnd;
					exam.eventStartTimeqj.text = dates.getFullYear()+"-"+(dates.getMonth()+1)+"-"+dates.getDate()+" "+dates.getHours()+":"+dates.getMinutes();
					exam.eventEndtimeqj.text = datee.getFullYear()+"-"+(datee.getMonth()+1)+"-"+datee.getDate()+" "+datee.getHours()+":"+datee.getMinutes();

				}else if(detailData.data.applicationNumber==2){//报销
					exam.qj.visible=false;
					exam.baoxiao.visible=true;
					exam.jb.visible=false;
					exam.jj.visible=false;
					exam.project_bx.text=obj.project;
					exam.expenseType_bx.text=obj.expenseType;
					exam.contentExamination_bx.text=obj.contentExamination;
					exam.rsementAmount_bx.text=obj.reimbursementAmount;
				}else if(detailData.data.applicationNumber==3){//加班
					exam.qj.visible=false;
					exam.baoxiao.visible=false;
					exam.jb.visible=true;
					exam.jj.visible=false;
					exam.project_jb.text=obj.project;
					exam.contentExamination_jb.text=obj.contentExamination;
					var dates:Date = new Date( obj.eventStart );
					calendar_jb_sNumber=obj.eventStart;
					var datee:Date = new Date( obj.eventEnd );
					calendar_jb_eNumber=obj.eventEnd;
					exam.eventStartTime.text = dates.getFullYear()+"-"+(dates.getMonth()+1)+"-"+dates.getDate()+" "+dates.getHours()+":"+dates.getMinutes();
					exam.eventEndtime.text = datee.getFullYear()+"-"+(datee.getMonth()+1)+"-"+datee.getDate()+" "+datee.getHours()+":"+datee.getMinutes();
				}else if(detailData.data.applicationNumber==4){//项目奖金
					exam.qj.visible=false;
					exam.baoxiao.visible=false;
					exam.jb.visible=false;
					exam.jj.visible=true;
					exam.project_jj.text=obj.project;
					exam.contentExamination_jj.text=obj.contentExamination;
					var dates:Date = new Date( obj.eventStart );
					calendar_jj_sNumber=obj.eventStart;
					var datee:Date = new Date( obj.eventEnd );
					calendar_jj_eNumber=obj.eventEnd ;
					exam.eventStartTime_jj.text = dates.getFullYear()+"-"+(dates.getMonth()+1)+"-"+dates.getDate()+" "+dates.getHours()+":"+dates.getMinutes();
					exam.eventEndtime_jj.text = datee.getFullYear()+"-"+(datee.getMonth()+1)+"-"+datee.getDate()+" "+datee.getHours()+":"+datee.getMinutes();
				}
			}
			
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
			req.id=id;
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
			sendFormFile(req,"examination/modifyExamination");
			initForm();
			hideForm();
		}
		
		private function saveExaminationOnComplete(data:Object):void
		{
			popu(data.data.msg);
			
		}
		
		private function onError(e:String):void
		{
			popu(e);
		}
		/**
		 * 提交人资料
		 */
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
			}else{
				popu("无记录!");
			}
		}
		/**
		 * 改变申请类型时事件
		 */
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
					initForm();
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
		}
		
		
		
	}
}