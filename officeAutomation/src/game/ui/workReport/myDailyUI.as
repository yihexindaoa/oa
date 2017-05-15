/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class myDailyUI extends View {
		public var queryTxt:TextInput = null;
		public var search:Image = null;
		public var submit:Button = null;
		public var addBtn:Image = null;
		public var noticeContent:TextArea = null;
		public var circleOne:Image = null;
		public var circleTwo:Image = null;
		public var yesterday:Image = null;
		public var table:List = null;
		public var dateEndTxt:TextInput = null;
		public var dateBeginTxt:TextInput = null;
		protected static var uiXML:XML =
			<View width="806" height="877">
			  <Image skin="png.comp.bg" x="-1" y="-10" width="1000" sizeGrid="50,50,10,10" height="900"/>
			  <Label text="我的工作日报" x="36" y="12" width="90" height="23" size="14" bold="false"/>
			  <Label text="我的工作周报" x="160" y="12" width="115" height="21" size="14"/>
			  <Image skin="png.comp.blank_blue" x="33" y="32" width="93" height="3"/>
			  <Label text="日期：" x="28" y="68" visible="false"/>
			  <TextInput text="日报内容搜索" skin="png.comp.textinput" x="410" y="64" width="259" height="25" multiline="false" var="queryTxt" visible="false"/>
			  <Image skin="png.comp.search_button" x="640" y="68" width="18" height="17" var="search" visible="false"/>
			  <Button label="提交" skin="png.comp.button" x="280" y="407" width="69" height="30" var="submit"/>
			  <Label text="发送" x="28" y="351" width="32" height="19" size="15"/>
			  <Image skin="png.comp.add_button" x="72" y="347" var="addBtn"/>
			  <TextArea skin="png.comp.textarea" x="29" y="109" width="643" height="199" var="noticeContent" toolTip="请输入内容"/>
			  <Label text="2017年03月" x="91" y="530" width="80" height="19" size="14"/>
			  <Image skin="png.comp.blank" x="54" y="552" width="1" height="58"/>
			  <Image skin="png.comp.circle" x="44" y="529" width="23" height="23" var="circleOne"/>
			  <Image skin="png.comp.circle" x="46" y="851" width="23" height="23" var="circleTwo"/>
			  <Image skin="png.comp.today" x="41" y="608" name="today"/>
			  <Image skin="png.comp.yesterday" x="39" y="751" var="yesterday"/>
			  <Image skin="png.comp.blank" x="55" y="638" width="1" height="113"/>
			  <Image skin="png.comp.blank" x="55" y="782" width="1" height="69"/>
			  <List x="86" y="561" spaceY="10" width="587" height="308" repeatY="10" var="table">
			    <Box width="588" height="139" x="2" y="-6" name="render">
			      <TextInput skin="png.comp.textinput" x="-1" y="2" width="591" height="137" editable="false"/>
			      <Label text="姓名：" x="10" y="8"/>
			      <Label text="label" x="53" y="8" width="127" height="21" name="userName"/>
			      <Label text="时间：" x="337" y="4"/>
			      <Label text="label" x="375" y="5" width="179" height="22" name="sendTime"/>
			      <TextArea text="TextArea" skin="png.comp.textarea" x="-1" y="36" width="591" height="103" name="noticeContent" editable="false"/>
			    </Box>
			  </List>
			  <Label text="至" x="204" y="67" size="14" visible="false"/>
			  <TextInput text="2017/4/29" skin="png.comp.textinput" x="228" y="66" width="139" height="23" var="dateEndTxt" visible="false"/>
			  <Label text="我的工作日报" x="29" y="67" size="14"/>
			  <Label text="我的工作月报" x="278" y="12" width="115" height="21" size="14"/>
			  <TextInput text="2017/4/29" skin="png.comp.textinput" x="66" y="67" var="dateBeginTxt" visible="false"/>
			</View>;
		public function myDailyUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}