/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class EditUserUI extends Dialog {
		public var title:Label = null;
		public var accountTxt:TextInput = null;
		public var positionInformation:ComboBox = null;
		public var saveBtn:Button = null;
		public var nmeTxt:TextInput = null;
		public var password:TextInput = null;
		public var officeId:ComboBox = null;
		public var workNumber:TextInput = null;
		protected static var uiXML:XML =
			<Dialog width="271" height="190">
			  <Image skin="png.comp.bg" y="0" height="500" sizeGrid="50,50,10,10" x="0" width="300"/>
			  <Image x="0" y="0" width="300" height="21" name="drag" url="png.comp.blank"/>
			  <Button skin="png.comp.btn_close" x="266" y="4" name="close"/>
			  <Label text="新增账号" x="87" y="9" width="62" height="18" var="title"/>
			  <Label text="账号：" x="15" y="66" width="70" height="18" align="right"/>
			  <Label text="姓名：" x="15" y="102" width="68" height="18" align="right"/>
			  <TextInput skin="png.comp.textinput" x="92" y="63" var="accountTxt" editable="false"/>
			  <ComboBox labels="admin,info" skin="png.comp.combobox" x="92" y="173" height="23" var="positionInformation"/>
			  <Button label="保存" skin="png.comp.button" x="92" y="330" var="saveBtn"/>
			  <TextInput skin="png.comp.textinput" x="92" y="101" var="nmeTxt" editable="false"/>
			  <Label text="密码：" x="15" y="138" width="69" height="18" align="right"/>
			  <TextInput skin="png.comp.textinput" x="92" y="137" var="password"/>
			  <Label text="角色（职位）：" x="9" y="179" align="right"/>
			  <Label text="直属上级：" x="9" y="212" width="76" height="18" align="right"/>
			  <ComboBox labels="label1,label2" skin="png.comp.combobox" x="92" y="211" height="23" var="officeId"/>
			  <Label text="工号：" x="41" y="249" width="49" height="18"/>
			  <TextInput skin="png.comp.textinput" x="92" y="249" var="workNumber"/>
			</Dialog>;
		public function EditUserUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}