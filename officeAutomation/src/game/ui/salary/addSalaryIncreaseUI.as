/**Created by the Morn,do not modify.*/
package game.ui.salary {
	import morn.core.components.*;
	public class addSalaryIncreaseUI extends View {
		public var item:Box = null;
		public var name:TextInput = null;
		public var position:TextInput = null;
		public var salaryIncrease:TextInput = null;
		public var salaryIncreaseReason:TextInput = null;
		public var salaryBasicWage:TextInput = null;
		public var originalBasicSalary:TextInput = null;
		public var workingTime:TextInput = null;
		protected static var uiXML:XML =
			<View width="849" height="437">
			  <Box x="-25" y="18" name="item" visible="true" var="item" width="842" height="330">
			    <Image skin="png.comp.bg" x="-92" y="-221" sizeGrid="50,50,10,10" width="1059" height="900"/>
			    <Label text="姓名：" x="10" y="-111" width="44" height="19" size="14"/>
			    <TextInput skin="png.comp.textinput" x="61" y="-115" var="name" width="143" height="26"/>
			    <TextInput skin="png.comp.textinput" x="61" y="-75" var="position" width="142" height="26"/>
			    <Label text="岗位：" x="11" y="-70" width="39" height="20" size="14"/>
			    <Label text="在职时长：" x="-18" y="-31" width="71" height="20" size="14"/>
			    <Label text="原基本工资：" x="-32" y="13" width="85" height="20" size="14"/>
			    <Label text="调薪后基本工资：" x="-61" y="55" width="115" height="19" size="14"/>
			    <Label text="调薪理由：" x="-20" y="95" width="66" height="20" size="14"/>
			    <Label text="调薪年月：" x="-17" y="140" width="68" height="21" size="14"/>
			    <TextInput skin="png.comp.textinput" x="61" y="133" width="143" height="26" var="salaryIncrease"/>
			    <TextInput skin="png.comp.textinput" x="61" y="91" width="143" height="26" var="salaryIncreaseReason"/>
			    <TextInput skin="png.comp.textinput" x="61" y="50" width="143" height="26" var="salaryBasicWage"/>
			    <TextInput skin="png.comp.textinput" x="61" y="8" width="143" height="26" var="originalBasicSalary"/>
			    <TextInput skin="png.comp.textinput" x="60" y="-34" width="143" height="26" var="workingTime"/>
			    <Button label="保存" skin="png.comp.button" x="62" y="190" width="59" height="27"/>
			  </Box>
			</View>;
		public function addSalaryIncreaseUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}