package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	
	import Chapter3.Ceshi01;
	import Chapter3.Physic;
	import Chapter3.RequestMessage;
	
	import game.ui.LoginUI;
	import game.ui.NavigationMenuUI;
	import game.ui.RoleManagementUI;
	
	import iflash.utils.describeType;
	
	import morn.core.handlers.Handler;
	
	[SWF(backgroundColor="0xffffff",frameRate=60)]//width=960,height=640,
	
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Staged.staged=stage;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			setWindowFullSize();
//			IFlash.setSize(stage.stageWidth, stage.stageHeight); //2D项目中设置场景尺寸
			IFlash.setOrientationEx(1); //是否为横屏模式
			IFlash.setBgcolor("#ffffff"); //背景色
			IFlash.showInfo(false); //是否显示帧率
			startGame();
		}
		
		private function startGame():void
		{
			
			var welcomeText:TextField = new TextField();
			welcomeText.defaultTextFormat = new TextFormat("Arial", 80, 0x24B69F, true);
			welcomeText.text = "Hello World";
			welcomeText.selectable = false;
			welcomeText.width = 450;
			welcomeText.x = (this.stage.stageWidth - welcomeText.width) / 2;
			welcomeText.y = (this.stage.stageHeight - welcomeText.height) / 2;
			
			this.addChild(welcomeText);
			TweenLite.to(welcomeText,2,{x:0,onComplete:oncompletehandler});
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(new URLRequest("laya.png"));
			
			
			var req:RequestMessage = new RequestMessage();
//			var xml:XML = describeType(req);
			var obj:Object = {adlinf:"12",age:18};
			for(var m:String in obj){
				if(req.hasOwnProperty(m)){
					req[m] = obj[m];
					
				}
				
			}
			trace("req.adlinf="+req.adlinf,"req.age="+req.age);
//			trace(xml);
		}
		
		private function oncompletehandler():void
		{
			trace(8);
		}
		
		private function loadComplete(event:Event):void
		{
			trace("laya image is loaded.");
			var welcomeText:TextField = getChildAt(0) as TextField;
			var content:Bitmap = event.target.content;
			content.width = 170;
			content.height = 150;
//			content.x = (this.stage.stageWidth - content.width) / 2;
			content.y = welcomeText.y - content.height;
			addChild(content);
			initMornUI();
		}
		
		private function initMornUI():void {
			//初始化组件
			App.init(this);
			//加载资源			
			App.loader.loadAssets(["assets/comp.swf", "assets/vector.swf"], new Handler(loadCompleteMornUI), new Handler(loadProgress));
		}
		
		private function loadProgress(value:Number):void {
			//加载进度
			//trace("loaded", value);
		}
		
		protected var canvas:Sprite;
		private function loadCompleteMornUI():void {
			//实例化场景
			addChild(new GameStage());
			var login:LoginUI = new LoginUI();
			addChild(login);
			/*var menue:NavigationMenuUI = new NavigationMenuUI();
			
			addChild(menue);*/
			/*var role:RoleManagementUI = new RoleManagementUI();
			role.y = 100;
			role.x = 200;
			addChild(role);*/
			var rect:Sprite = new Sprite();
			rect.graphics.beginFill(0xffcc00);
			rect.graphics.drawCircle(0,0,20);
			rect.buttonMode = true;
			addChild(rect);
			rect.x = rect.y = 50;
			rect.addEventListener(MouseEvent.CLICK, onRectHandler);
			canvas = new Sprite();
			addChild(canvas);
			canvas.x = canvas.y = 100;
			canvas.graphics.beginFill(0xfcc000);
			canvas.graphics.drawCircle(0,0,20);
//			addEventListener(Event.ENTER_FRAME, loop);
			
			/*var q:Physic = new Physic();
			addChild(q);*/
			/*var c:Ceshi01=new Ceshi01;
			this.addChild(c);*/
			var loader:URLLoader = new URLLoader();  
			var request:URLRequest = new URLRequest("http://gjairhotel.airkm.cn/km_airhotel/queryDeparture");  
			request.method = URLRequestMethod.POST;  
			request.data = {};      
			loader.addEventListener(Event.COMPLETE, function(e:Event):void{trace(loader.data)});
			loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void{trace("=======",e.text);});
			loader.load(request);  
			
		}
		
		protected var index:int = 0;
		protected var sl:int = 1;
		protected function loop(event:Event):void
		{
			if(index%5==0){
				canvas.graphics.clear();
				canvas.graphics.beginFill(0xfcc000);
				canvas.graphics.drawCircle(0,0,10*sl);
			}
			if(index%2==0){
				sl = 2;
			}else{
				sl = 1;
			}
			index++;
			if(index>10)index=0;
		}
		
		protected function onRectHandler(event:MouseEvent):void
		{
			trace("点击");	
			testFileRefrence();
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
		
		private var filee:FileReferenceList;
		public function testFileRefrence():void
		{
				filee=new FileReferenceList();
				filee.browse();//浏览
				filee.addEventListener(Event.SELECT,selected);//添加“选择文件”事件
		}
		private function selected(e:Event):void
		{
			trace(filee.fileList);//加载
			for(var i:int=0;i<filee.fileList.length;i++){
				var fileReference:FileReference = filee.fileList[i] as FileReference;
				fileReference.load();
				fileReference.addEventListener(Event.COMPLETE,on_loaded);//添加加载完成事件
			}
			
			
		}
		private function on_loaded(e:Event):void
		{
			var byteArray:ByteArray=ByteArray(e.target.data);  //处理数据                  //这里非常关键 
			var loader:Loader=new Loader();
			loader.loadBytes(byteArray);trace("加载完成",loader);
			loader.y = 200*Math.random();
			loader.x = 200*Math.random()+100;
			this.addChild(loader);
		}
	}
}
