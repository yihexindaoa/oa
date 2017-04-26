package notice
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
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
			_edit.sendBtn.mouseEnabled = false;
			_edit.upLoadBtn.addEventListener(MouseEvent.CLICK, onSelectFileHandler);
			/*[IF-FLASH-END]*/ 
			_edit.closeHandler = new Handler(editCloseHandler);
			_edit.addEventListener(DragEvent.DRAG_START, onDragHandler);
			//在js中隐藏掉上传按钮
			/*[IF-SCRIPT-BEGIN]
			
			_edit.upLoadBtn.visible = false;
			[IF-SCRIPT-END]*/ 
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
			switch(_edit.operTxt.text)
			{
				case "新增":
					var request:Object = new Object();
					request.signType = _edit.signType.selectedIndex;//告示类型
					request.title = _edit.title.text;//标题
					request.content = _edit.content.text;//内容
					
					
//					request.file = "";//trace("request=",request);
//					send("notice/saveNotice",request,onComplete, onError,URLRequestMethod.POST);
					/*[IF-FLASH-BEGIN]*/
						sendFileAndMessage("notice/saveNotice",request,onComplete, onError);
					/*[IF-FLASH-END]*/ 
					/*[IF-SCRIPT-BEGIN]
					__JS__('$("#signType").val(this._edit.signType.selectedIndex);$("#title").val(this._edit.title.text);
						$("#content").val(this._edit.content.text);
						$("#userForm2").submit()');
					[IF-SCRIPT-END]*/ 
					/*
					 * $.ajax({type:"POST",
						url:this.path+"notice/saveNotice",
						contentType: false,
						data:new FormData($("#userForm2")[0]),
						success:function(data){console.log(data)}})
						*/
						
					break;
				case "编辑":
					
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
			var lx:Number = _edit.x+142;
			var ly:Number = _edit.y+383;
			trace(lx,ly);
			__JS__('$("#newUpload2").show();$("#newUpload2").css({"left":lx+"px","top":ly+"px"})')
			
		}
		
		/**edit关闭的回调函数**/
		protected function editCloseHandler():void{
			__JS__('$("#newUpload2").hide();');
		}
		
		/**
		 * 显示编辑页面
		 * 
		 */		
		public function showEdit():void{
			_edit.operTxt.text = "编辑";
			_edit.show();
		}
		
	}
}