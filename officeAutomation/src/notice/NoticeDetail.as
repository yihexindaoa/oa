package notice
{
	import flash.display.Sprite;
	import flash.net.URLRequestMethod;
	import flash.net.sendToURL;
	
	import game.ui.notice.NoticeDetailUI;
	
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
			
		}
		
		/**
		 *显示详情  
		 * @param id
		 */			
		public function showDetail(id:int):void{
			_detail.show();
			
			send("notice/findNoticeById",{"id":id},onComplete, onError,URLRequestMethod.POST);
		}
		
		/*新增成功的回调函数*/
		protected function onComplete(data:Object):void{
			if(data.status == 200){
				_detail.signType.selectedIndex = data.data.signType;
				_detail.title.text = data.data.title;
				_detail.content.text = data.data.content
			}else{
				popu(data.msg);
			}
		}
		
		/*新增出错的函数*/
		protected function onError(msg:String):void{
			
		}
		/**
		 *隐藏详情 
		 * 
		 */		
		public function hideDetail():void{
			
		}
	}
}