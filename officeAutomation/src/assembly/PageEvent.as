package assembly
{
	import flash.events.Event;
	
	public class PageEvent extends Event
	{
		/**
		 *派发当前页事件 
		 */		
		public static const  CURRENT_PAGE:String = "currentPage";
		protected var _totalPage:int = 0;
		protected var _pageSize:int = 10;
		protected var _pageNum:int = 0;
		protected var _currentPage:int = 0;
		/**
		 * 
		 * @param type 事件类型
		 * @param total 总记录 
		 * @param pageSize 每页显示多少条
		 * @param currentPage 当前页 
		 * @param pageNum 页数
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function PageEvent(type:String,total:int,pageSize:int,currentPage:int,pageNum:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		/**
		 *总记录 
		 */
		public function get totalPage():int
		{
			return _totalPage;
		}

		/**
		 * @private
		 */
		public function set totalPage(value:int):void
		{
			_totalPage = value;
		}

		/**
		 * 每页显示多少条
		 */
		public function get pageSize():int
		{
			return _pageSize;
		}

		/**
		 * @private
		 */
		public function set pageSize(value:int):void
		{
			_pageSize = value;
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
		}


	}
}