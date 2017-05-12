/**
 * Morn UI Version 3.0 http://www.mornui.com/
 * Feedback yungvip@163.com weixin:yungzhu
 */
package morn.core.components {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextFieldType;
	
	import unitl.date.Calendar;
	import unitl.date.CalendarEvent;
	
	/**当用户输入文本时调度*/
	[Event(name="textInput",type="flash.events.TextEvent")]
	
	/**输入框*/
	public class TextInput extends Label {
		
		protected var _calendar:Calendar;
		protected var _content:TextInput;
		
		public function TextInput(text:String = "", skin:String = null) {
			super(text, skin);
		}
		
		override protected function initialize():void {
			super.initialize();
			mouseChildren = true;
			width = 128;
			height = 22;
			selectable = true;
			_textField.type = TextFieldType.INPUT;
			_textField.autoSize = "none";
			_textField.addEventListener(Event.CHANGE, onTextFieldChange);
			_textField.addEventListener(TextEvent.TEXT_INPUT, onTextFieldTextInput);
		}
		
		private function onTextFieldTextInput(e:TextEvent):void {
			dispatchEvent(e);
		}
		
		protected function onTextFieldChange(e:Event):void {
			text = _isHtml ? _textField.htmlText : _textField.text;
			e.stopPropagation();
		}
		
		/**指示用户可以输入到控件的字符集*/
		public function get restrict():String {
			return _textField.restrict;
		}
		
		public function set restrict(value:String):void {
			_textField.restrict = value;
		}
		
		/**是否可编辑*/
		public function get editable():Boolean {
			return _textField.type == TextFieldType.INPUT;
		}
		
		public function set editable(value:Boolean):void {
			_textField.type = value ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
		}
		
		/**最多可包含的字符数*/
		public function get maxChars():int {
			return _textField.maxChars;
		}
		
		public function set maxChars(value:int):void {
			_textField.maxChars = value;
		}
		
		public function setCalendar(s:Sprite):void{
			_calendar = new Calendar(s);
			_content = new TextInput("选择时间","png.comp.textinput");
			_content.x = x;
			_content.y = y;
			s.addChild(_content);
			visible = false;
			_calendar.addEventListener(CalendarEvent.DATE, onCalendarHandler);
			_content.addEventListener(MouseEvent.CLICK, onShowCalendarHandler);
		}
		
		protected function onShowCalendarHandler(e:MouseEvent):void
		{
			_calendar.show(x,y);
		}
		
		/*日历选择事件*/
		protected function onCalendarHandler(e:CalendarEvent):void
		{
			_content.text = e.date;
			text = e.millisecondsNumber+"";
			_calendar.hide();
		}
		
		/*public function get calendar():Calendar{
			return _calendar;
		}*/
	}
}