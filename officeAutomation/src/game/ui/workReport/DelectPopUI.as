/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class DelectPopUI extends Dialog {
		public var submit:Button = null;
		protected static var uiXML:XML =
			<Dialog width="253" height="201">
			  <Image skin="png.comp.bg" x="0" y="0" width="253" height="201" sizeGrid="50,50,10,10"/>
			  <Button skin="png.comp.btn_close" x="211" y="5" width="25" height="22" name="close"/>
			  <Label text="确定要删除该条信息吗？" x="47" y="46" size="14"/>
			  <Image skin="png.comp.blank_blue" x="1" y="163" width="247" height="1"/>
			  <Button label="关闭" skin="png.comp.button" x="185" y="170" name="close" width="56" height="21"/>
			  <Button label="确定" skin="png.comp.button" x="125" y="170" var="submit" width="55" height="21"/>
			  <Label text="删除" x="10" y="3" color="0xffffff" size="12"/>
			  <Image skin="png.comp.blank" x="21" y="9" width="208" height="10" name="drag"/>
			</Dialog>;
		public function DelectPopUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}