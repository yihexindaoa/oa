/**Created by the Morn,do not modify.*/
package game.ui.notice {
	import morn.core.components.*;
	public class NoticeListUI extends View {
		public var addBtn:Button = null;
		public var editBtn:Button = null;
		public var deteBtn:Button = null;
		public var table:List = null;
		public var queryBtn:Clip = null;
		public var dateTxt:TextInput = null;
		public var dateBtn:Clip = null;
		public var queryTxt:TextInput = null;
		protected static var uiXML:XML =
			<View width="1000" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" width="1000" sizeGrid="50,50,10,10" height="900"/>
			  <Button label="新增" skin="png.comp.button" x="63" y="54" var="addBtn"/>
			  <Button label="编辑" skin="png.comp.button" x="148" y="54" var="editBtn"/>
			  <Button label="删除" skin="png.comp.button" y="54" x="235" var="deteBtn"/>
			  <List x="240" y="165" spaceY="10" width="517" height="142" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="726" height="27" x="-120" y="0" left="-120">
			      <Label x="621" y="0" width="228" height="34" background="true" backgroundColor="0x6699cc" text=" "/>
			      <Button label="审核通过" skin="png.comp.button" x="630" y="3" width="81" height="23" labelColors="0x0000ff" name="auditBtn"/>
			      <Button label="审核不通过" skin="png.comp.button" x="715" y="3" width="79" height="23" labelColors="0x0000ff" name="noBtn"/>
			      <Label text="01" x="-1" y="0" width="49" height="34" align="center" size="15" background="true" backgroundColor="0x6699cc" name="id"/>
			      <Label text=" " x="49" y="0" width="95" height="34" size="15" align="center" background="true" backgroundColor="0x6699cc" name="roleCode"/>
			      <Label text="label" x="145" y="0" height="34" align="center" size="15" width="103" background="true" backgroundColor="0x6699cc" name="title"/>
			      <Label text="label" x="354" y="0" height="34" align="center" size="15" width="82" background="true" backgroundColor="0x6699cc" name="releasePeopleName"/>
			      <Label text=" " x="438" y="0" height="34" align="center" size="15" width="91" background="true" backgroundColor="0x6699cc" name="roleNme"/>
			      <Label x="532" y="0" height="34" align="center" size="15" width="86" background="true" backgroundColor="0x6699cc" name="approverName" text=" "/>
			      <Label text="label" x="250" y="0" height="34" align="center" size="15" width="103" background="true" backgroundColor="0x6699cc" name="releaseTime"/>
			      <ComboBox labels="审核通过,审核不通过" x="447" y="4" width="74" height="23" selectedIndex="0" name="state"/>
			      <Button label="详情" skin="png.comp.button" x="799" y="3" width="43" height="23" name="detailsBtn"/>
			      <Label text=" " x="-38" y="0" backgroundColor="0x6699cc" background="true" height="34" width="36"/>
			      <CheckBox skin="png.comp.checkbox" x="-27" y="6" name="check"/>
			      <ComboBox labels="公司通知,奖励通知,惩罚通知" x="51" y="4" selectedIndex="0" width="85" height="20" name="signType"/>
			    </Box>
			  </List>
			  <Clip skin="png.comp.clip_timg" x="663" y="54" clipX="4" clipY="4" index="2" width="22" height="19" var="queryBtn"/>
			  <Label text="序号" x="118" y="134" width="50" height="30" background="true" backgroundColor="0x99cc" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="通知类型" x="169" y="134" width="95" height="30" backgroundColor="0x99cc" background="true" size="18" bold="true" align="center"/>
			  <Label text="审批人" x="651" y="134" width="86" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="时间" x="370" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="状态" x="560" y="134" width="89" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="发布人" x="475" y="134" width="83" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="标题" x="265" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="操作" x="741" y="134" height="30" width="228" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="日期:" x="340" y="54"/>
			  <TextInput skin="png.comp.textinput" x="378" y="54" text="2017/4/7" var="dateTxt"/>
			  <Clip skin="png.comp.clip_timg" x="480" y="55" clipX="4" clipY="4" width="21" height="19" index="1" var="dateBtn"/>
			  <TextInput skin="png.comp.textinput" x="512" y="53" width="145" height="22" toolTip="关键字搜索：发布内容、通知类型" var="queryTxt"/>
			  <Label text=" " x="82" y="134" width="35" height="30" backgroundColor="0x99cc" background="true" align="center"/>
			  <CheckBox skin="png.comp.checkbox" x="93" y="141" name="check"/>
			</View>;
		public function NoticeListUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}