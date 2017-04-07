/**Created by the Morn,do not modify.*/
package game.ui.date {
	import morn.core.components.*;
	public class CalendarUI extends Dialog {
		public var dateTxt:Label = null;
		public var prevBtn:Clip = null;
		public var nextBtn:Clip = null;
		protected static var uiXML:XML =
			<Dialog width="200" height="200" sceneColor="0xffffff" layers="2,1,1,0,第 2 层;1,1,1,0,第 1 层" compId="11">
			  <Label styleSkin="png.comp.label" x="53" y="4" layer="1" width="100" height="22" var="dateTxt" compId="1"  align="center"/>
			  <Clip skin="png.comp.clip_tree_arrow" x="44" y="6" layer="1" clipX="1" clipY="2" index="0" width="18" height="19" scaleX="-1" var="prevBtn" compId="2"/>
			  <Clip skin="png.comp.clip_tree_arrow" x="157" y="6" layer="1" width="18" height="19" clipX="1" clipY="2" index="0" var="nextBtn" compId="3"/>
			  <Label text="日" styleSkin="png.comp.label" x="10" y="30" layer="1" compId="4"/>
			  <Label text="一" styleSkin="png.comp.label" x="36" y="30" layer="1" compId="5"/>
			  <Label text="二" styleSkin="png.comp.label" x="62" y="30" layer="1" compId="6"/>
			  <Label text="三" styleSkin="png.comp.label" x="88" y="30" layer="1" width="19" height="18" compId="7"/>
			  <Label text="四" styleSkin="png.comp.label" x="114" y="30" layer="1" compId="8"/>
			  <Label text="五" styleSkin="png.comp.label" x="140" y="30" layer="1" compId="9"/>
			  <Label text="六" styleSkin="png.comp.label" x="166" y="30" layer="1" compId="10"/>
			</Dialog>;
		public function CalendarUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}