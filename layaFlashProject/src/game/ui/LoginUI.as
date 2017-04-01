/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class LoginUI extends View {
		protected static var uiXML:XML =
			<View width="600" height="400" toolTip="输入密码">
			  <Label text="OA系统" x="250" y="110" align="center" bold="true" color="0xcc6633" font="Arial" size="30"/>
			  <Label text="登录名" x="197" y="169" width="55" height="23"/>
			  <Label text="密码" x="197" y="200" width="34" height="18"/>
			  <TextInput x="269" y="168" toolTip="&quot;输入密码&quot;"/>
			  <TextInput text="TextInput" skin="png.comp.textinput" x="269" y="200"/>
			</View>;
		public function LoginUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}