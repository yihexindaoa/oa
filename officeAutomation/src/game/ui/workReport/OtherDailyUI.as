/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class OtherDailyUI extends View {
		public var table:List = null;
		protected static var uiXML:XML =
			<View width="991" height="859">
			  <Image skin="png.comp.bg" x="-1" y="-2" width="993" height="862" sizeGrid="50,50,10,10"/>
			  <Label text="他人工作日报" x="44" y="32" size="14"/>
			  <Label text="他人工作周报" x="172" y="32" size="14"/>
			  <Image skin="png.comp.blank_blue" x="40" y="51" width="90" height="3"/>
			  <Label text="日期" x="55" y="75" size="14"/>
			  <ComboBox labels="2017,2016" skin="png.comp.combobox" x="43" y="100" width="70" height="23" selectedIndex="0"/>
			  <Label text="1月" x="30" y="143" size="13"/>
			  <Image skin="png.comp.dark_spot" x="63" y="144"/>
			  <Image skin="png.comp.dot" x="64" y="182"/>
			  <Image skin="png.comp.dot" x="64" y="221"/>
			  <Image skin="png.comp.dot" x="64" y="260"/>
			  <Image skin="png.comp.dot" x="64" y="298"/>
			  <Image skin="png.comp.dot" x="65" y="335"/>
			  <Image skin="png.comp.blank" x="69" y="159" width="1" height="22"/>
			  <Image skin="png.comp.blank" x="70" y="198" width="1" height="22"/>
			  <Image skin="png.comp.blank" x="70" y="236" width="1" height="22"/>
			  <Image skin="png.comp.blank" x="70" y="275" width="1" height="22"/>
			  <Image skin="png.comp.blank" x="70" y="312" width="1" height="22"/>
			  <Image skin="png.comp.time_label" x="82" y="178"/>
			  <Label text="第1周" x="95" y="180" size="12"/>
			  <Image skin="png.comp.time_label" x="82" y="217"/>
			  <Label text="第2周" x="93" y="219" size="12"/>
			  <Image skin="png.comp.time_label" x="83" y="256"/>
			  <Label text="第3周" x="94" y="258" size="12"/>
			  <Image skin="png.comp.time_label" x="83" y="293"/>
			  <Label text="第4周" x="94" y="295" size="12"/>
			  <Label text="2月" x="23" y="336" size="13"/>
			  <TextInput skin="png.comp.textinput" x="388" y="72" width="260" height="27" visible="false" toolTip="周/月报内容文字搜索"/>
			  <Image skin="png.comp.search_button" x="622" y="76" visible="false"/>
			  <Image skin="png.comp.circle" x="189" y="170"/>
			  <Image skin="png.comp.circle" x="187" y="330"/>
			  <Image skin="png.comp.blank" x="199" y="192" width="1" height="48"/>
			  <Image skin="png.comp.blank" x="198" y="281" width="1" height="48"/>
			  <Image skin="png.comp.first_week" x="177" y="241" width="44" height="42"/>
			  <Label text="2017年03月" x="230" y="172" size="14"/>
			  <List x="233" y="224" spaceY="10" width="587" height="308" repeatY="10" var="table">
			    <Box width="588" height="139" x="2" y="-6" name="render">
			      <TextInput skin="png.comp.textinput" x="-1" y="2" width="591" height="137" editable="false"/>
			      <Label text="姓名：" x="10" y="8"/>
			      <Label text="label" x="53" y="8" width="127" height="21" name="userName"/>
			      <Label text="时间：" x="337" y="4"/>
			      <Label text="label" x="375" y="5" width="179" height="22" name="sendTime"  isDate="true"/>
			      <TextArea text="TextArea" skin="png.comp.textarea" x="-1" y="36" width="591" height="103" name="noticeContent" editable="false"/>
			    </Box>
			  </List>
			  <Label text="他人工作月报" x="316" y="31" width="115" height="21" size="14"/>
			  <Image skin="png.comp.blank" x="151" y="66" width="1" height="771"/>
			  <Label text="今天" x="185" y="252" color="0xffffff"/>
			  <Label text="报表类型：" x="173" y="76" size="14"/>
			  <ComboBox labels="日报,周报,月报" skin="png.comp.combobox" x="244" y="75" width="70" height="23" selectedIndex="0"/>
			</View>;
		public function OtherDailyUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}