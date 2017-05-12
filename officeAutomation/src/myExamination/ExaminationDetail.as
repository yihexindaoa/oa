package myExamination
{
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;
	
	import game.ui.examination.ExaminationDetailUI;
	
	import morn.core.components.Box;
	import morn.core.components.Button;
	import morn.core.components.Label;
	import morn.core.handlers.Handler;
	
	import trade.Trade;

	/**
	 * 详情
	 */
	public class ExaminationDetail extends Trade
	{
		
		protected var exam:ExaminationDetailUI;
		protected var _container:Sprite;	
		protected var req:Object;
		public function ExaminationDetail(container:Sprite)
		{
			_container = container;
			initDetail();
			super.initPopu(container,exam);
			
		}
		/*初始化详情*/
		private function initDetail():void
		{
			exam = new ExaminationDetailUI();
			exam.x = 161;
			_container.addChild(exam);
			exam.qj.visible = false;
			exam.baoxiao.visible = false;
			exam.jb.visible = false;
			exam.jj.visible = false;
			//添加附件
			exam.table.renderHandler = new Handler(listRender);
		}
		
		private function listRender(cell:Box, index:int):void
		{
			if (index < exam.table.length) {
				
				var mapValue:Button = cell.getChildByName("mapValue") as Button;
				mapValue.addEventListener(MouseEvent.CLICK, mapValueBtnHandler);
				
			}
			
		}
		
		protected function mapValueBtnHandler(e:MouseEvent):void
		{
			req=new Object();
			var cell:Box = e.target.parent as Box;
			var id:Object =(cell.getChildByName("mapKey") as Label).text;
			req.fileKey=id;
			//send("/examination/fileDownload",req,downloadsuccess , onError,URLRequestMethod.POST);
			navigateToURL(new URLRequest(path+"examination/fileDownload?fileKey="+encodeURI(req.fileKey)));
			
		}
		
		private function downloadsuccess():void
		{
			// TODO Auto Generated method stub
			
		}
		/**
		 *显示详情  
		 * @param id
		 */			
		public function showDetail(id:int):void{
			exam.show();
			send("examination/findExaminationDetailsById",{"id":id},onComplete, onError,URLRequestMethod.POST);
		}
		
		private function onError(e:String):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onComplete(data:Object):void
		{
			if(data.status == 200){
					//
				exam.applicationText.text=data.data.applicationText;
				var obj=data.data;
				if(data.data.applicationNumber==1){//请假
					exam.qj.visible=true;
					exam.baoxiao.visible=false;
					exam.jb.visible=false;
					exam.jj.visible=false;
					exam.submitName_qj.text="";
					exam.submitName_qj.text=obj.submitName;
					exam.officeName_qj.text="";
					exam.officeName_qj.text=obj.officeName;
					var date:Date = new Date( obj.contractStartTime );
					exam.inductionTime.text ="";
					exam.inductionTime.text = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
					exam.contentExamination_qj.text="";
					exam.contentExamination_qj.text=obj.contentExamination;
					exam.leaveDays.text="";
					exam.leaveDays.text=obj.leaveDays;
					var startDate:Date = new Date( obj.eventStart );
					var endDate:Date = new Date( obj.eventEnd );
					exam.dateqj.text="";
					exam.dateqj.text=startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-"+startDate.getDate()+" "+startDate.getHours()+":"+startDate.getMinutes();
					exam.dateqj.text+="  --  ";
					exam.dateqj.text+=endDate.getFullYear()+"-"+(endDate.getMonth()+1)+"-"+endDate.getDate()+" "+endDate.getHours()+":"+endDate.getMinutes();
					exam.approverNameqj.text="";
					exam.approverNameqj.text=obj.approverName;
					exam.leaveType.text="";
				
					switch(obj.leaveType)
					{
						//请假类型（1：事假，2：病假、3：婚假，4：丧假，5：年休假，6：调休，7：其他假）
						case "1":
						{
							exam.leaveType.text="事假";
							break;
						}
						case "2":
						{
							exam.leaveType.text="病假";
							break;
						}
						case "3":
						{
							exam.leaveType.text="婚假";
							break;
						}
						case "4":
						{
							exam.leaveType.text="丧假";
							break;
						}	
						case "5":
						{
							exam.leaveType.text="年休假";
							break;
						}	
						case "6":
						{
							exam.leaveType.text="调休";
							break;
						}	
						case "7":
						{
							exam.leaveType.text="其他假";
							break;
						}	
							
						default:
						{
							break;
						}
					}
				}else if(data.data.applicationNumber==2){//报销
					exam.qj.visible=false;
					exam.baoxiao.visible=true;
					exam.jb.visible=false;
					exam.jj.visible=false;
					exam.submitName_bx.text="";
					exam.submitName_bx.text=obj.submitName;
					exam.officeName_bx.text="";
					exam.officeName_bx.text=obj.officeName;
					exam.project_bx.text="";
					exam.project_bx.text=obj.project;
					exam.expenseType_bx.text="";
					exam.expenseType_bx.text=obj.expenseType;
					exam.contentExamination_bx.text="";
					exam.contentExamination_bx.text=obj.contentExamination;
					exam.rsementAmount_bx.text="";
					exam.rsementAmount_bx.text=obj.reimbursementAmount;
					exam.approver_bx.text="";
					exam.approver_bx.text=obj.approverName;
					
				}else if(data.data.applicationNumber==3){
					exam.qj.visible=false;
					exam.baoxiao.visible=false;
					exam.jb.visible=true;
					exam.jj.visible=false;
					exam.submitName_jb.text="";
					exam.submitName_jb.text=obj.submitName;
					exam.officeName_bm.text="";
					exam.officeName_bm.text=obj.officeName;
					exam.project_jb.text="";
					exam.project_jb.text=obj.project;
					exam.contentExamination_jb.text="";
					exam.contentExamination_jb.text=obj.contentExamination;
					var startDate:Date = new Date( obj.eventStart );
					var endDate:Date = new Date( obj.eventEnd );
					exam.datejb.text="";
					exam.datejb.text=startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-"+startDate.getDate()+" "+startDate.getHours()+":"+startDate.getMinutes();
					exam.datejb.text+="  --  ";
					exam.datejb.text+=endDate.getFullYear()+"-"+(endDate.getMonth()+1)+"-"+endDate.getDate()+" "+endDate.getHours()+":"+endDate.getMinutes();
					exam.approver_jb.text="";
					exam.approver_jb.text=obj.approverName;
				}else if(data.data.applicationNumber==4){
					exam.qj.visible=false;
					exam.baoxiao.visible=false;
					exam.jb.visible=false;
					exam.jj.visible=true;
					exam.submitName_jj.text="";
					exam.submitName_jj.text=obj.submitName;
					exam.officeName_jj.text="";
					exam.officeName_jj.text=obj.officeName;
					exam.project_jj.text="";
					exam.project_jj.text=obj.project;
					exam.contentExamination_jj.text="";
					exam.contentExamination_jj.text=obj.contentExamination;
					var startDate:Date = new Date( obj.eventStart );
					var endDate:Date = new Date( obj.eventEnd );
					exam.datejj.text="";
					exam.datejj.text=startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-"+startDate.getDate()+" "+startDate.getHours()+":"+startDate.getMinutes();
					exam.datejj.text+="  --  ";
					exam.datejj.text+=endDate.getFullYear()+"-"+(endDate.getMonth()+1)+"-"+endDate.getDate()+" "+endDate.getHours()+":"+endDate.getMinutes();
					exam.approver_jj.text="";
					exam.approver_jj.text=obj.approverName;
				}
				//附件
				var map:Object=obj.attachmentMap;
				var list:Array = [];
				for(var key:String in map){
					trace(key,map[key]);
					var mapObj:Object=new Object();
					mapObj.mapKey=key;
					mapObj.mapValue=map[key];
					list.push(mapObj);
				}
				exam.table.array = list;
				
			}else{
				
			}
			
		}
	}
}