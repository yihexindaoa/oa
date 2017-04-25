/**Created by the Morn,do not modify.*/
package game.ui.login {
	import morn.core.components.*;
	public class LoginUI extends View {
		public var account:TextInput = null;
		public var password:TextInput = null;
		public var loginBtn:Button = null;
		protected static var uiXML:XML =
			<View width="600" height="400">
			  <Label text="义合信达OA系统" x="188" y="110" align="center" bold="true" color="0xcc6633" font="Arial" size="30" alpha="0.7" stroke="0x66ffff"/>
			  <Label text="登录名：" x="197" y="169" width="55" height="23" alpha="0.7" color="0x66ffff"/>
			  <Label text="密码：" x="197" y="200" width="34" height="18" alpha="0.7" color="0x66ffff"/>
			  <TextInput x="269" y="168" toolTip="输入账号" skin="png.comp.textinput" restrict="0-9A-Za-z" var="account" maxChars="20" alpha="0.7"/>
			  <TextInput skin="png.comp.textinput" x="269" y="200" restrict="0-9A-Z" asPassword="true" toolTip="输入密码" var="password" maxChars="20" alpha="0.7"/>
			  <Button label="登陆" skin="png.comp.button" x="202" y="235" width="197" height="23" var="loginBtn" labelStroke="0x66ffff" letterSpacing="10" alpha="0.7"/>
			</View>;
		public function LoginUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}