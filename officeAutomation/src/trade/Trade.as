package trade
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Point;
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
	
	import morn.core.components.ComboBox;
	import morn.core.components.Component;
	import morn.core.components.TextInput;
	
	import unitl.file.MsMultiPartFormData;

	public class Trade extends EventDispatcher
	{
		protected var _box:Sprite;
		protected var _child:Sprite;
		protected var _mask:Sprite;//遮罩
		protected var _maskList:Array;
		protected var _byteArray:ByteArray;
		protected var _path:String = Config.PATH;//"http://192.168.1.115:8080/oa_system/";
		protected static var isInit:Boolean ;//保证富文本框只被初始化一次
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
			/*popu.x = 478;
			popu.y = 370;*/
			popu.msg.text = msg;
			popu.show();
//			popu.closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtn);
//			popu.confirmBtn.addEventListener(MouseEvent.CLICK,onCloseBtn);
//			_box.addChild(popu);
		}
		
		/**
		 *弹出确认框 
		 * @param msg
		 * @param callBack
		 * 
		 */		
		public function popuConfirm(msg:String, callBack:Function):void{
			var popu:AlertUI = new AlertUI();
			popu.x = 478;
			popu.y = 370;
			popu.msg.text = msg;
			popu.confirmBtn.addEventListener(MouseEvent.CLICK,function(e:MouseEvent):void{
				callBack();
			});
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
			if(_child){
				_box.addChild(_child);
				dispatchEvent(new Event("SHOWTRADE"));
			}
		}
		
		/**
		 *隐藏交易 
		 * 
		 */		
		public function hide():void
		{
			if(_child && _box.contains(_child)){
				_box.removeChild(_child);
				dispatchEvent(new Event("CLOSETRADE"));
			}
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
				s.x = Staged.staged.stageWidth/3;
				s.y = Staged.staged.stageHeight/2;
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
			if(_mask.parent)
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
			/*[IF-FLASH-BEGIN]
			filee=new FileReferenceList();
			filee.browse();//浏览
			
			filee.addEventListener(Event.SELECT,selected);//添加“选择文件”事件
			[IF-FLASH-END]*/ 
			///*[IF-SCRIPT-BEGIN]
			_fileDownLoadFunc();//[IF-SCRIPT-END]*/ 
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
			_JS__AS_("as_initForm");
		}
		/**
		 * 
		 * @param req
		 * @param fullid 富文本框id, 传的内容的Id
		 * @param url
		 * @param callback
		 * 
		 */			
		protected function sendFormFile(req:Object ,fullid:String = null, url:String,callback:Function = null ):void{
			
			
			var f:String = "";
			for(var key:String in req){
				f+="<input type=\"hidden\" name=\""+key+"\" value=\""+req[key]+"\" id = \""+key+"\">";
				_JS__AS_("as_createInput",null,null,key,req[key]);
				
			}
			/*[IF-SCRIPT-BEGIN]
			__JS__('
			
			
			$("#newUpload2").append(f);
			as_sendFromFile(1,this._path+url);
			function as_sendFromFile(layaIndex ,url){
				$("#userForm2").attr("action", url);
				if(fullid){
					var layaText;
					layui.use("layedit", function(){
						var layedit = layui.layedit;layaText = layedit.getContent(layaIndex);
						$("#"+fullid).val(layaText);console.log("sendfile",layaIndex,layaText);
						isNull = false;
						uptDogProInfo();
					});
				}else{
					uptDogProInfo();
				}
			
			}
			
			//使用ajaxSubmit上传文件返回
			function uptDogProInfo(){
				var ajax_option={
					url:$("#userForm2").attr("action"),//form 的action
						type:"post",  //form 的method方法
						beforeSubmit:checkUppro,  //在表达提交前执行的验证函数
						contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
						success:function(data){  //表单提交成功后执行的函数
							//alert("执行成功！");
							callback(JSON.stringify(data));
						}
				}
				$("#userForm2").ajaxSubmit(ajax_option);
			}
			function checkUppro(){
				
			}');
			[IF-SCRIPT-END]*/ 
			//__JS__('var layaText;layui.use("layedit", function(){		var layedit = layui.layedit;layaText = layedit.getContent(layaIndexH); $("#"+nullKey).val(layaText);console.log("sendfile",layaIndexH,layaText);');
			//__JS__('$("#newUpload2").append(f);$("#userForm2").attr("action", this._path+url);			var ajax_option={		url:$("#userForm2").attr("action"),	type:"post",  		beforeSubmit:function(){},  	contentType: "application/x-www-form-urlencoded; charset=utf-8",  	success:function(data){  					callback(JSON.stringify(data));			}			}			')
			//__JS__('$("#userForm2").ajaxSubmit(ajax_option);')
			
			_JS__AS_("as_sendFromFile",callback,"sendFromFileCallBack",layaIndex,_path+url);
			
			
		}
		
//		protected var form_s:Sprite;
		protected var  form_s:Point;
		protected var  form_p:Sprite;
		protected var t:uint;
		/**
		 * 
		 * @param p 父容器
		 * @param s
		 * 
		 */			
		protected function showForm(p:Sprite,s:Point):void{
			form_s = s;
			form_p = p;
			var lx:Number = form_p.x + s.x;
			var ly:Number = form_p.y + s.y;
			trace(lx,ly);
			var f:String = "<input type=\"file\" name=\"file\">";
			__JS__('$("#newUpload2").empty();$("#newUpload2").append(f);$("#newUpload2").show();$("#newUpload2").css({"left":lx+"px","top":ly+"px"})');
			_JS__AS_("as_showForm",null,null,lx,ly);
			///*[IF-SCRIPT-BEGIN]
			t = setInterval(posForm,30);
			//[IF-SCRIPT-END]*/ 
		}
		
		
		protected function posForm():void{
			var lx:Number = form_p.x + form_s.x;
			var ly:Number = form_p.y + form_s.y;
//			trace(lx,ly);
			__JS__('$("#newUpload2").css({"left":lx+"px","top":ly+"px"})');
			_JS__AS_('as_posForm',null,null,lx,ly);
		}
		
		protected function hideForm():void{
			__JS__('$("#newUpload2").hide();');
			_JS__AS_('as_hideForm');
			//*[IF-SCRIPT-BEGIN]
			if(t)clearInterval(t);
			//[IF-SCRIPT-END]*/ 
		}
		//--------------------------------------form----------------------------------------------
		//-----------------------------------富文本编辑器--------------------------------------------
		protected  var layaIndex:int ;
		protected function initFullEdit():void{
			if(isInit)return;
			isInit = true;
			/*[IF-SCRIPT-BEGIN]
			
			__JS__(" layui.use('layedit', function(){	var layedit = layui.layedit; console.log('layedit=',layedit);	layedit.set({  uploadImage: {	url: Config.PATH+'file/fileImgUpload',  	type: 'post' ,success: function(res){   console.log('上传图片成功',res);   }}});this.layaIndex = layedit.build('demo'); });");
			
			[IF-SCRIPT-END]*/ 
			/*[IF-FLASH-BEGIN]*/
			layaIndex = _JS__AS_("as_initFullEdit",null,null,_path);
			/*[IF-FLASH-END]*/ 
		}
		protected var fullEdit_s:Point;
		protected var fullEdit_p:Sprite;
		protected var ft:uint;
		protected function showFullEdit(p:Sprite,s:Point):void{
			fullEdit_s = s;
			fullEdit_p = p;
			var lx:Number = fullEdit_p.x+fullEdit_s.x;
			var ly:Number = fullEdit_p.y+fullEdit_s.y;
			trace(lx,ly);
			__JS__('$(".layui-layedit").show();$(".layui-layedit").css({"position":"absolute","left":lx+"px","top":ly+"px","z-index":999,"width":"447px","height":"235px"})');
			_JS__AS_('as_showFullEdit',null,null,lx,ly);
			///*[IF-SCRIPT-BEGIN]
			ft = setInterval(posFullEdit,30);
			//[IF-SCRIPT-END]*/ 
		}
		protected function posFullEdit():void{
			var lx:Number = fullEdit_p.x+fullEdit_s.x;
			var ly:Number = fullEdit_p.y+fullEdit_s.y;
			//			trace(lx,ly);
			__JS__('$(".layui-layedit").css({"left":lx+"px","top":ly+"px"})');
			_JS__AS_('as_posFullEdit',null,null,lx,ly);
		}
		protected function hideFullEdit():void{
			__JS__('$(".layui-layedit").hide();');
			_JS__AS_('as_hideFullEdit');
			///*[IF-SCRIPT-BEGIN]
			if(ft)clearInterval(ft);
			//[IF-SCRIPT-END]*/ 
		}
		
//		protected var layaText:String="";
		/**
		 * 获得编辑器文本的类容 
		 * @return 
		 * 
		 */			
		protected function getLayaText():String{
			var layaText:String="";
			__JS__('layui.use("layedit", function(){var layedit = layui.layedit;layaText = layedit.getText(this.layaIndex)})');
			/*[IF-FLASH-BEGIN]*/
			layaText = _JS__AS_('as_getLayaText',null,null,layaIndex);
			/*[IF-FLASH-END]*/ 
			return layaText;
		}
		//-----------------------------------富文本编辑器--------------------------------------------
		
		
		//-------------------------------------------as3调用js------------------------------------------------------------
		/**
		 * AS3执行js代码
		 * @param func
		 * @param callback
		 * @param callbackName js 回调函数的名字
		 * @param args
		 * @return 
		 * 
		 */			
		protected function _JS__AS_(func:String,callback:Function=null,callbackName:String=null,...args):*{
			//eval是js的一个“古老”的函数，目前所有知名的浏览器都支持，在AS3中可以放心使用。
			//参数js eval详细资料：http://www.w3schools.com/jsref/jsref_eval.ASP
			/*[IF-FLASH-BEGIN]*/
			if(callback && callbackName)
			ExternalInterface.addCallback(callbackName, callback);
			
			if(args.length <1)
				return ExternalInterface.call(func,args);
			else if(args.length == 1)
				return ExternalInterface.call(func,args[0]);
			else if(args.length == 2)
				return ExternalInterface.call(func,args[0],args[1]);
			/*[IF-FLASH-END]*/ 
			
		}
		
		
		/**
		 *根据某个属性来排序 升序排列
		 * @param key
		 * @return 
		 * 
		 */		
		protected function sortOn(key:String, list:Array):Array{
			for( var i:int = 0, m:int = list.length; i < m ;i++ ){
				for( var j:int = i+1 ; j < m ; j++ ){
					if(list[i][key] > list[j][key]){
						var tmp:Object = list[i][key];
						list[i][key] = list[j][key];
						list[j][key] = tmp;
					}
				}
			}
			
			return list;
		}
		
		/**
		 *按某个属性同值来分隔数组 
		 * @param key
		 * @param list
		 * @return 
		 * 
		 */		
		protected function separatorArray( key:String, list:Array ,same:Object):Array{
			var err:Array = new Array();
			for( var i:int = 0, m:int = list.length; i < m ;i++ ){
				if(same && list[i][key] == same){
					err.push(list[i]);
				}
			};
			return err;
		}
		
		/**
		 *清楚自身下面文本内容 
		 * @param component
		 * 
		 */		
		protected function clear( component:Component ):void{
			for(var i:int  = 0,m:int = component.numChildren; i<m;i++){
				if( component.getChildAt(i) is TextInput )
				{
					(component.getChildAt(i)  as TextInput).text = "";
				}else if(component.getChildAt(i) is ComboBox){
					(component.getChildAt(i) as ComboBox).selectedIndex = -1;
				}
			}
		}
		
		/**
		 *获取容器里面数据 
		 * @param component
		 * @return 
		 * 
		 */		
		protected function getData(component:Component ):Object{
			var data:Object = new Object();
			for(var i:int  = 0,m:int = component.numChildren; i<m;i++){
				if( component.getChildAt(i) is TextInput )
				{
					var text:TextInput = (component.getChildAt(i)  as TextInput);
					if(text.text!=""){
						if(text.isCalendar){
							data[text.name] = parseInt(text.text);trace(text.name,"=",data[text.name])
						}else
							data[text.name] = text.text;
					}
					
				}else if(component.getChildAt(i) is ComboBox){
					var com:ComboBox = (component.getChildAt(i) as ComboBox);
					if(com.selectedIndex!=-1)
					data[com.name] = com.selectedIndex;
				}
			}
			return data;
		}
		
		/**
		 *把值设置到iframe富文本编辑框里面去 
		 * @param content
		 * 
		 */		
		protected function setContent(content:String,indexcontent:int):void{
			__JS__('$("#LAY_layedit_"+1).contents().find("body").html(content)');
			_JS__AS_("as_setContentText",null,null,content,indexcontent);
		}
		
	}
}