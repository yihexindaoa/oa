/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class RoleManagementUI extends View {
		public var tableItem:Box = null;
		protected static var uiXML:XML =
			<View width="800" height="900">
			  <Button label="添加角色" skin="png.comp.button" x="35" y="57"/>
			  <TextInput skin="png.comp.textinput" x="133" y="56" width="175" height="22" toolTip="按角色名次进行搜索"/>
			  <List x="37" y="129" spaceY="10" width="517" height="142" repeatX="1" repeatY="4">
			    <Box name="render" width="513" height="27" var="tableItem" x="1" y="0">
			      <Label x="318" y="0" width="197" height="34" background="true" backgroundColor="0xcccccc"/>
			      <Button label="编辑" skin="png.comp.button" x="348" y="3" width="30" height="23" labelColors="0x0000ff"/>
			      <Button label="删除" skin="png.comp.button" x="395" y="3" width="34" height="23" labelColors="0x0000ff"/>
			      <Button label="权限设置" skin="png.comp.button" x="436" y="3" width="56" height="23" labelColors="0x0000ff"/>
			      <Label text="01" x="-1" y="0" width="111" height="34" align="center" size="15" background="true" backgroundColor="0xcccccc"/>
			      <Label text="label" x="112" y="0" width="99" height="34" size="15" align="center" background="true" backgroundColor="0xcccccc"/>
			      <Label text="label" x="214" y="0" height="34" align="center" size="15" width="102" background="true" backgroundColor="0xcccccc"/>
			    </Box>
			  </List>
			  <Clip skin="png.comp.clip_timg" x="311" y="55" clipX="4" clipY="4" index="2" width="29" height="23"/>
			  <Box name="render" left="386" x="254" y="301" width="271" height="190">
			    <Image skin="png.comp.bg" y="8" width="238" height="158" sizeGrid="50,50,10,10"/>
			    <Label text="添加角色" x="87" y="9" width="62" height="18"/>
			    <Label text="角色名称：" x="17" y="65" width="70" height="18"/>
			    <Label text="角色编码：" x="17" y="101" width="68" height="18"/>
			    <TextInput skin="png.comp.textinput" x="92" y="63"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="92" y="95" width="126" height="23"/>
			    <Button label="取消" skin="png.comp.button" x="21" y="131"/>
			    <Button label="确定" skin="png.comp.button" x="149" y="131"/>
			    <Button skin="png.comp.btn_close" x="206" y="9"/>
			  </Box>
			  <Label text="角色ID" x="36" y="98" width="112" height="30" background="true" backgroundColor="0x666666" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="角色编码" x="149" y="98" width="101" height="30" backgroundColor="0x666666" background="true" size="18" bold="true" align="center"/>
			  <Label text="角色名称" x="251" y="98" width="104" height="30" background="true" backgroundColor="0x666666" bold="true" align="center" size="18"/>
			  <Label text="操作" x="356" y="98" height="30" width="198" background="true" backgroundColor="0x666666" bold="true" align="center" size="18"/>
			</View>;
		public function RoleManagementUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}