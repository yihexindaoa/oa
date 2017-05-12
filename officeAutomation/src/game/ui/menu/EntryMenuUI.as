/**Created by the Morn,do not modify.*/
package game.ui.menu {
	import morn.core.components.*;
	public class EntryMenuUI extends View {
		public var entryBtn:Button = null;
		public var panelTable:Panel = null;
		public var table:List = null;
		public var queryBtn:Button = null;
		protected static var uiXML:XML =
			<View width="800" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" width="800" height="900" sizeGrid="50,50,10,10"/>
			  <Button label="录入菜单" skin="png.comp.button" x="151" y="67" var="entryBtn"/>
			  <Panel x="153" y="139" width="613" height="800" vScrollBarSkin="png.comp.vscroll" var="panelTable">
			    <List x="0" y="0" spaceY="10" width="454" height="142" repeatX="1" repeatY="4" var="table">
			      <Box name="render" width="513" height="27" x="1" y="0">
			        <Label x="423" y="0" width="135" height="34" background="true" backgroundColor="0xcccccc"/>
			        <Button label="编辑" skin="png.comp.button" x="453" y="3" width="30" height="23" labelColors="0x0000ff" name="edit"/>
			        <Button label="删除" skin="png.comp.button" x="500" y="3" width="34" height="23" labelColors="0x0000ff" name="delete"/>
			        <Label text="01" x="-1" y="0" width="111" height="34" align="center" size="15" background="true" backgroundColor="0xcccccc" name="id"/>
			        <Label x="112" y="0" width="99" height="34" size="15" align="center" background="true" backgroundColor="0xcccccc" text=" "/>
			        <Label text="label" x="215" y="0" height="34" align="center" size="15" width="102" background="true" backgroundColor="0xcccccc" name="menuOrder"/>
			        <Label text="label" x="320" y="0" height="34" align="center" size="15" width="102" background="true" backgroundColor="0xcccccc" name="menuAddress"/>
			        <Clip skin="png.comp.clip_tree_arrow" x="124" y="9" clipX="1" clipY="2" index="0" width="14" height="14" name="clip" visible="false"/>
			        <Label text="账号管理" x="140" y="6" name="meunName"/>
			        <Label text="label" x="562" y="5" visible="false" name="menuSeries"/>
			      </Box>
			    </List>
			  </Panel>
			  <Box name="render" left="386" x="282" y="647" width="271" height="190" visible="false">
			    <Image skin="png.comp.bg" y="8" width="238" height="185" sizeGrid="50,50,10,10" x="0"/>
			    <Label text="编辑菜单" x="87" y="9" width="62" height="18"/>
			    <Label text="菜单名称：" x="17" y="65" width="70" height="18"/>
			    <Label text="菜单等级：" x="17" y="99" width="68" height="18"/>
			    <TextInput skin="png.comp.textinput" x="92" y="63"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="92" y="95" width="126" height="23"/>
			    <Button label="取消" skin="png.comp.button" x="127" y="159"/>
			    <Button label="确定" skin="png.comp.button" x="36" y="159"/>
			    <Button skin="png.comp.btn_close" x="206" y="9"/>
			    <Label text="菜单排序：" x="18" y="130" width="65" height="18"/>
			    <TextInput skin="png.comp.textinput" x="92" y="129"/>
			  </Box>
			  <Label text=" " x="152" y="108" width="112" height="30" background="true" backgroundColor="0x666666" bold="true" size="18" selectable="true" align="center"/>
			  <Label text="菜单名称" x="265" y="108" width="101" height="30" backgroundColor="0x666666" background="true" size="18" bold="true" align="center"/>
			  <Label text="菜单顺序" x="367" y="108" width="104" height="30" background="true" backgroundColor="0x666666" bold="true" align="center" size="18"/>
			  <Label text="菜单地址" x="472" y="108" width="104" height="30" background="true" backgroundColor="0x666666" bold="true" align="center" size="18"/>
			  <Label text="操作" x="577" y="108" height="30" width="133" background="true" backgroundColor="0x666666" bold="true" align="center" size="18"/>
			  <Box name="render" left="386" x="421" y="517" width="185" height="120" visible="false">
			    <Image skin="png.comp.bg" x="0" y="0" width="185" height="119" sizeGrid="50,50,10,10"/>
			    <Button skin="png.comp.btn_close" x="151" y="3"/>
			    <Button label="取消" skin="png.comp.button" x="99" y="86"/>
			    <Button label="确定删除" skin="png.comp.button" x="16" y="87"/>
			    <Label text="将删除此条记录！" x="31" y="50" width="134" height="26" color="0xff0000" bold="true" size="15" font="黑体"/>
			  </Box>
			  <Button label="查询" skin="png.comp.button" x="243" y="67" var="queryBtn"/>
			</View>;
		public function EntryMenuUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}