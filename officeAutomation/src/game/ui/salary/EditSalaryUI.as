/**Created by the Morn,do not modify.*/
package game.ui.salary {
	import morn.core.components.*;
	public class EditSalaryUI extends Dialog {
		public var item:Box = null;
		public var name:TextInput = null;
		public var position:TextInput = null;
		public var salaryIncrease:TextInput = null;
		public var salaryIncreaseReason:TextInput = null;
		public var salaryBasicWage:TextInput = null;
		public var originalBasicSalary:TextInput = null;
		public var workingTime:TextInput = null;
		public var saveBtn:Button = null;
		public var title:Label = null;
		protected static var uiXML:XML =
			<Dialog width="600" height="400">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="50,50,10,10" width="348" height="399"/>
			  <Button skin="png.comp.btn_close" x="318" y="2" name="close"/>
			  <Image skin="png.comp.blank" x="3" y="2" width="312" height="20" name="drag"/>
			  <Box x="0" y="0" name="item" visible="true" var="item" width="350" height="406">
			    <Label text="姓名：" x="83" y="42" width="44" height="19" size="14"/>
			    <TextInput skin="png.comp.textinput" x="134" y="38" var="name" width="143" height="26"/>
			    <TextInput skin="png.comp.textinput" x="134" y="78" var="position" width="142" height="26"/>
			    <Label text="岗位：" x="84" y="83" width="39" height="20" size="14"/>
			    <Label text="在职时长：" x="55" y="122" width="71" height="20" size="14"/>
			    <Label text="原基本工资：" x="41" y="166" width="85" height="20" size="14"/>
			    <Label text="调薪后基本工资：" x="12" y="208" width="115" height="19" size="14"/>
			    <Label text="调薪理由：" x="53" y="248" width="66" height="20" size="14"/>
			    <Label text="调薪年月：" x="56" y="293" width="68" height="21" size="14"/>
			    <TextInput skin="png.comp.textinput" x="134" y="286" width="143" height="26" var="salaryIncrease"/>
			    <TextInput skin="png.comp.textinput" x="134" y="244" width="143" height="26" var="salaryIncreaseReason"/>
			    <TextInput skin="png.comp.textinput" x="134" y="203" width="143" height="26" var="salaryBasicWage"/>
			    <TextInput skin="png.comp.textinput" x="134" y="161" width="143" height="26" var="originalBasicSalary"/>
			    <TextInput skin="png.comp.textinput" x="133" y="119" width="143" height="26" var="workingTime"/>
			    <Button label="保存" skin="png.comp.button" x="135" y="343" width="59" height="27" var="saveBtn"/>
			  </Box>
			  <Label text="编辑调薪记录" x="15" y="5" width="82" height="18" var="title" color="0x99cc"/>
			</Dialog>;
		public function EditSalaryUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}