package unitl
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import game.ui.date.CalendarUI;

	/**
	 * 日历控件
	 * @author QS--小小琪
	 * 
	 */
	public class Calendar
	{
		protected var _container:Sprite;
		protected var calendar:CalendarUI;
		protected var currentDate:Date;//当前的日期
		protected var date:Date;//改变的日期
		protected var calendarDay:Number = 1;//日历的日，默认第一天
		protected var calendarMonth:Number ;//日历的月份
		protected var calendarYear:Number;//日历的年份
		protected var labList:Array;
		public function Calendar(container:Sprite)
		{
			_container = container;
			initCalendar();
		}
		
		private function initCalendar():void
		{
			labList = new Array();
			calendar = new CalendarUI();
			currentDate = new Date();
			calendarMonth = currentDate.getMonth();
			calendarDay = currentDate.getDate();
			calendarYear = currentDate.getFullYear();
			date = new Date();
			drawCalendar();
			renderCalendar(date);
			calendar.prevBtn.addEventListener(MouseEvent.CLICK, onLastHandler);
			calendar.nextBtn.addEventListener(MouseEvent.CLICK, onNextHandler);
		}
		
		/**
		 * 下一个月份
		 * @param e
		 * 
		 */		
		protected function onNextHandler(e:MouseEvent):void
		{
			calendarMonth++;
			if(calendarMonth == 12){calendarMonth=0;date.setFullYear(++calendarYear)}
			date.setMonth(calendarMonth);
			trace(date.getFullYear(),date.getMonth(),date.getDate(),"+",calendarMonth,calendarYear);
			renderCalendar(date);
			
		}
		
		/**
		 *上一个月份 
		 * @param e
		 * 
		 */		
		protected function onLastHandler(e:MouseEvent):void
		{
			calendarMonth--;
			if(calendarMonth == -1){calendarMonth=11;date.setFullYear(--calendarYear)}
			date.setFullYear(calendarYear);//在年份递减时要重新设置下否则不会
			date.setMonth(calendarMonth);
			trace(date.getFullYear(),date.getMonth(),date.getDate(),"-",calendarMonth,calendarYear);
			renderCalendar(date);
			
		}
		/**
		 * 显示日历
		 * 
		 */		
		public function show(x:Number, y:Number):void
		{
			calendar.x = x||400;
			calendar.y = y||400;
			_container.addChild(calendar);
		}
		/**
		 * 隐藏日历
		 * 
		 */		
		public function hide():void
		{
			_container.removeChild(calendar);
		}
		
		
		
		/**绘制日历主体**/
		protected function drawCalendar():void
		{
			calendar.graphics.lineStyle(1,0x00);
			calendar.graphics.moveTo(10,46);
			calendar.graphics.lineTo(10,196);
			calendar.graphics.moveTo(10,46);
			calendar.graphics.lineTo(185,46);                                                                                                                                               
			for(var i:int = 1;i<=42;i++){
				if( i % 7 == 0 ){
					calendar.graphics.moveTo(10,46+(i/7)*25);
					calendar.graphics.lineTo(185,46+(i/7)*25); 
				}
				if( i <= 7 ){
					calendar.graphics.moveTo(10+i*25,46);
					calendar.graphics.lineTo(10+i*25,196); 
				}
				var t:TextField = new TextField();
				t.width = t.height = 25;
//				t.border = false;
				t.x = 10 + (i-1)%7*25;
				t.y = 46 + Math.floor((i-1)/7)*25;
//				t.text = i+"";
				calendar.addChild(t);
				labList.push(t);
			}
		}
		
			
		
		
		/**
		 *渲染日历数据 
		 * 
		 */		
		protected function renderCalendar( d:Date ):void
		{
			date.setDate(1);
			calendarYear = d.getFullYear();
			calendarMonth = d.getMonth();
			calendarDay = d.getDate();
			calendar.dateTxt.text = calendarYear+"年"+(calendarMonth+1)+"月"+calendarDay+"日";
			var index:Number = 1;//当月起始的天数
			var week:Number = d.getDay();//获取当月星期几
			
			for( var i:int = 0;i<42;i++ ){
				var t:TextField = labList[i];
				if(i >=week  ){
					if(d.getMonth()==calendarMonth)
					d.setDate(index++);
					if(d.getMonth()==calendarMonth){
						t.text = d.getDate()+"";
					}else{
						t.text = "";
					}
					
					
				}else{
					t.text = "";
				}
				
			}
		}
	}
}