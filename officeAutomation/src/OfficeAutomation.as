package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import game.ui.login.LoginUI;
	
	import iflash.method.importJS;
	
	import login.Login;
	
	import morn.core.handlers.Handler;
	
	import unitl.date.Calendar;
	
	public class OfficeAutomation extends Sprite
	{
		private var box:Sprite;
		private var content:Bitmap;
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
		
		protected function onResize(event:Event):void
		{
			if(content){
				content.scaleX = stage.stageWidth/1024;
				content.scaleY = stage.stageHeight/640;
			}
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
			addChild(box);
			var lo:Login = new Login(box);
			
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