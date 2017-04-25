package notice
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequestMethod;
	
	import game.ui.notice.NoticeEditUI;
	
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
			_edit.sendBtn.mouseEnabled = false;
			_edit.upLoadBtn.addEventListener(MouseEvent.CLICK, onSelectFileHandler);
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
					var lx:Number = e.stageX;
					var ly:Number = e.stageY;
					trace(lx,ly);__JS__('$("#newUpload2").css({"left":lx+"px","top":ly+"px"})');
					[IF-SCRIPT-END]*/ 
						
						
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