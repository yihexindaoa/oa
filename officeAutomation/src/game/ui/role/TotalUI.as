/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	import game.ui.role.NavigationMenuUI;
	public class TotalUI extends View {
		protected static var uiXML:XML =
			<View width="1000" height="1200">
			  <NavigationMenu x="0" y="-1" runtime="game.ui.test.NavigationMenuUI"/>
			</View>;
		public function TotalUI(){}
		override protected function createChildren():void {
			viewClassMap["game.ui.test.NavigationMenuUI"] = NavigationMenuUI;
			super.createChildren();
			createView(uiXML);
		}
	}
}