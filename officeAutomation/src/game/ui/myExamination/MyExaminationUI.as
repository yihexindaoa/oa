/**Created by the Morn,do not modify.*/
package game.ui.myExamination {
	import morn.core.components.*;
	public class MyExaminationUI extends View {
		public var applicationNumber:ComboBox = null;
		public var search:Clip = null;
		public var outputExcelMyApply:Button = null;
		public var table:List = null;
		public var submitTime:Label = null;
		public var examinationTime:Label = null;
		public var submit:Button = null;
		protected static var uiXML:XML =
			<View width="1000" height="900" x="0" y="0">
			  <Image skin="png.comp.bg" x="0" y="3" width="1000" height="900" name="ExaminationQurey" sizeGrid="50,50,10,10"/>
			  <ComboBox labels="---- ,请假,报销,加班,项目奖金" skin="png.comp.combobox" x="136" y="64" name="applicationNumber" var="applicationNumber"/>
			  <Label text="审批类型：" x="63" y="65"/>
			  <Clip skin="png.comp.clip_timg" x="279" y="64" clipX="4" clipY="4" index="2" width="22" height="19" name="search" var="search"/>
			  <Button label="导出" skin="png.comp.button" x="356" y="62" name="outputExcelMyApply" var="outputExcelMyApply"/>
			  <List x="49" y="167" spaceY="10" width="926" height="29" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="930" height="30" x="-1" y="1" left="0">
			      <Label text="" x="7" y="15" width="31" height="19" name="index"/>
			      <Label x="310" y="15" name="reviewStatusName"/>
			      <Label x="437" y="15" name="submitTime" var="submitTime"/>
			      <Label x="589" y="15" name="examinationTime" var="examinationTime"/>
			      <Button label="详情" skin="png.comp.button" x="742" y="15" name="detailBtn"/>
			      <Button label="删除" skin="png.comp.button" x="836" y="15" name="del"/>
			      <Label x="193" y="15" name="approverName"/>
			      <Label x="75" y="20" name="applicationText"/>
			      <Label x="33" y="20" name="id" visible="false"/>
			    </Box>
			  </List>
			  <Label text="序号" x="48" y="134" width="50" height="30" background="true" backgroundColor="0x99cc" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="审批类型" x="98" y="134" width="130" height="30" backgroundColor="0x99cc" background="true" size="18" bold="true" align="center"/>
			  <Label text="提交时间" x="450" y="134" width="150" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="审核状态" x="347" y="134" width="103" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="审批人" x="228" y="134" width="120" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="审批时间" x="600" y="134" width="150" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="操作" x="750" y="134" height="30" width="240" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Button label="提交申请" skin="png.comp.button" x="898" y="66" var="submit" name="submit"/>
			</View>;
		public function MyExaminationUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}