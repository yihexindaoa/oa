package notice
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequestMethod;
	
	import game.ui.notice.NoticeEditUI;
	
	import morn.core.events.DragEvent;
	import morn.core.handlers.Handler;
	
	import trade.Trade;

	/**
	 * 通告编辑
	 * @author QS
	 * 
	 */
	public class NoticeEdit extends Trade
	{
		protected var _container:Sprite;
		protected var _edit:NoticeEditUI;
		protected var _id:int ;
		/**
		 * 通告编辑
		 * @param container 父容器
		 * 
		 */		
		public function NoticeEdit(container:Sprite)
		{
			_container = container;
			initEdit();
			super.initPopu(container,_edit);
		}
		
		private function initEdit():void
		{
			_edit = new NoticeEditUI();
			_edit.sendBtn.addEventListener(MouseEvent.CLICK, onSendHandler);
			/*[IF-FLASH-BEGIN]*/
			//edit.sendBtn.mouseEnabled = false;
			_edit.upLoadBtn.addEventListener(MouseEvent.CLICK, onSelectFileHandler);
			/*[IF-FLASH-END]*/ 
			_edit.closeHandler = new Handler(editCloseHandler);
			_edit.addEventListener(DragEvent.DRAG_START, onDragHandler);
			//在js中隐藏掉上传按钮
			///*[IF-SCRIPT-BEGIN]
			
			_edit.upLoadBtn.visible = false;
			_edit.content.visible = false;
			//[IF-SCRIPT-END]*/ 
			initForm();
			initFullEdit();
		}
		
		protected function onDragHandler(e:DragEvent):void
		{
			trace("移动",_edit.x,_edit.y);
		}
		
		protected function onSelectFileHandler(e:MouseEvent):void
		{
			_edit.progress.visible = true;
			selectFileRefrence(function():void{
				_edit.sendBtn.mouseEnabled = true;
				_edit.progress.value = 1;
			});
		}
		/*发送*/
		protected function onSendHandler(e:MouseEvent):void
		{
			var request:Object = new Object();
			request.signType = _edit.signType.selectedIndex;//告示类型
			request.title = _edit.title.text;//标题
			request.content = getLayaText();//_edit.content.text;//内容
			request.typeName = _edit.signType.selectedLabel;
			switch(_edit.operTxt.text)
			{
				case "新增":
					
					
//					request.file = "";//trace("request=",request);
//					send("notice/saveNotice",request,onComplete, onError,URLRequestMethod.POST);
					/*[IF-FLASH-BEGIN]*/
//						sendFileAndMessage("notice/saveNotice",request,onComplete, onError);
					/*[IF-FLASH-END]*/ 
					sendFormFile(request, "notice/saveNotice",function(value:String):void{
						trace("新增JavaScript says: " + value + "\n");
						_edit.close();
						popu(value);
					});
					/*
					 * $.ajax({type:"POST",
						url:this.path+"notice/saveNotice",
						contentType: false,
						data:new FormData($("#userForm2")[0]),
						success:function(data){console.log(data)}})
						*/
						
					break;
				case "编辑":
					request.id = _id;
					sendFormFile(request, "notice/modifyNotice",function(value:String):void{
						trace("编辑JavaScript says: " + value + "\n");
						_edit.close();
						popu(value);
					});
					break;
				default:
					break;
			}
		}
		/*新增成功的回调函数*/
		protected function onComplete(data:Object):void{
			if(data.status == 200){
				
			}else{
				popu(data.msg);
			}
			
		}
		/*新增出错的函数*/
		protected function onError(msg:String):void{
			
		}
		
		
		/**
		 * 显示新增页面
		 * 
		 */		
		public function showAdd():void{
			_edit.operTxt.text = "新增";
			
			_edit.show();
			showForm(_edit,new Point(142,383));
			showFullEdit(_edit,new Point(142,122));
		}
		
		
		/**edit关闭的回调函数**/
		protected function editCloseHandler(type:String):void{
			
			hideForm();
			hideFullEdit();
		}
		
		/**
		 * 显示编辑页面
		 * 
		 */		
		public function showEdit(id:int):void{
			_id = id;
			_edit.operTxt.text = "编辑";
			_edit.show();
			showForm(_edit,new Point(142,383));
			showFullEdit(_edit,new Point(142,122));
			send("notice/findNoticeById",{"id":id},onfindNoticeComplete, onError,URLRequestMethod.POST);
		}
		
		/*新增成功的回调函数*/
		protected function onfindNoticeComplete(data:Object):void{
			if(data.status == 200){
				_edit.signType.selectedIndex = data.data.signType;
				_edit.title.text = data.data.title;
				_edit.content.text = data.data.content;
				setContent(data.data.content,layaIndex);				
				/*if(data.data.attachmentMap){
					for( var key:String in data.data.attachmentMap ){
						_key = key;
						_detail.fileName.text = data.data.attachmentMap[key];
						_detail.downBtn.mouseEnabled = true;
					}
				}*/
				
			}else{
				popu(data.msg);
			}
		}
		
	}
}