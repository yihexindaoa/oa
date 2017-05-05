package game.ui.homePage
{
	import flash.events.Event;
	/**
	 * 首页事件
	 * @author QS
	 * 
	 */	
	public class HomeEvent extends Event
	{
		public static const  NAME:String = "HOME";
		protected var _notice:String;
		/**
		 * 首页事件
		 * @param type
		 * @param notice
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function HomeEvent(type:String, notice:String ,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_notice = notice;
		}

		/**
		 *向外派发类型 
		 */
		public function get notice():String
		{
			return _notice;
		}

	}
}