/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class MyWeeklyAndMonthlyUI extends View {
		protected static var uiXML:XML =
			<View width="991" height="859">
			  <Label text="我的工作日报" x="44" y="32" size="14"/>
			  <Label text="我的工作周/月报" x="172" y="32" size="14"/>
			  <Image skin="png.comp.blank_blue" x="171" y="51" width="112" height="3"/>
			  <Label text="日期" x="55" y="75" size="14"/>
			  <ComboBox labels="2017，2016" skin="png.comp.combobox" x="43" y="100" width="70" height="23"/>
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
			  <Image skin="png.comp.time_label" x="84" y="178"/>
			  <Label text="第1周" x="95" y="180" size="12"/>
			  <Image skin="png.comp.time_label" x="82" y="217"/>
			  <Label text="第2周" x="93" y="219" size="12"/>
			  <Image skin="png.comp.time_label" x="83" y="256"/>
			  <Label text="第3周" x="94" y="258" size="12"/>
			  <Image skin="png.comp.time_label" x="83" y="293"/>
			  <Label text="第4周" x="94" y="295" size="12"/>
			  <Label text="2月" x="23" y="336" size="13"/>
			  <TextInput text="TextInput" skin="png.comp.textinput" x="164" y="72" width="260" height="27"/>
			  <Image skin="png.comp.search_button" x="395" y="76"/>
			  <Image skin="png.comp.file_img" x="164" y="120"/>
			  <Label text="第一周的工作报告[01-01~01-05]" x="200" y="128" size="14"/>
			  <TextArea text="TextArea" skin="png.comp.textarea" x="181" y="163" width="481" height="184"/>
			  <Image skin="png.comp.add_button" x="231" y="358"/>
			  <Label text="发送" x="184" y="365" size="14"/>
			  <Button label="提交" skin="png.comp.button" x="444" y="453" width="69" height="30"/>
			  <Image skin="png.comp.circle" x="189" y="492"/>
			  <Image skin="png.comp.circle" x="187" y="652"/>
			  <Image skin="png.comp.blank" x="199" y="514" width="1" height="48"/>
			  <Image skin="png.comp.blank" x="198" y="603" width="1" height="48"/>
			  <Image skin="png.comp.first_week" x="177" y="563"/>
			  <Label text="2017年03月" x="230" y="506" size="14"/>
			  <TextArea text="TextArea" skin="png.comp.textarea" x="230" y="545" width="589" height="110"/>
			</View>;
		public function MyWeeklyAndMonthlyUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}