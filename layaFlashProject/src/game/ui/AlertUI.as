/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class AlertUI extends Dialog {
		protected static var uiXML:XML =
			<Dialog width="100" height="100">
			  <HScrollBar skin="png.comp.hscroll" x="16" y="51" width="67" height="17"/>
			</Dialog>;
		public function AlertUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}