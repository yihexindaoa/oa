package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import game.ui.homePage.ScrollUI;
	import game.ui.login.LoginUI;
	
	import iflash.method.importJS;
	
	import login.Login;
	
	import morn.core.components.ScrollBar;
	import morn.core.components.VScrollBar;
	import morn.core.handlers.Handler;
	
	import unitl.date.Calendar;
	
	public class OfficeAutomation extends Sprite
	{
		private var box:Sprite;
		private var content:Bitmap;
		protected var jsonload:URLLoader;//配置文件的加载
		private var welcome:Bitmap;
		private var welcomeContainer:Sprite;
		protected var scroll:VScrollBar;//滚动条
		public function OfficeAutomation()
		{
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
//			importJS('jquery-1.11.1.min.js',function(){trace('加载完成')});
//			__JS__('document.write(<form id="userForm2" action="http://192.168.1.122:8080/oa_system/notice/saveNotice" enctype="multipart/form-data" method="post">'+
//		'<div id="newUpload2">'+
//		    '<input type="file" name="file">'+
//		    '<input type="hidden" name="signType" value="1">'+
//		    '<input type="hidden" name="title" value="哈哈大大">'+
//		    '<input type="hidden" name="content" value="内容">
//		    '<!-- <input type="radio" name="leaveType" value="1">'+
//		      '<input type="radio" name="leaveType" value="2">'+
//		      '<input type="radio" name="leaveType" value="3">'+
//		      '<input type="radio" name="leaveType" value="4">'+
//		      '<input type="radio" name="leaveType" value="5">'+
//		      '<input type="radio" name="leaveType" value="6">'+
//		      '<input type="radio" name="leaveType" value="7">'+
//		      '<input type="hidden" name="leaveDays" value="50">-->'+
//		    '<input type="hidden" name="approver" value="1">'+
//		    '<input type="hidden" name="remarks" value="备注啊ss啊啊报销">'+
//		'</div>'+
//		'</form>)');
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Staged.staged=stage;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			setWindowFullSize();
			//			IFlash.setSize(stage.stageWidth, stage.stageHeight); //2D项目中设置场景尺寸
			IFlash.setOrientationEx(1); //是否为横屏模式
			IFlash.setBgcolor("#ffffff"); //背景色
			IFlash.showInfo(false); //是否显示帧率
			jsonload=new URLLoader;
			jsonload.addEventListener(Event.COMPLETE,jsonComplete);
			jsonload.addEventListener(ProgressEvent.PROGRESS , imgProgress );
			jsonload.load(new URLRequest(encodeURI("data/config.json")));
			welcomeContainer = new Sprite();
		}
		
		protected function imgProgress(e:ProgressEvent):void
		{
			
		}
		
		protected function jsonComplete(e:Event):void
		{
			var json:Object = JSON.parse((e.currentTarget as URLLoader).data as String);
			Config.PATH = json.path;
			initMornUI();
		}
		
		private function initMornUI():void
		{
			//初始化组件
			App.init(this);
			//加载资源			
			App.loader.loadAssets(["assets/comp.swf", "assets/vector.swf","assets/exam.swf"], new Handler(loadCompleteMornUI), new Handler(loadProgress));
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(new URLRequest("image/bg.jpg"));
			var wloader:Loader = new Loader();
			wloader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadwComplete);
			wloader.load(new URLRequest("image/welcome.jpg"));
		}
		private function loadComplete(event:Event):void
		{
			trace("laya image is loaded.");
			content = event.target.content;
			content.scaleX = stage.stageWidth/1024;
			content.scaleY = stage.stageHeight/640;
			addChild(content);
			
			stage.addEventListener(Event.RESIZE, onResize);
		}
		private function loadwComplete(event:Event):void
		{
			welcome = event.target.content;
//			welcome.scaleX = stage.stageWidth/1024;
//			welcome.scaleY = stage.stageHeight/640;
			
			welcomeContainer.addChild(welcome);
			welcomeContainer.alpha = 0.3;
			welcomeContainer.x = stage.stageWidth/2-welcomeContainer.width/2;
			welcomeContainer.y = -100;
			TweenLite.to(welcomeContainer,1,{y:0});
			welcomeContainer.addEventListener(MouseEvent.CLICK, onCloseWelcomeHandler);
			
			
			
		}
		
		protected function onCloseWelcomeHandler(event:MouseEvent):void
		{
			removeChild(welcomeContainer);
		}
		protected function onResize(event:Event):void
		{
			if(content){
				content.scaleX = stage.stageWidth/1024;
				content.scaleY = stage.stageHeight/640;
			}
//			if(scroll){
//				
//				/*[IF-SCRIPT-BEGIN]
//				scroll.height = Laya.window.innerHeight;
//				scroll.x = Laya.window.innerWidth-scroll.width;
//				if(!scroll.visible){
//					scroll.visible = Laya.window.innerHeight>1000;
//				}
//				[IF-SCRIPT-END]*/ 
//				
//				/*[IF-FLASH-BEGIN]*/
//				scroll.height = stage.stageHeight;
//				scroll.x = stage.stageWidth-scroll.width;
//				if(!scroll.visible){
//					scroll.visible = stage.stageHeight>1000;
//				}
//				/*[IF-FLASH-END]*/ 
//			}
			/*[IF-FLASH-BEGIN]*/
			if(stage.stageHeight<1000){
				addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			}else{
				removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
				if(box.y<-10)
				TweenLite.to(box, 1,{y:0});
			}
			/*[IF-FLASH-END]*/ 
			/*[IF-SCRIPT-BEGIN]
			if( Laya.window.innerHeight < 1000 ){
				addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			}else{
				removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
				if(box.y<-10)
				TweenLite.to(box, 1,{y:0});
			}
			
			[IF-SCRIPT-END]*/ 
			
			if(box){
				box.x = (stage.stageWidth-1200)/2;
			}
		}
		
		private function loadCompleteMornUI():void {
			trace("开始登陆");
			box = new Sprite();
			box.alpha = 0.9;
			box.x = (stage.stageWidth-1200)/2;
			box.graphics.lineStyle(1,0xff0000,0.2);
			box.graphics.drawRect(0,0,1200,1000);
			addChild(welcomeContainer);
			addChild(box);
//			var w:int = 0;
//			var h:int = 0;
//			__JS__('w = Laya.window.innerWidth;');
//			__JS__('h = Laya.window.innerHeight;');
			/*[IF-SCRIPT-BEGIN]
			
			[IF-SCRIPT-END]*/ 
			
			/*[IF-FLASH-BEGIN]*/
			
			/*[IF-FLASH-END]*/ 
			/*[IF-FLASH-BEGIN]*/
			if(stage.stageHeight<1000){
				/*scroll = new VScrollBar("png.comp.vscroll");
				scroll.height = stage.stageHeight;
				scroll.x = stage.stageWidth-scroll.width;
				addChild(scroll);*/
				addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			}else{
				/*if(scroll){
					scroll.visible = false;
				}*/
				
			}
			/*[IF-FLASH-END]*/ 
			/*[IF-SCRIPT-BEGIN]
			if( Laya.window.innerHeight < 1000 ){
//				scroll = new VScrollBar("png.comp.vscroll");//new ScrollUI()vscrollbar
//				scroll.height = Laya.window.innerHeight;
//				scroll.x = Laya.window.innerWidth-scroll.width;
//				scroll.thumbPercent = Laya.window.innerHeight/1000;
//				scroll.setScroll(0,1,0.5);
//				addChild(scroll);
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			}else {
				if(scroll){
					scroll.visible = false;
				}
			}
			[IF-SCRIPT-END]*/ 
			/*if(scroll){
				scroll.changeHandler = new Handler(function(value:Number){
					
					
				});
				
			}*/
			
			var lo:Login = new Login(box);
			
		}
		
		protected function onMouseMoveHandler(e:MouseEvent):void
		{
			
			/*[IF-SCRIPT-BEGIN]
			if(e.stageY > Laya.window.innerHeight - 50){
				TweenLite.to(box, 1,{y:Laya.window.innerHeight - 1000});
			}else if( e.stageY < 50 ){
				TweenLite.to(box, 1,{y:0});
			}
			[IF-SCRIPT-END]*/ 
			
			/*[IF-FLASH-BEGIN]*/
			if(e.stageY > stage.stageHeight - 50){
				TweenLite.to(box, 1,{y:stage.stageHeight-1000});
			}else if( e.stageY < 50 ){
				TweenLite.to(box, 1,{y:0});
			}
			/*[IF-FLASH-END]*/ 
		}
		
		protected function onSliderChange(e:Event):void
		{
			
		}
		
		private function loadProgress(value:Number):void { 
			//加载进度
			//trace("loaded", value);
		}
		
		private function setWindowFullSize():void
		{
			var w:int = 0;
			var h:int = 0;
			__JS__('w = Laya.window.innerWidth;');
			__JS__('h = Laya.window.innerHeight;');
			if (w > 0)
			{
				IFlash.setSize(w, h);
				
			}
		}
	}
}