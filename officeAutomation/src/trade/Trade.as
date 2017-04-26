package trade
{
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import game.ui.basic.AlertUI;
	
	import iflash.method.importJS;
	
	import unitl.file.MsMultiPartFormData;

	public class Trade
	{
		protected var _box:Sprite;
		protected var _child:Sprite;
		protected var _mask:Sprite;//遮罩
		protected var _maskList:Array;
		protected var _byteArray:ByteArray;
		protected var _path:String = "http://192.168.1.122:8080/oa_system/";
		/**
		 *加载完二进制的回调 
		 */		
		protected var _fileDownLoadFunc:Function;
		public function Trade()
		{
			
			
		}
		
		/**
		 * 发送请求 
		 * @param url 请求的方法
		 * @param requestVo 请求vo类
		 * @param complete 成功的回调函数
		 * @param error 失败的回调函数
		 * 
		 */			
		public function send(url:String,requestVo:Object, complete:Function, error:Function,method:String ):void
		{
			
			startMask();
			var loader:URLLoader = new URLLoader();  
			var request:URLRequest = new URLRequest(_path+url);  
//			var request:URLRequest = new URLRequest("http://www.lifememorial.cn/community/mubei/memoTW");
			
			request.method = method;  
			var requestVosimple:URLVariables = new URLVariables();
			for(var key:String in requestVo){
				if(requestVo[key]!=null )requestVosimple[key]=requestVo[key];
			}
			request.data = requestVosimple;trace("requestVosimple=",requestVosimple);      
			loader.addEventListener(Event.COMPLETE,function(e:Event):void{
				stopMask();
				
				var d:Object = JSON.parse(loader.data);
				complete(d);
				
			} );
			loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void{
				stopMask();
				error.apply(e.text);
			});
			loader.load(request);
		}
		
		/**
		 * 
		 * @param url 请求的方法
		 * @param requestVo
		 * @param complete
		 * @param error
		 * @param method
		 * 
		 */		
		public function sendFileAndMessage(url:String,requestVo:Object, complete:Function, error:Function,method:String = URLRequestMethod.POST):void{
			var params:URLVariables = new URLVariables();
			
			startMask();
			/*[IF-FLASH-BEGIN]*/
			var loader:URLLoader = new URLLoader();  
			var request:URLRequest = new URLRequest("http://192.168.1.118:8080/oa_system/"+url);  
						
			request.method = method;  
			var frm:MsMultiPartFormData = new MsMultiPartFormData();
			var hdr:URLRequestHeader = new URLRequestHeader("Content-Type","multipart/form-data;boundry="+frm.Boundary);


			var requestVosimple:URLVariables = new URLVariables();
			for(var key:String in requestVo){
				if(requestVo[key]!=null ){
					requestVosimple[key]=requestVo[key];
					frm.AddFormField(key,requestVo[key]);
				}
			}
			
			frm.AddStreamFile('file','aaa.txt',_byteArray);
			frm.PrepareFormData();
			request.requestHeaders.push(hdr);
			request.data = frm.GetFormData();trace("requestVosimple=",requestVosimple);      
			loader.addEventListener(Event.COMPLETE,function(e:Event):void{
				stopMask();
				
				var d:Object = JSON.parse(loader.data);
				complete(d);
				
			} );
			loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void{
				stopMask();
				error.apply(e.text);
			});
			loader.load(request);
			/*[IF-FLASH-END]*/ 
			/*[IF-SCRIPT-BEGIN]
			[IF-SCRIPT-END]*/ 
			
			
		}
		
		/**
		 *初始化弹出框需要的父容器 
		 * @param container
		 * @param child
		 * 
		 */		
		public function initPopu(container:Sprite ,child:Sprite=null):void{
			_box = container;
			_child = child;
			initMask();
		}
			
		/**
		 *弹出框 
		 * @param msg
		 * 
		 */		
		public function popu(msg:String):void
		{
			var popu:AlertUI = new AlertUI();
			popu.x = 478;
			popu.y = 370;
			popu.msg.text = msg;
//			popu.closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtn);
//			popu.confirmBtn.addEventListener(MouseEvent.CLICK,onCloseBtn);
			_box.addChild(popu);
		}
		
		protected function onCloseBtn(e:MouseEvent):void
		{
			var popu:AlertUI = e.target.parent as AlertUI;
			_box.removeChild(popu);
			popu = null;
			
		}
		
		/**
		 *打开交易 
		 * 
		 */		
		public function show():void
		{
			if(_child)
			_box.addChild(_child);
		}
		
		/**
		 *隐藏交易 
		 * 
		 */		
		public function hide():void
		{
			if(_child && _box.contains(_child))
			_box.removeChild(_child);
		}
		
		/*初始化遮罩信息*/
		protected function initMask():void{
			_mask = new Sprite();
			_mask.graphics.beginFill(0x888888,0.5);
			_mask.graphics.drawRect(0,0,Staged.staged.stageWidth,Staged.staged.stageHeight);
			_maskList = new Array();
			for( var i:int = 0 ; i < 8 ; i++ ){
				var s:Shape = new Shape();
				s.graphics.beginFill(0x222222,0.9)
				s.graphics.drawRect(-20,-2.5,10,2.5);
				s.rotation = i*45;
				s.x = Staged.staged.stageWidth/4;
				s.y = Staged.staged.stageHeight/3;
				_mask.addChild(s);
				_maskList.push(s);
			}
		}
		
		protected var maskTime:uint =0;
		/*开始遮罩*/
		protected function startMask():void{
			trace("开始遮罩");
			_box.addChild(_mask);
			maskTime = setInterval(drawMask,500);
		}
		
		protected function stopMask():void{
			_box.removeChild(_mask);
			clearInterval(maskTime);
		}
		
		protected var index:int = 0;//遮罩图标下标
		/*绘制遮罩图标*/
		protected function drawMask():void{
			var s:Shape = _maskList[index];
			s.graphics.clear();
			s.graphics.beginFill(0xffffff,0.8)
			s.graphics.drawRect(-20,-2.5,10,2.5);
			var lastIndex:int = index==0?7:index-1;
			var last:Shape = _maskList[lastIndex];
			last.graphics.clear();
			last.graphics.beginFill(0x222222,0.9)
			last.graphics.drawRect(-20,-2.5,10,2.5);
			index++;
			if(index >= 8)index=0;
		}
		
		//---------------------------文件上传相关------------------------
		private var filee:FileReferenceList;
		public function selectFileRefrence(fileDownLoadFunc:Function):void
		{
			_fileDownLoadFunc = fileDownLoadFunc;
			/*[IF-FLASH-BEGIN]*/
			filee=new FileReferenceList();
			filee.browse();//浏览
			
			filee.addEventListener(Event.SELECT,selected);//添加“选择文件”事件
			/*[IF-FLASH-END]*/ 
			/*[IF-SCRIPT-BEGIN]_fileDownLoadFunc();[IF-SCRIPT-END]*/ 
		}
		private function selected(e:Event):void
		{
			trace(filee.fileList);//加载
			for(var i:int=0;i<filee.fileList.length;i++){
				var fileReference:FileReference = filee.fileList[i] as FileReference;
				fileReference.addEventListener(Event.COMPLETE,on_loaded);//添加加载完成事件
				fileReference.load();
				
			}
			
			
		}
		
		
		
		private function on_loaded(e:Event):void
		{
			_byteArray = ByteArray(e.target.data);  //处理数据                  //这里非常关键 
//			var loader:Loader=new Loader();
//			loader.loadBytes(byteArray);
			trace("加载完成");
			_fileDownLoadFunc();
		}

		/**
		 *加载文件的二进制数据 
		 */
		public function get byteArray():ByteArray
		{
			return _byteArray;
		}

		/**
		 *路径 
		 */
		public function get path():String
		{
			return _path;
		}
		//--------------------------------------form----------------------------------------------
		/**
		 * 
		 * 
		 */
		protected function initForm():void{
			var f:String = "<input type=\"file\" name=\"file\">";
			__JS__('$("#newUpload2").empty();$("#newUpload2").append(f)');
		}
		/**
		 * 
		 * @param req
		 * 
		 */		
		protected function sendFormFile(req:Object):void{
			
			/*[IF-SCRIPT-BEGIN]
			var f:String = "";
			for(var key:String in req){
			f+="<input type=\"hidden\" name=\""+key+"\" value=\""+req[key]+"\" id = \""+key+"\">";
			}
			__JS__('$("#newUpload2").append(f);
			$("#userForm2").submit();');
			[IF-SCRIPT-END]*/ 
			
		}
		
		protected var form_s:Sprite;
		protected var t:uint;
		/**
		 * 
		 * @param s
		 * 
		 */		
		protected function showForm(s:Sprite):void{
			form_s = s;
			var lx:Number = s.x+142;
			var ly:Number = s.y+383;
			trace(lx,ly);
			__JS__('$("#newUpload2").show();$("#newUpload2").css({"left":lx+"px","top":ly+"px"})');
			t = setInterval(posForm,30);
		}
		
		
		protected function posForm():void{
			var lx:Number = form_s.x+142;
			var ly:Number = form_s.y+383;
//			trace(lx,ly);
			__JS__('$("#newUpload2").css({"left":lx+"px","top":ly+"px"})');
		}
		
		protected function hideForm():void{
			__JS__('$("#newUpload2").hide();');
			if(t)clearInterval(t);
		}
		//--------------------------------------form----------------------------------------------
		//-----------------------------------富文本编辑器--------------------------------------------
		protected var layaIndex:int ;
		protected function initFullEdit():void{
			/*[IF-SCRIPT-BEGIN]
			
			__JS__(" layui.use('layedit', function(){
			var layedit = layui.layedit;
			layaIndex = layedit.build('demo'); });");
			[IF-SCRIPT-END]*/ 
		}
		protected var fullEdit_s:Sprite;
		protected var ft:uint;
		protected function showFullEdit(s:Sprite):void{
			fullEdit_s = s;
			var lx:Number = fullEdit_s.x+142;
			var ly:Number = fullEdit_s.y+122;
			trace(lx,ly);
			__JS__('$(".layui-layedit").show();$(".layui-layedit").css({"position":"absolute","left":lx+"px","top":ly+"px","z-index":999,"width":"447px","height":"235px"})');
			ft = setInterval(posFullEdit,30);
		}
		protected function posFullEdit():void{
			var lx:Number = fullEdit_s.x+142;
			var ly:Number = fullEdit_s.y+122;
			//			trace(lx,ly);
			__JS__('$(".layui-layedit").css({"left":lx+"px","top":ly+"px"})');
		}
		protected function hideFullEdit():void{
			__JS__('$(".layui-layedit").hide();');
			if(ft)clearInterval(ft);
		}
		
//		protected var layaText:String="";
		/**
		 * 获得编辑器文本的类容 
		 * @return 
		 * 
		 */			
		protected function getLayaText():String{
			var layaText:String="";
			__JS__('layui.use("layedit", function(){var layedit = layui.layedit;layaText = layedit.getText(layaIndex)})');
			return layaText;
		}
		//-----------------------------------富文本编辑器--------------------------------------------
	}
}