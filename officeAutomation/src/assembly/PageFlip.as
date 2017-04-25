package assembly
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import game.ui.basic.FlipUI;

	/**
	 * 翻页控件
	 * @author QS
	 * 
	 */	
	public class PageFlip extends Sprite
	{
		protected var _page:FlipUI;
		/**
		 *总记录 
		 */		
		protected var _totalPage:int = 0;
		protected var _pageSize:int = 10;
		protected var _pageNum:int = 0;
		protected var _currentPage:int = 1;
		/**
		 *  翻页控件
		 * 
		 */		
		public function PageFlip()
		{
			initPage();
		}
		
		private function initPage():void
		{
			_page = new FlipUI();
			addChild(_page);
			_page.pageTxt.text = "1";
			_page.lastBtn.addEventListener(MouseEvent.CLICK,onLastHandler);
			_page.nextBtn.addEventListener(MouseEvent.CLICK,onNextHandler);
			_page.firBtn.addEventListener(MouseEvent.CLICK, onFirstHandler);
			_page.endBtn.addEventListener(MouseEvent.CLICK, onEndHandler);
		}
		
		/**末页**/
		protected function onEndHandler(event:MouseEvent):void
		{
			_currentPage=_pageNum;
			dispatchEvent(new PageEvent(PageEvent.CURRENT_PAGE,_totalPage,_pageSize,_pageNum,_pageNum));
			_page.pageTxt.text = ""+_currentPage;
		}
		/**首页**/
		protected function onFirstHandler(event:MouseEvent):void
		{
			_currentPage = 1;
			dispatchEvent(new PageEvent(PageEvent.CURRENT_PAGE,_totalPage,_pageSize,1,_pageNum));
			_page.pageTxt.text = "1";
		}
		/**下一页**/
		protected function onNextHandler(event:MouseEvent):void
		{
			_currentPage++;
			if(_currentPage> _pageNum)_currentPage=_pageNum;
			dispatchEvent(new PageEvent(PageEvent.CURRENT_PAGE,_totalPage,_pageSize,_currentPage,_pageNum));
			_page.pageTxt.text = ""+_currentPage;
		}
		
		/**上一页**/
		protected function onLastHandler(e:MouseEvent):void
		{
			_currentPage--;
			if(_currentPage<1)_currentPage=1;
			dispatchEvent(new PageEvent(PageEvent.CURRENT_PAGE,_totalPage,_pageSize,_currentPage,_pageNum));
			_page.pageTxt.text = ""+_currentPage;
		}
		
		/**
		 *总记录 
		 */
		public function get totalPage():int
		{
			return _totalPage;
		}

		public function set totalPage(value:int):void
		{
			_totalPage = value;
			_pageNum = Math.ceil(_totalPage/_pageSize);
			_page.msgTxt.text = "总共"+_totalPage+"条记录，每页"+_pageSize+"条，共"+_pageNum+"页";
		}

		public function get pageSize():int
		{
			return _pageSize;
		}

		public function set pageSize(value:int):void
		{
			_pageSize = value;
			_pageNum = Math.ceil(_totalPage/_pageSize);
			_page.msgTxt.text = "总共"+_totalPage+"条记录，每页"+_pageSize+"条，共"+_pageNum+"页";
		}

		/**
		 *页数 
		 * 
		 */
		public function get pageNum():int
		{
			return _pageNum;
		}

		/**
		 * @private
		 */
		public function set pageNum(value:int):void
		{
			_pageNum = value;
		}

		/**
		 *当前页 
		 */
		public function get currentPage():int
		{
			return _currentPage;
		}

		/**
		 * @private
		 */
		public function set currentPage(value:int):void
		{
			_currentPage = value;
			_page.pageTxt.text = _currentPage+"";
			
		}
		
		/**
		 *设置宽 
		 * @param w
		 * 
		 */			
		public function setWidth(w:Number):void
		{
			_page.box.left = w-192;
			_page.bgTxt.width = w-4;
			_page.graphics.clear();
			_page.graphics.lineStyle(2,0x333300,0.5);
			_page.graphics.beginFill(0x99cc,0.5);
			_page.graphics.drawRoundRect(0,0,w,37,10,10);
			_page.graphics.endFill();
		}
		
	}
}