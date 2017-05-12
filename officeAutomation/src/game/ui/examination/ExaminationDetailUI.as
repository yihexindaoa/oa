/**Created by the Morn,do not modify.*/
package game.ui.examination {
	import morn.core.components.*;
	public class ExaminationDetailUI extends Dialog {
		public var qj:Box = null;
		public var type2:Image = null;
		public var submitName_qj:Label = null;
		public var officeName_qj:Label = null;
		public var contentExamination_qj:TextArea = null;
		public var inductionTime:Label = null;
		public var dateqj:Label = null;
		public var leaveType:Label = null;
		public var leaveDays:Label = null;
		public var approverNameqj:Label = null;
		public var jb:Box = null;
		public var submitName_jb:Label = null;
		public var officeName_bm:Label = null;
		public var contentExamination_jb:TextArea = null;
		public var datejb:Label = null;
		public var approver_jb:Label = null;
		public var project_jb:Label = null;
		public var baoxiao:Box = null;
		public var submitName_bx:Label = null;
		public var officeName_bx:Label = null;
		public var contentExamination_bx:TextArea = null;
		public var project_bx:Label = null;
		public var expenseType_bx:Label = null;
		public var rsementAmount_bx:Label = null;
		public var approver_bx:Label = null;
		public var jj:Box = null;
		public var submitName_jj:Label = null;
		public var officeName_jj:Label = null;
		public var contentExamination_jj:TextArea = null;
		public var project_jj:Label = null;
		public var datejj:Label = null;
		public var approver_jj:Label = null;
		public var applicationText:Label = null;
		public var table:List = null;
		protected static var uiXML:XML =
			<Dialog width="883" height="673">
			  <Image skin="png.comp.bg" x="0" y="0" width="883" height="751" sizeGrid="50,50,10,10"/>
			  <Box name="qj" width="894" var="qj" height="607" x="0" y="50" left="0">
			    <Image skin="png.exam.qj_detail" x="2" y="0" var="type2" name="type" width="877" height="675"/>
			    <Label text="提交人：" x="121" y="165"/>
			    <Label x="183" y="165" var="submitName_qj" name="submitName_qj"/>
			    <Label text="部门：" x="359" y="165"/>
			    <Label x="408" y="165" name="officeName_qj" var="officeName_qj"/>
			    <Label text="入职日期：" x="564" y="165"/>
			    <TextArea skin="png.comp.textarea" x="177" y="262" width="566" height="128" var="contentExamination_qj" name="contentExamination_qj" editable="false"/>
			    <Label x="637" y="166" name="inductionTime" var="inductionTime"/>
			    <Label text="请假时间：" x="111" y="223"/>
			    <Label x="187" y="223" var="dateqj"/>
			    <Label text="请假类型：" x="118" y="423"/>
			    <Label x="194" y="423" var="leaveType"/>
			    <Label text="请假天数：" x="304" y="423"/>
			    <Label x="378" y="423" var="leaveDays"/>
			    <Label x="182" y="469" var="approverNameqj"/>
			  </Box>
			  <Box name="jb" width="883" var="jb" height="607" x="0" y="114" left="0">
			    <Image skin="png.exam.jb_insert" x="4" y="-64"/>
			    <Label text="提交人：" x="121" y="88"/>
			    <Label x="186" y="88" var="submitName_jb" name="submitName_jb"/>
			    <Label text="部门：" x="359" y="88"/>
			    <Label x="408" y="88" name="officeName_bm" var="officeName_bm"/>
			    <Label text="项目名称：" x="564" y="88"/>
			    <TextArea skin="png.comp.textarea" x="177" y="139" width="566" height="128" var="contentExamination_jb" name="contentExamination_jb" editable="false"/>
			    <Label x="204" y="295" var="datejb"/>
			    <Label x="186" y="343" var="approver_jb"/>
			    <Label x="634" y="87" var="project_jb"/>
			  </Box>
			  <Box name="baoxiao" width="883" var="baoxiao" height="607" x="3" y="51" left="0">
			    <Image skin="png.exam.bx_insert" x="0" y="0"/>
			    <Label text="提交人：" x="109" y="153"/>
			    <Label x="174" y="153" var="submitName_bx" name="submitName_bx"/>
			    <Label text="部门：" x="347" y="153"/>
			    <Label x="396" y="153" name="officeName_bx" var="officeName_bx"/>
			    <Label text="项目名称：" x="552" y="153"/>
			    <TextArea skin="png.comp.textarea" x="161" y="250" width="558" height="89" var="contentExamination_bx" name="contentExamination_bx" editable="false"/>
			    <Label x="617" y="153" var="project_bx"/>
			    <Label x="177" y="204" var="expenseType_bx" name="expenseType_bx"/>
			    <Label x="168" y="368" var="rsementAmount_bx"/>
			    <Label x="168" y="421" var="approver_bx"/>
			  </Box>
			  <Box name="jj" width="883" var="jj" height="607" x="1" y="48" left="0">
			    <Image skin="png.exam.xmjj_insert" x="2" y="2"/>
			    <Label text="提交人：" x="109" y="153"/>
			    <Label x="174" y="153" var="submitName_jj" name="submitName_jj"/>
			    <Label text="部门：" x="347" y="153"/>
			    <Label x="396" y="153" name="officeName_jj" var="officeName_jj"/>
			    <Label text="项目名称：" x="552" y="153"/>
			    <TextArea skin="png.comp.textarea" x="196" y="217" width="558" height="115" var="contentExamination_jj" name="contentExamination_jj" editable="false"/>
			    <Label x="623" y="153" var="project_jj"/>
			    <Label x="199" y="359" var="datejj"/>
			    <Label x="190" y="412" var="approver_jj"/>
			  </Box>
			  <Label x="152" y="76" height="19" var="applicationText" name="applicationText" text="请假"/>
			  <Button skin="png.comp.btn_close" x="848" y="2" name="close"/>
			  <Image skin="png.comp.blank" x="3" y="2" width="842" height="23" name="drag"/>
			  <List x="36" y="569" spaceY="10" width="320" height="150" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="930" height="30" x="-1" y="1" left="0">
			      <Label x="69" y="17" name="mapKey" visible="false"/>
			      <Button label="附件" skin="png.comp.button" x="103" y="12" name="mapValue" width="200"/>
			    </Box>
			  </List>
			</Dialog>;
		public function ExaminationDetailUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}