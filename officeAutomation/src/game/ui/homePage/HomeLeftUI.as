/**Created by the Morn,do not modify.*/
package game.ui.homePage {
	import morn.core.components.*;
	public class HomeLeftUI extends Dialog {
		public var title:Label = null;
		protected static var uiXML:XML =
			<Dialog width="217" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="30,30,10,10" width="241" height="900"/>
			  <Button skin="png.comp.btn_close" x="210" y="2" name="close"/>
			  <Image x="0" y="0" width="211" height="20" name="drag" url="png.comp.blank"/>
			  <Label text="义合信达" x="7" y="-1" width="200" height="36" var="title" wordWrap="true" multiline="true"/>
			</Dialog>;
		public function HomeLeftUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}