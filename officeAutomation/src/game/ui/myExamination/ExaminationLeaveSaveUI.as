/**Created by the Morn,do not modify.*/
package game.ui.myExamination {
	import morn.core.components.*;
	public class ExaminationLeaveSaveUI extends Dialog {
		public var qj:Box = null;
		public var type2:Image = null;
		public var submitName_qj:Label = null;
		public var officeName_qj:Label = null;
		public var contentExamination_qj:TextArea = null;
		public var eventStartTimeqj:TextInput = null;
		public var eventEndtimeqj:TextInput = null;
		public var approverqj:ComboBox = null;
		public var dateqj:TextInput = null;
		public var radioGroup2:RadioGroup = null;
		public var radio1:RadioButton = null;
		public var radio2:RadioButton = null;
		public var radio3:RadioButton = null;
		public var radio4:RadioButton = null;
		public var radio5:RadioButton = null;
		public var radio6:RadioButton = null;
		public var radio7:RadioButton = null;
		public var inductionTime:Label = null;
		public var jb:Box = null;
		public var submitName_jb:Label = null;
		public var officeName_bm:Label = null;
		public var contentExamination_jb:TextArea = null;
		public var eventStartTime:TextInput = null;
		public var eventEndtime:TextInput = null;
		public var approver:ComboBox = null;
		public var project_jb:TextInput = null;
		public var baoxiao:Box = null;
		public var submitName_bx:Label = null;
		public var officeName_bx:Label = null;
		public var contentExamination_bx:TextArea = null;
		public var expenseType_bx:TextInput = null;
		public var rsementAmount_bx:TextInput = null;
		public var approver_bx:ComboBox = null;
		public var project_bx:TextInput = null;
		public var jj:Box = null;
		public var submitName_jj:Label = null;
		public var officeName_jj:Label = null;
		public var contentExamination_jj:TextArea = null;
		public var eventStartTime_jj:TextInput = null;
		public var eventEndtime_jj:TextInput = null;
		public var approver_jj:ComboBox = null;
		public var project_jj:TextInput = null;
		public var applicationNumber:ComboBox = null;
		public var approvalSubmitBtn:Button = null;
		protected static var uiXML:XML =
			<Dialog width="883" height="673">
			  <Image skin="png.comp.bg" x="0" y="0" width="883" height="751" sizeGrid="50,50,10,10"/>
			  <Box name="qj" width="894" var="qj" height="607" x="0" y="50" left="0">
			    <Image skin="png.exam.qj_insert" x="2" y="0" var="type2" name="type" width="877" height="672"/>
			    <Label text="提交人：" x="121" y="165"/>
			    <Label x="183" y="165" var="submitName_qj" name="submitName_qj"/>
			    <Label text="部门：" x="359" y="165"/>
			    <Label x="408" y="165" name="officeName_qj" var="officeName_qj"/>
			    <Label text="入职日期：" x="564" y="165"/>
			    <TextArea skin="png.comp.textarea" x="177" y="262" width="566" height="128" var="contentExamination_qj" name="contentExamination_qj"/>
			    <Label text="--" x="325" y="423" width="22" height="19"/>
			    <TextInput skin="png.comp.textinput" x="182" y="420" var="eventStartTimeqj" name="eventStartTime"/>
			    <TextInput skin="png.comp.textinput" x="356" y="420" var="eventEndtimeqj" name="eventEndtime"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="179" y="462" var="approverqj" name="approverqj"/>
			    <TextInput skin="png.comp.textinput" x="565" y="421" var="dateqj" name="dateqj"/>
			    <RadioGroup x="196" y="221" var="radioGroup2" selectedIndex="1">
			      <RadioButton skin="png.comp.radio" var="radio1" name="item0" value="1"/>
			      <RadioButton skin="png.comp.radio" x="67" var="radio2" name="item1" value="2"/>
			      <RadioButton skin="png.comp.radio" x="135" y="1" var="radio3" name="item2" value="3"/>
			      <RadioButton skin="png.comp.radio" x="203" y="1" var="radio4" name="item3" value="4" selected="false"/>
			      <RadioButton skin="png.comp.radio" x="274" var="radio5" name="item4" value="5"/>
			      <RadioButton skin="png.comp.radio" x="358" var="radio6" name="item5" value="6"/>
			      <RadioButton skin="png.comp.radio" x="428" var="radio7" name="item6" labelSize="10" value="7"/>
			    </RadioGroup>
			    <Label x="637" y="166" name="inductionTime" var="inductionTime"/>
			  </Box>
			  <Box name="jb" width="883" var="jb" height="607" x="0" y="114" left="0">
			    <Image skin="png.exam.jb_insert" x="4" y="-64"/>
			    <Label text="提交人：" x="121" y="88"/>
			    <Label x="186" y="88" var="submitName_jb" name="submitName_jb"/>
			    <Label text="部门：" x="359" y="88"/>
			    <Label x="408" y="88" name="officeName_bm" var="officeName_bm"/>
			    <Label text="项目名称：" x="564" y="88"/>
			    <TextArea skin="png.comp.textarea" x="177" y="139" width="566" height="128" var="contentExamination_jb" name="contentExamination_jb"/>
			    <Label text="--" x="325" y="295" width="22" height="19"/>
			    <TextInput skin="png.comp.textinput" x="182" y="292" var="eventStartTime" name="eventStartTime"/>
			    <TextInput skin="png.comp.textinput" x="356" y="292" var="eventEndtime" name="eventEndtime"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="179" y="342" var="approver" name="approver"/>
			    <TextInput skin="png.comp.textinput" x="627" y="87" var="project_jb" name="project_jb"/>
			  </Box>
			  <Box name="baoxiao" width="883" var="baoxiao" height="607" x="3" y="51" left="0">
			    <Image skin="png.exam.bx_insert" x="0" y="0"/>
			    <Label text="提交人：" x="109" y="153"/>
			    <Label x="174" y="153" var="submitName_bx" name="submitName_bx"/>
			    <Label text="部门：" x="347" y="153"/>
			    <Label x="396" y="153" name="officeName_bx" var="officeName_bx"/>
			    <Label text="项目名称：" x="552" y="153"/>
			    <TextArea skin="png.comp.textarea" x="161" y="250" width="558" height="89" var="contentExamination_bx" name="contentExamination_bx"/>
			    <TextInput skin="png.comp.textinput" x="163" y="207" height="22" var="expenseType_bx" name="expenseType_bx"/>
			    <TextInput skin="png.comp.textinput" x="159" y="371" height="22" name="reimbursementAmount_bx" var="rsementAmount_bx"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="166" y="425" width="140" height="23" var="approver_bx" name="approver_bx"/>
			    <TextInput skin="png.comp.textinput" x="620" y="153" var="project_bx" name="project_bx"/>
			  </Box>
			  <Box name="jj" width="883" var="jj" height="607" x="1" y="48" left="0">
			    <Image skin="png.exam.xmjj_insert" x="2" y="2"/>
			    <Label text="提交人：" x="109" y="153"/>
			    <Label x="174" y="153" var="submitName_jj" name="submitName_jj"/>
			    <Label text="部门：" x="347" y="153"/>
			    <Label x="396" y="153" name="officeName_jj" var="officeName_jj"/>
			    <Label text="项目名称：" x="552" y="153"/>
			    <TextArea skin="png.comp.textarea" x="196" y="217" width="558" height="115" var="contentExamination_jj" name="contentExamination_jj"/>
			    <Label text="--" x="325" y="361" width="22" height="19"/>
			    <TextInput skin="png.comp.textinput" x="182" y="358" var="eventStartTime_jj" name="eventStartTime_jj"/>
			    <TextInput skin="png.comp.textinput" x="356" y="358" var="eventEndtime_jj" name="eventEndtime_jj"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="180" y="410" width="140" height="23" var="approver_jj" name="approver_jj"/>
			    <TextInput skin="png.comp.textinput" x="620" y="153" var="project_jj" name="project_jj"/>
			  </Box>
			  <ComboBox labels="请假,报销,加班,项目奖金" skin="png.comp.combobox" x="141" y="74" selectedIndex="0" selectedLabel="请假" var="applicationNumber" name="applicationNumber"/>
			  <Button skin="png.comp.btn_close" x="848" y="2" name="close"/>
			  <Image skin="png.comp.blank" x="3" y="2" width="842" height="23" name="drag"/>
			  <Button label="提交" skin="png.comp.button" x="632" y="704" width="75" height="23" var="approvalSubmitBtn"/>
			</Dialog>;
		public function ExaminationLeaveSaveUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}