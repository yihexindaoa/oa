/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class EntryMenuUI extends View {
		public var tableItem:Box = null;
		protected static var uiXML:XML =
			<View width="800" height="900" sceneColor="0xffffff" layers="1,1,0,0,第 1 层" compId="37" selectedBox="37">
			  <Image skin="png.comp.bg" x="0" y="0" layer="1" width="800" height="900" sizeGrid="50,50,10,10" compId="38"/>
			  <Button label="录入菜单" skin="png.comp.button" x="35" y="57" layer="1" layers="1,1,0,0,第 1 层" compId="1"/>
			  <List layers="1,1,0" layer="1" x="37" y="129" spaceY="10" width="454" height="142" repeatX="1" repeatY="4" compId="2">
				<Box layers="2,1,1,0,第 2 层;1,1,1,0,第 1 层" layer="1" name="render" width="513" height="27" var="tableItem" x="1" y="0" compId="47">
				  <Label styleSkin="png.comp.label" x="318" y="0" layer="1" width="135" height="34" background="true" backgroundColor="0xcccccc" compId="39"/>
				  <Button label="编辑" skin="png.comp.button" x="348" y="3" layer="1" width="30" height="23" labelColors="0x0000ff" compId="40"/>
				  <Button label="删除" skin="png.comp.button" x="395" y="3" layer="1" width="34" height="23" labelColors="0x0000ff" compId="41"/>
				  <Label text="01" styleSkin="png.comp.label" x="-1" y="0" layer="1" width="111" height="34" align="center" size="15" background="true" backgroundColor="0xcccccc" compId="42"/>
				  <Label styleSkin="png.comp.label" x="112" y="0" layer="1" width="99" height="34" size="15" align="center" background="true" backgroundColor="0xcccccc" compId="43" text=" "/>
				  <Label text="label" styleSkin="png.comp.label" x="214" y="0" layer="1" height="34" align="center" size="15" width="102" background="true" backgroundColor="0xcccccc" compId="44"/>
				  <Clip skin="png.comp.clip_tree_arrow" x="124" y="9" layer="1" clipX="1" clipY="2" index="0" compId="45"/>
				  <Label text="账号管理" styleSkin="png.comp.label" x="140" y="6" layer="1" compId="46"/>
				</Box>
			  </List>
			  <Box layers="2,1,1,0,第 2 层;1,1,1,0,第 1 层" layer="1" name="render" left="386" x="386" y="297" width="242" height="194" compId="14">
				<Image skin="png.comp.bg" y="0" layer="1" width="238" height="185" sizeGrid="50,50,10,10" x="0" compId="3"/>
				<Label text="录入菜单" styleSkin="png.comp.label" x="87" y="1" layer="1" width="62" height="18" compId="4"/>
				<Label text="菜单名称：" styleSkin="png.comp.label" x="17" y="57" layer="1" width="70" height="18" compId="5"/>
				<Label text="菜单等级：" styleSkin="png.comp.label" x="17" y="91" layer="1" width="68" height="18" compId="6"/>
				<TextInput skin="png.comp.textinput" x="92" y="55" layer="1" compId="7"/>
				<ComboBox labels="label1,label2" skin="png.comp.combobox" x="92" y="87" layer="1" width="126" height="23" compId="8"/>
				<Button label="取消" skin="png.comp.button" x="127" y="151" layer="1" compId="9"/>
				<Button label="确定" skin="png.comp.button" x="36" y="151" layer="1" compId="10"/>
				<Button skin="png.comp.btn_close" x="206" y="1" layer="1" compId="11"/>
				<Label text="菜单排序：" styleSkin="png.comp.label" x="18" y="122" layer="1" width="65" height="18" compId="12"/>
				<TextInput skin="png.comp.textinput" x="92" y="121" layer="1" compId="13"/>
			  </Box>
			  <Box layers="2,1,1,0,第 2 层;1,1,1,0,第 1 层" layer="1" name="render" left="386" x="282" y="647" width="271" height="190" compId="26">
				<Image skin="png.comp.bg" y="8" layer="1" width="238" height="185" sizeGrid="50,50,10,10" x="0" compId="15"/>
				<Label text="编辑菜单" styleSkin="png.comp.label" x="87" y="9" layer="1" width="62" height="18" compId="16"/>
				<Label text="菜单名称：" styleSkin="png.comp.label" x="17" y="65" layer="1" width="70" height="18" compId="17"/>
				<Label text="菜单等级：" styleSkin="png.comp.label" x="17" y="99" layer="1" width="68" height="18" compId="18"/>
				<TextInput skin="png.comp.textinput" x="92" y="63" layer="1" compId="19"/>
				<ComboBox labels="label1,label2" skin="png.comp.combobox" x="92" y="95" layer="1" width="126" height="23" compId="20"/>
				<Button label="取消" skin="png.comp.button" x="127" y="159" layer="1" compId="21"/>
				<Button label="确定" skin="png.comp.button" x="36" y="159" layer="1" compId="22"/>
				<Button skin="png.comp.btn_close" x="206" y="9" layer="1" compId="23"/>
				<Label text="菜单排序：" styleSkin="png.comp.label" x="18" y="130" layer="1" width="65" height="18" compId="24"/>
				<TextInput skin="png.comp.textinput" x="92" y="129" layer="1" compId="25"/>
			  </Box>
			  <Label text=" " styleSkin="png.comp.label" x="36" y="98" layer="1" width="112" height="30" background="true" backgroundColor="0x666666" bold="true" size="18" selectable="true" align="center" compId="27"/>
			  <Label text="菜单名称" styleSkin="png.comp.label" x="149" y="98" layer="1" width="101" height="30" backgroundColor="0x666666" background="true" size="18" bold="true" align="center" compId="28"/>
			  <Label text="菜单顺序" styleSkin="png.comp.label" x="251" y="98" layer="1" width="104" height="30" background="true" backgroundColor="0x666666" bold="true" align="center" size="18" compId="29"/>
			  <Label text="操作" styleSkin="png.comp.label" x="356" y="98" layer="1" height="30" width="133" background="true" backgroundColor="0x666666" bold="true" align="center" size="18" compId="30"/>
			  <Box layers="2,1,1,0,第 2 层;1,1,1,0,第 1 层" layer="1" name="render" left="386" x="421" y="517" width="185" height="120" compId="36">
				<Image skin="png.comp.bg" x="0" y="0" layer="1" width="185" height="119" sizeGrid="50,50,10,10" compId="31"/>
				<Button skin="png.comp.btn_close" x="151" y="3" layer="1" compId="32"/>
				<Button label="取消" skin="png.comp.button" x="99" y="86" layer="1" compId="33"/>
				<Button label="确定删除" skin="png.comp.button" x="16" y="87" layer="1" compId="34"/>
				<Label text="将删除此条记录！" styleSkin="png.comp.label" x="31" y="50" layer="1" width="134" height="26" color="0xff0000" bold="true" size="15" font="黑体" compId="35"/>
			  </Box>
			</View>;
		public function EntryMenuUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}