package notice
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;
	import flash.net.sendToURL;
	
	import game.ui.notice.NoticeDetailUI;
	
	import morn.core.handlers.Handler;
	
	import trade.Trade;

	/**
	 * 通告详情
	 * @author QS
	 * 
	 */
	public class NoticeDetail extends Trade
	{
		protected var _container:Sprite;
		protected var _detail:NoticeDetailUI;
		protected var _key:String;//附件下载的key类似url
		/**
		 *通告详情 
		 * @param container 父容器
		 * 
		 */		
		public function NoticeDetail(container:Sprite)
		{
			_container = container;
			initDetail();
			super.initPopu(container,_detail);
		}
		
		/*初始化详情*/
		private function initDetail():void
		{
			_detail = new NoticeDetailUI();
			_detail.downBtn.mouseEnabled = false;
			_detail.downBtn.addEventListener(MouseEvent.CLICK, onClickhandler);
			_detail.content.visible = false;
			_detail.closeHandler = new Handler(editCloseHandler);
			initFullEdit();
		}
		
		/**附件下载**/
		protected function onClickhandler(e:MouseEvent):void
		{
			/*send("notice/fileDownload",{"fileKey":_key},function(data:Object):void{
			
			
			}, onError,URLRequestMethod.POST);*/
			/*[IF-FLASH-BEGIN]*/
			navigateToURL(new URLRequest(path+"notice/fileDownload?fileKey="+encodeURI(_key)));
			/*[IF-FLASH-END]*/ 
			__JS__('window.open(this.path+"notice/fileDownload?fileKey="+this._key)');
		}
		
		/**
		 *显示详情  
		 * @param id
		 */			
		public function showDetail(id:int):void{
			_detail.show();
			showFullEdit(_detail,new Point(142,122));
			send("notice/findNoticeById",{"id":id},onComplete, onError,URLRequestMethod.POST);
		}
		
		/*新增成功的回调函数*/
		protected function onComplete(data:Object):void{
			if(data.status == 200){
				_detail.signType.selectedIndex = data.data.signType;
				_detail.title.text = data.data.title;
				_detail.content.text = data.data.content;
				setContent(data.data.content,layaIndex);
				_detail.fileName.text = "无附件";
				_detail.downBtn.mouseEnabled = false;
				if(data.data.attachmentMap){
					for( var key:String in data.data.attachmentMap ){
						_key = key;
						_detail.fileName.text = data.data.attachmentMap[key];
						_detail.downBtn.mouseEnabled = true;
					}
				}
					
				
			}else{
				popu(data.msg);
			}
		}
		
		/*新增出错的函数*/
		protected function onError(msg:String):void{
			popu(msg);
		}
		/**
		 *隐藏详情 
		 * 
		 */		
		public function hideDetail():void{
			
		}
		
		
		/**edit关闭的回调函数**/
		protected function editCloseHandler(type:String):void{
			
			hideFullEdit();
		}
	}
}