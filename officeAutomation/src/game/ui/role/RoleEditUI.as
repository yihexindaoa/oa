/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class RoleEditUI extends Dialog {
		public var title:Label = null;
		public var rolename:TextInput = null;
		public var roleNumber:ComboBox = null;
		public var confirmBtn:Button = null;
		public var id:Label = null;
		protected static var uiXML:XML =
			<Dialog width="271" height="190">
			  <Box name="render" left="0" x="0" y="0" width="271" height="190" visible="true">
			    <Image skin="png.comp.bg" y="8" width="238" height="158" sizeGrid="50,50,10,10"/>
			    <Label text="添加角色" x="87" y="9" width="62" height="18" var="title"/>
			    <Label text="角色名称：" x="17" y="65" width="70" height="18"/>
			    <Label text="角色编码：" x="17" y="101" width="68" height="18"/>
			    <TextInput skin="png.comp.textinput" x="92" y="63" var="rolename"/>
			    <ComboBox labels="admin,info,developmentAngineer,productManager,personnel,administrative" skin="png.comp.combobox" x="92" y="95" width="126" height="23" var="roleNumber"/>
			    <Button label="确定" skin="png.comp.button" x="21" y="131" var="confirmBtn"/>
			    <Button skin="png.comp.button" x="149" y="131" name="close" label="取消"/>
			    <Button skin="png.comp.btn_close" x="206" y="9" name="close"/>
			  </Box>
			  <Image skin="png.comp.blank" x="3" y="9" width="204" height="22" name="drag"/>
			  <Label text="id" x="138" y="42" var="id" visible="false"/>
			</Dialog>;
		public function RoleEditUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}