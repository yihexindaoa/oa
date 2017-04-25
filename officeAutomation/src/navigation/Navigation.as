package navigation
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import authority.Authority;
	import authority.Infor;
	import authority.Menu;
	import authority.User;
	
	import game.ui.role.NavigationMenuUI;
	
	import morn.core.components.Button;
	
	import notice.Notice;
	
	import report.WorkReportStatistics;
	
	import trade.Trade;
	
	public class Navigation extends Trade
	{
		protected var _container:Sprite;
		protected var btnList:Array;
		protected var boxList:Array;
		protected var childList:Array;
		protected var auth:Authority;//角色管理
		protected var menu:Menu;//菜单管理
		protected var user:User;//用户管理
		protected var infor:Infor;//信息表管理
		protected var noticeManager:Notice;//通知告示管理
		protected var workReportStatistics:WorkReportStatistics;//工作报表统计
		public function Navigation(container:Sprite)
		{
			_container = container;
			initNav();
			super.initPopu(container);
			
		}
		
		protected function initNav():void
		{
			btnList = new Array();
			boxList = new Array();
			childList = new Array(10);
			var nav:NavigationMenuUI = new NavigationMenuUI();
			_container.addChild(nav);
			//系统首页,权限管理
			btnList.push(nav.syspageBtn,nav.authorityBtn,nav.noticeBtn,nav.reportBtn,nav.attendanceBtn,nav.wageBtn,nav.projectBtn,nav.contractBtn,nav.approvalBtn,nav.statisticsBtn);
			boxList.push(nav.syspageBox,nav.authorityBox,nav.noticeBox,nav.reportBox,nav.attendanceBox,nav.wageBox,nav.projectBox,nav.contractBox,nav.approvalBox,nav.statisticsBox);
			childList[1] = nav.authorityChild;
			childList[2] = nav.noticeChild;
			childList[3] = nav.reportChild;;
			pos();
			for(var i:int = 0,m:int = btnList.length; i < m ; i++ ){
				btnList[i].addEventListener(MouseEvent.CLICK, onClickHandler);
				if(childList[i])childList[i].addEventListener(MouseEvent.CLICK, onChildHandler);
			}
			
		}
		protected function onChildHandler(e:MouseEvent):void
		{
			if(e.target is Button){
				var btn:Button = e.target as Button;
				if(menu)menu.hide();
				if(user)user.hide();
				if(infor)infor.hide();
				if(auth)auth.hide();
				if(noticeManager)noticeManager.hide();
				if(workReportStatistics)workReportStatistics.hide();
				if (btn) {
					switch (btn.label){
						case "角色管理": 
							if(!auth)
							auth = new Authority(_container);
							else auth.show();
							break;
						case "菜单管理": 
							if(!menu)
							menu = new Menu(_container);
							else menu.show();
							break;
						case "用户管理":
							if(!user)
								user = new User(_container);
							else 
								user.show();
							break;
						case "信息表管理":
							if(!infor)
								infor = new Infor(_container);
							else 
								infor.show();
							break;
						case "通知告示统计表":
							if(!noticeManager)
								noticeManager = new Notice(_container);
							else 
								noticeManager.show();
							break;
						case "工作报表统计":
							if(!workReportStatistics)
								workReportStatistics = new WorkReportStatistics(_container);
							else
								workReportStatistics.show();
							break;
						default:
							break;
					}
				}
			}
		}
		protected function onClickHandler(e:MouseEvent):void
		{
			var btn:Button = e.target as Button;
			if (btn) {
				btn.tag = !btn.tag;
				var i:int = btnList.indexOf(btn);
				if(childList[i])
				childList[i].visible = btn.tag;
				pos();
			}
		}
		
		
		protected function pos():void{
			var len:int = 0;
			for(var i:int = 0;i<10;i++){
				var btn:Button =btnList[i] as Button;
				
				boxList[i].y = 158+i*32+len;
				if(childList[i]&&childList[i].visible){
					childList[i].y = boxList[i].y+32;
					len+=childList[i].height;
					
				}
			}
		}
	}
}