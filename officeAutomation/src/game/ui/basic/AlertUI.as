/**Created by the Morn,do not modify.*/
package game.ui.basic {
	import morn.core.components.*;
	public class AlertUI extends Dialog {
		public var closeBtn:Button = null;
		public var confirmBtn:Button = null;
		public var msg:Label = null;
		protected static var uiXML:XML =
			<Dialog width="300" height="300">
			  <Image skin="png.comp.bg" x="2" y="2" sizeGrid="50,50,10,10" width="244" height="149"/>
			  <Image url="png.comp.blank" x="0" y="0" width="261" height="26" name="drag"/>
			  <Button skin="png.comp.btn_close" x="210" y="5" var="closeBtn"  name="close"/>
			  <Button label="确定" skin="png.comp.button" x="83" y="110" var="confirmBtn" name="close"/>
			  <Label text="后台返回错误代码:4001" x="39" y="50" width="185" height="50" color="0xff0000" bold="true" font="黑体" size="15" var="msg"  align="center"  multiline="true" wordWrap="true"/>
			</Dialog>;
		public function AlertUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}