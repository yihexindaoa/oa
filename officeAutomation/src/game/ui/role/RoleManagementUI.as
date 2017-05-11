/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class RoleManagementUI extends View {
		public var addBtn:Button = null;
		public var queryTxt:TextInput = null;
		public var table:List = null;
		public var queryBtn:Clip = null;
		protected static var uiXML:XML =
			<View width="800" height="900" buttonMode="true">
			  <Image skin="png.comp.bg" x="0" y="0" width="800" height="900" sizeGrid="50,50,10,10"/>
			  <Button label="添加角色" skin="png.comp.button" x="167" y="87" var="addBtn"/>
			  <TextInput skin="png.comp.textinput" x="265" y="86" width="175" height="22" toolTip="按角色名称进行搜索" var="queryTxt"/>
			  <List x="169" y="165" spaceY="10" width="517" height="142" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="513" height="27" x="1" y="0">
			      <Label x="318" y="0" width="197" height="34" background="true" backgroundColor="0x6699cc"/>
			      <Button label="编辑" skin="png.comp.button" x="348" y="3" width="30" height="23" labelColors="0x0000ff" name="editBtn"/>
			      <Button label="删除" skin="png.comp.button" x="395" y="3" width="34" height="23" labelColors="0x0000ff" name="deleteBtn"/>
			      <Button label="权限设置" skin="png.comp.button" x="436" y="3" width="56" height="23" labelColors="0x0000ff" name="setBtn"/>
			      <Label text="01" x="-1" y="0" width="111" height="34" align="center" size="15" background="true" backgroundColor="0x6699cc" name="id"/>
			      <Label text="label" x="112" y="0" width="99" height="34" size="15" align="center" background="true" backgroundColor="0x6699cc" name="roleNumber"/>
			      <Label text="label" x="214" y="0" height="34" align="center" size="15" width="102" background="true" backgroundColor="0x6699cc" name="rolename"/>
			    </Box>
			  </List>
			  <Clip skin="png.comp.clip_timg" x="443" y="85" clipX="4" clipY="4" index="2" width="29" height="23" var="queryBtn"/>
			  <Label text="角色ID" x="168" y="134" width="112" height="30" background="true" backgroundColor="0x99cc" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="角色编码" x="281" y="134" width="101" height="30" backgroundColor="0x99cc" background="true" size="18" bold="true" align="center"/>
			  <Label text="角色名称" x="383" y="134" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			  <Label text="操作" x="488" y="134" height="30" width="198" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18"/>
			</View>;
		public function RoleManagementUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}