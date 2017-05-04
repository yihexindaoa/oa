/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class UserMangUI extends View {
		public var addBtn:Button = null;
		public var queryTxt:TextInput = null;
		public var table:List = null;
		public var queryBtn:Clip = null;
		protected static var uiXML:XML =
			<View width="800" height="900" buttonMode="true">
			  <Image skin="png.comp.bg" x="0" y="0" width="897" height="900" sizeGrid="50,50,10,10"/>
			  <Button label="新增" skin="png.comp.button" x="167" y="87" var="addBtn"/>
			  <TextInput skin="png.comp.textinput" x="265" y="86" width="175" height="22" toolTip="关键字搜索：姓名、部门、账号（手机号码" var="queryTxt"/>
			  <List x="170" y="165" spaceY="10" width="517" height="142" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="726" height="27" x="-120" y="0" left="-120">
			      <Label x="710" y="0" width="106" height="34" background="true" backgroundColor="0x6699cc" text=" "/>
			      <Button label="编辑" skin="png.comp.button" x="726" y="3" width="30" height="23" labelColors="0x0000ff" name="editBtn"/>
			      <Button label="删除" skin="png.comp.button" x="773" y="3" width="34" height="23" labelColors="0x0000ff" name="deleteBtn"/>
			      <Label text="01" x="-1" y="0" width="49" height="34" align="center" size="15" background="true" backgroundColor="0x6699cc" name="id"/>
			      <Label text="label" x="49" y="0" width="95" height="34" size="15" align="center" background="true" backgroundColor="0x6699cc" name="userName"/>
			      <Label text="label" x="145" y="0" height="34" align="center" size="15" width="103" background="true" backgroundColor="0x6699cc" name="officeName"/>
			      <Label text="label" x="354" y="0" height="34" align="center" size="15" width="82" background="true" backgroundColor="0x6699cc" name="roleNme"/>
			      <Label text="label" x="438" y="0" height="34" align="center" size="15" width="91" background="true" backgroundColor="0x6699cc" name="loginName"/>
			      <Label text="label" x="531" y="0" height="34" align="center" size="15" width="86" background="true" backgroundColor="0x6699cc" name="workNumber"/>
			      <Label text=" " x="621" y="0" height="34" align="center" size="15" width="86" background="true" backgroundColor="0x6699cc" name="roleNme"/>
			      <Label text="label" x="250" y="0" height="34" align="center" size="15" width="103" background="true" backgroundColor="0x6699cc" name="positionInformation"/>
			      <Button label="禁用" skin="png.comp.button" x="627" y="3" width="37" height="23" labelColors="0xff0000" name="disBtn"/>
			      <Button label="启用" skin="png.comp.button" x="669" y="3" width="35" height="23" labelColors="0x0000ff" name="adbleBtn"/>
			    </Box>
			  </List>
			  <Clip skin="png.comp.clip_timg" x="443" y="85" clipX="4" clipY="4" index="2" width="29" height="23" var="queryBtn"/>
			  <Label text="序号" x="48" y="134" width="50" height="30" background="true" backgroundColor="0x99cc" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="姓名" x="99" y="134" width="95" height="30" backgroundColor="0x99cc" background="true" size="18" bold="true" align="center"/>
			  <Label text="状态" x="671" y="134" width="86" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="工号" x="581" y="134" width="86" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="职位" x="300" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="账号" x="490" y="134" width="89" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="直属上级" x="405" y="134" width="83" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="部门" x="195" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="操作" x="761" y="134" height="30" width="106" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			</View>;
		public function UserMangUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}