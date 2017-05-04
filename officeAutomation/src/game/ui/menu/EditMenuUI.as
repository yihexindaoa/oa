/**Created by the Morn,do not modify.*/
package game.ui.menu {
	import morn.core.components.*;
	public class EditMenuUI extends Dialog {
		public var box:Box = null;
		public var title:Label = null;
		public var meunName:TextInput = null;
		public var menuSeries:ComboBox = null;
		public var confirmBtn:Button = null;
		public var menuOrderLab:Label = null;
		public var menuOrder:TextInput = null;
		public var menuAddressLab:Label = null;
		public var menuAddress:TextInput = null;
		public var id:Label = null;
		public var parentMenu:ComboBox = null;
		public var parentMenuLab:Label = null;
		protected static var uiXML:XML =
			<Dialog width="238" height="211">
			  <Image skin="png.comp.blank" x="4" y="0" width="199" height="25" name="drag"/>
			  <Box name="render" left="0" x="0" y="0" width="242" height="194" var="box">
			    <Image skin="png.comp.bg" y="0" width="238" height="245" sizeGrid="50,50,10,10" x="0"/>
			    <Label text="录入菜单" x="87" y="1" width="62" height="18" var="title"/>
			    <Label text="菜单名称：" x="17" y="57" width="70" height="18"/>
			    <Label text="菜单等级：" x="17" y="91" width="68" height="18"/>
			    <TextInput skin="png.comp.textinput" x="92" y="55" var="meunName" name="meunName"/>
			    <ComboBox labels="1,2" skin="png.comp.combobox" x="92" y="87" width="126" height="23" name="menuSeries" var="menuSeries"/>
			    <Button label="取消" skin="png.comp.button" x="127" y="211" name="close"/>
			    <Button label="确定" skin="png.comp.button" x="36" y="211" var="confirmBtn"/>
			    <Button skin="png.comp.btn_close" x="206" y="1" name="close"/>
			    <Label text="菜单排序：" x="18" y="120" width="65" height="18" var="menuOrderLab"/>
			    <TextInput skin="png.comp.textinput" x="92" y="119" name="menuOrder" var="menuOrder" restrict="0-9"/>
			    <Label text="菜单地址：" x="18" y="151" width="65" height="18" var="menuAddressLab"/>
			    <TextInput skin="png.comp.textinput" x="92" y="150" name="menuAddress" var="menuAddress"/>
			    <Label text="菜单id" x="93" y="32" visible="false" var="id"/>
			    <ComboBox labels="label1,label2" skin="png.comp.combobox" x="92" y="118" width="126" height="23" name="parentMenu" var="parentMenu" selectedLabel="a,b" visible="false"/>
			    <Label text="父菜单：" x="17" y="120" width="68" height="18" var="parentMenuLab" visible="false"/>
			  </Box>
			</Dialog>;
		public function EditMenuUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}