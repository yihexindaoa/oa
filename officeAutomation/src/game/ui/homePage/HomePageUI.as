/**Created by the Morn,do not modify.*/
package game.ui.homePage {
	import morn.core.components.*;
	public class HomePageUI extends View {
		protected static var uiXML:XML =
			<View width="900" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" width="900" height="900" sizeGrid="50,50,10,10"/>
			  <Label text="首页" x="25" y="3" width="72" height="21" color="0x6666" size="15"/>
			</View>;
		public function HomePageUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}