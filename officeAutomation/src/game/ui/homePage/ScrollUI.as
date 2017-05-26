/**Created by the Morn,do not modify.*/
package game.ui.homePage {
	import morn.core.components.*;
	public class ScrollUI extends View {
		public var vscrollbar:VScrollBar = null;
		protected static var uiXML:XML =
			<View width="17" height="400">
			  <VScrollBar skin="png.comp.vscroll" x="0" y="0" height="400" var="vscrollbar"/>
			</View>;
		public function ScrollUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}