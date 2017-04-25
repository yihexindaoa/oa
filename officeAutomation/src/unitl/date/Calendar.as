package unitl.date
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import game.ui.date.CalendarUI;
	
	import morn.core.components.Button;

	/**
	 * 日历控件
	 * @author QS--小小琪
	 * 
	 */
	public class Calendar extends EventDispatcher
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
//			drawCalendar();
			for(var i:int = 1;i<=42;i++){
				var t:Button = new Button()//TextField = new TextField();
				t.width = t.height = 25;
				t.x = 10 + (i-1)%7*25;
				t.y = 46 + Math.floor((i-1)/7)*25;
				calendar.addChild(t);
				labList.push(t);
				t.useHandCursor = true;
				
				t.addEventListener(MouseEvent.CLICK, onSelectHandler);
			}
			renderCalendar(date);
			calendar.dateTxt.text = calendarYear+"年"+(calendarMonth+1)+"月";//+calendarDay+"日";
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
			calendar.scaleX = 0.1;
			calendar.scaleY = 0.1;
			_container.addChild(calendar);
			TweenLite.to(calendar, 0.6, {scaleX:1,scaleY:1,onComplete:drawCalendar});//不得已，缩放时绘图不会缩放
		}
		/**
		 * 隐藏日历
		 * 
		 */		
		public function hide():void
		{
			_container.removeChild(calendar);
			calendar.graphics.clear();
		}
		
		
		
		/**绘制日历主体**/
		protected function drawCalendar():void
		{
			calendar.graphics.clear();
			calendar.graphics.beginFill(0x66cccc,0.3);
			calendar.graphics.drawRoundRect(0,0,200,200,20,20);
			calendar.graphics.lineStyle(1,0x00);
			calendar.graphics.moveTo(10,21/*46*/);
			calendar.graphics.lineTo(10,196);
			calendar.graphics.moveTo(10,21);
			calendar.graphics.lineTo(185,21);                                                                                                                                               
			for(var i:int = 1;i<=42;i++){
				if( i % 7 == 0 ){
					calendar.graphics.moveTo(10,21+(i/7)*25);
					calendar.graphics.lineTo(185,21+(i/7)*25); 
				}
				if( i <= 7 ){
					calendar.graphics.moveTo(10+i*25,21);
					calendar.graphics.lineTo(10+i*25,196); 
				}
				
			}
		}
		
		/**
		 *日历选择事件 
		 * @param e
		 * 
		 */		
		protected function onSelectHandler(e:MouseEvent):void
		{
			var t:Button = e.target as Button;
			if(t && t.label !=""){
				
				calendar.dateTxt.text = calendarYear+"年"+(calendarMonth+1)+"月";//+t.label+"日";
				t.graphics.clear();
				t.graphics.beginFill(0x00ff00,0.7);
				t.graphics.drawRect(0,0,25,25);
				dispatchEvent(new CalendarEvent(CalendarEvent.DATE,calendarYear+"/"+(calendarMonth+1)+"/"+t.label ));
				for( var i:int = 0;i<42;i++ ){
					var ts:Button = labList[i];
					if(ts==t)continue;
					ts.graphics.clear();
					ts.graphics.beginFill(0x666666,0.7);
					ts.graphics.drawRect(0,0,25,25);
				}
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
				var t:Button = labList[i];
				if(i >=week  ){
					if(d.getMonth()==calendarMonth)
					d.setDate(index++);
					if(d.getMonth()==calendarMonth){
						t.label = d.getDate()+"";
						if(currentDate.getDate() == d.getDate() && currentDate.getMonth() == d.getMonth() && currentDate.getFullYear() == d.getFullYear() ){
							t.graphics.clear();
							t.graphics.beginFill(0xff0000,0.8);
							t.graphics.drawRect(0,0,25,25);
						}else{
							t.graphics.clear();
							t.graphics.beginFill(0x666666,0.8);
							t.graphics.drawRect(0,0,25,25);
						}
					}else{
						t.label = "";
						t.graphics.clear();
						t.graphics.beginFill(0x666666,0.8);
						t.graphics.drawRect(0,0,25,25);
					}
					
					
				}else{
					t.label = "";
					t.graphics.clear();
					t.graphics.beginFill(0x666666,0.8);
					t.graphics.drawRect(0,0,25,25);
				}
				
			}
		}
	}
}