/**Created by the Morn,do not modify.*/
package game.ui.salary {
	import morn.core.components.*;
	public class addSalaryUI extends View {
		public var table:List = null;
		public var SerialNumber:Label = null;
		protected static var uiXML:XML =
			<View width="972" height="342">
			  <Box name="render" width="867" height="15" x="-2" y="0">
			    <Label text="工资管理" x="32" y="26" width="69" height="20" size="15" color="0x0" align="center" bold="true" wordWrap="true"/>
			    <Label text="调薪记录" x="133" y="26" width="63" height="20" size="15"/>
			    <Label text="调薪记录" x="42" y="81" width="67" height="18" size="15"/>
			    <Label text="新增调薪" x="136" y="81" width="64" height="19" size="15"/>
			    <TextInput skin="png.comp.textinput" x="43" y="114" width="223" height="27"/>
			    <Button label="导出" skin="png.comp.button" x="313" y="115" width="59" height="24"/>
			    <Image skin="png.comp.blank" x="44" y="156" width="828" height="2"/>
			    <Image skin="png.comp.blank" x="45" y="207" width="828" height="2"/>
			    <Image skin="png.comp.blank" x="43" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="872" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="872" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="87" y="155" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="222" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="314" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="406" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="522" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="617" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="726" y="156" width="2" height="54"/>
			    <Image skin="png.comp.blank" x="143" y="156" width="2" height="54"/>
			    <Label text="序号" x="53" y="173" width="36" height="21"/>
			    <Label text="姓名" x="101" y="173" width="30" height="20"/>
			    <Label text="职位" x="171" y="173" width="27" height="18"/>
			    <Label text="在职时长" x="244" y="173" width="52" height="20"/>
			    <Label text="原基本工资" x="329" y="173" width="67" height="20"/>
			    <Label text="调薪后基本工资" x="417" y="173" width="97" height="16" size="13"/>
			    <Label text="调薪理由" x="542" y="173" width="57" height="16" size="13"/>
			    <Label text="调薪月份" x="643" y="173" width="66" height="17" size="13"/>
			    <Label text="操作" x="786" y="174" width="32" height="18"/>
			    <List x="37" y="135" spaceY="10" width="901" height="45" repeatY="10" var="table">
			      <Box name="render" width="867" height="15" x="0" y="0">
			        <Image skin="png.comp.blank" x="8" y="102" width="828" height="2"/>
			        <Image skin="png.comp.blank" x="277" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="835" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="689" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="580" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="485" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="369" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="185" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="6" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="106" y="74" width="2" height="30"/>
			        <Image skin="png.comp.blank" x="50" y="74" width="2" height="30"/>
			        <Label text="label" x="10" y="79" name="SerialNumber" var="SerialNumber"/>
			        <Label text="label" x="56" y="80" name="name"/>
			        <Label text="label" x="111" y="80" name="position"/>
			        <Label text="label" x="196" y="79" width="39" height="18" name="workingTime"/>
			        <Label text="label" x="289" y="76" width="71" height="18" name="originalBasicSalary"/>
			        <Label text="label" x="380" y="79" width="79" height="18"/>
			        <Label text="label" x="492" y="78" width="76" height="20" name="salaryIncreaseReason"/>
			        <Label text="label" x="588" y="79" width="35" height="18" name="salaryIncrease"/>
			        <Label text="id" x="842" y="79" width="43" height="18" name="id" visible="false"/>
			        <Label text="编辑" x="721" y="81" width="31" height="18" color="0xff"/>
			        <Label text="删除" x="769" y="81" color="0xff"/>
			      </Box>
			    </List>
			  </Box>
			</View>;
		public function addSalaryUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}