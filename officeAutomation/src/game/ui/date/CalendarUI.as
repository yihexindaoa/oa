/**Created by the Morn,do not modify.*/
package game.ui.date {
	import morn.core.components.*;
	public class CalendarUI extends Dialog {
		public var dateTxt:Label = null;
		public var prevBtn:Clip = null;
		public var nextBtn:Clip = null;
		protected static var uiXML:XML =
			<Dialog width="200" height="200">
			  <Image skin="png.comp.bg" y="0" width="200" height="200" sizeGrid="50,50,10,10" alpha="0.7"/>
			  <Label text="  " x="10" y="21" height="22" background="true" backgroundColor="0x99cc99" width="175"/>
			  <Label x="53" y="4" width="100" height="22" var="dateTxt" align="center"/>
			  <Clip skin="png.comp.clip_tree_arrow" x="44" y="6" clipX="1" clipY="2" index="0" width="18" height="19" scaleX="-1" var="prevBtn"/>
			  <Clip skin="png.comp.clip_tree_arrow" x="157" y="6" width="18" height="19" clipX="1" clipY="2" index="0" var="nextBtn"/>
			  <Label text="日" x="12" y="25" background="false" backgroundColor="0xcccc" width="16" height="19"/>
			  <Label text="一" x="36" y="25" background="false"/>
			  <Label text="二" x="62" y="25"/>
			  <Label text="三" x="88" y="25" width="19" height="18"/>
			  <Label text="四" x="114" y="25"/>
			  <Label text="五" x="140" y="25"/>
			  <Label text="六" x="166" y="25"/>
			</Dialog>;
		public function CalendarUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}