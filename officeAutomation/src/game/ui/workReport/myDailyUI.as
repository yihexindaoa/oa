/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class myDailyUI extends View {
		public var submit:Button = null;
		public var addBtn:Image = null;
		public var noticeContent:TextArea = null;
		public var circleOne:Image = null;
		public var circleTwo:Image = null;
		public var yesterday:Image = null;
		public var noticeContentTwo:TextArea = null;
		public var userName:Label = null;
		protected static var uiXML:XML =
			<View width="806" height="877">
			  <Image skin="png.comp.bg" x="0" y="0" width="1000" sizeGrid="50,50,10,10" height="900"/>
			  <Label text="我的工作日报" x="36" y="12" width="90" height="23" size="14" bold="false"/>
			  <Label text="我的工作周/月报" x="160" y="12" width="115" height="21" size="14"/>
			  <Image skin="png.comp.blank_blue" x="33" y="32" width="93" height="3"/>
			  <Label text="日期" x="28" y="68"/>
			  <TextInput text="关键词搜索" skin="png.comp.textinput" x="168" y="66" width="259" height="25" multiline="false"/>
			  <Image skin="png.comp.search_button" x="402" y="69" width="18" height="17"/>
			  <Button label="提交" skin="png.comp.button" x="280" y="447" width="69" height="30" var="submit"/>
			  <Label text="发送" x="24" y="351" width="32" height="19" size="15"/>
			  <Image skin="png.comp.add_button" x="72" y="347" var="addBtn"/>
			  <TextArea text="TextArea" skin="png.comp.textarea" x="18" y="137" width="597" height="199" var="noticeContent"/>
			  <Label text="2017年03月" x="91" y="530" width="80" height="19" size="14"/>
			  <Image skin="png.comp.blank" x="54" y="552" width="1" height="45"/>
			  <Image skin="png.comp.circle" x="44" y="529" width="23" height="23" var="circleOne"/>
			  <Image skin="png.comp.circle" x="46" y="780" width="23" height="23" var="circleTwo"/>
			  <Image skin="png.comp.today" x="41" y="598" name="today"/>
			  <Image skin="png.comp.yesterday" x="39" y="678" var="yesterday"/>
			  <Image skin="png.comp.blank" x="55" y="629" width="1" height="47"/>
			  <Image skin="png.comp.blank" x="55" y="708" width="1" height="69"/>
			  <TextArea skin="png.comp.textarea" x="89" y="569" width="589" height="104" var="noticeContentTwo"/>
			  <TextArea skin="png.comp.textarea" x="87" y="697" width="592" height="103"/>
			  <Label text="小雷" x="101" y="576" size="14" var="userName"/>
			  <Label text="今天工作完成：" x="100" y="603" size="13" width="132" height="20"/>
			  <Label text="未完成工作：" x="116" y="626" size="11"/>
			  <Label text="存在工作问题：" x="102" y="646"/>
			  <Label text="小雷" x="100" y="706" size="14"/>
			  <Label text="今天工作完成：" x="99" y="733" size="13" width="132" height="20"/>
			  <Label text="未完成工作：" x="115" y="756" size="11"/>
			  <Label text="存在工作问题：" x="101" y="776"/>
			</View>;
		public function myDailyUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}