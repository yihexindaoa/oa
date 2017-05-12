/**Created by the Morn,do not modify.*/
package game.ui.examination {
	import morn.core.components.*;
	public class ExaminationUI extends View {
		public var applicationNumber:ComboBox = null;
		public var search:Clip = null;
		public var exportExaminationInfo:Button = null;
		public var table:List = null;
		public var submitTime:Label = null;
		public var examinationTime:Label = null;
		public var keyword:TextInput = null;
		protected static var uiXML:XML =
			<View width="1000" height="900" x="0" y="0">
			  <Image skin="png.comp.bg" x="0" y="3" width="1000" height="900" name="ExaminationQurey" sizeGrid="50,50,10,10"/>
			  <ComboBox labels=" ---- ,请假,报销,加班,项目奖金" skin="png.comp.combobox" x="136" y="64" name="applicationNumber" var="applicationNumber"/>
			  <Label text="审批类型：" x="63" y="65"/>
			  <Clip skin="png.comp.clip_timg" x="464" y="64" clipX="4" clipY="4" index="2" width="22" height="19" name="search" var="search"/>
			  <Button label="导出" skin="png.comp.button" x="590" y="62" name="exportExaminationInfo" var="exportExaminationInfo"/>
			  <List x="49" y="167" spaceY="10" width="926" height="29" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="930" height="30" x="-1" y="1" left="0">
			      <Label text="" x="7" y="15" width="31" height="19" name="index"/>
			      <Label x="165" y="15" name="submitName" width="39" height="18"/>
			      <Label x="428" y="15" name="reviewStatusName"/>
			      <Label x="515" y="15" name="submitTime" var="submitTime"/>
			      <Label x="612" y="15" name="examinationTime" var="examinationTime"/>
			      <Button label="审核通过" skin="png.comp.button" x="708" y="15" name="auditBtn"/>
			      <Button label="审核不通过" skin="png.comp.button" x="787" y="15" name="noBtn"/>
			      <Button label="删除" skin="png.comp.button" x="866" y="15" name="del"/>
			      <Label x="254" y="15" name="officeName" width="71" height="18"/>
			      <Label x="348" y="15" name="approverName"/>
			      <Label x="33" y="20" name="id" visible="false"/>
			      <CheckBox skin="png.comp.checkbox" x="-18" y="13" name="check"/>
			      <Button skin="png.comp.button" x="59" y="12" name="applicationText"/>
			    </Box>
			  </List>
			  <Label text="序号" x="48" y="134" width="50" height="30" background="true" backgroundColor="0x99cc" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="审批类型" x="96" y="134" width="95" height="30" backgroundColor="0x99cc" background="true" size="18" bold="true" align="center"/>
			  <Label text="提交时间" x="562" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="部门" x="288" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="审核状态" x="473" y="134" width="89" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="审批人" x="390" y="134" width="83" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="提交人" x="190" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="审核时间" x="650" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="操作" x="750" y="134" height="30" width="240" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <TextInput skin="png.comp.textinput" x="311" y="64" var="keyword" name="keyword"/>
			  <Label text="关键字：" x="255" y="64"/>
			</View>;
		public function ExaminationUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}