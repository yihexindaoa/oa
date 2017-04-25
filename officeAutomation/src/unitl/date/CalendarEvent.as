package unitl.date
{
	import flash.events.Event;
	
	public class CalendarEvent extends Event
	{
		/**
		 *向外派发显示日期事件 
		 */		
		public static const DATE:String = "date";
		/**
		 * 
		 * @param type
		 * @param date 日期
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function CalendarEvent(type:String,date:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_date = date;
		}
		protected var _date:String;

		/**
		 *日期 
		 */
		public function get date():String
		{
			return _date;
		}

	}
}