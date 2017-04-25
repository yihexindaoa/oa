/**Created by the Morn,do not modify.*/
package game.ui.basic {
	import morn.core.components.*;
	public class FlipUI extends View {
		public var bgTxt:Label = null;
		public var msgTxt:Label = null;
		public var box:Box = null;
		public var firBtn:Button = null;
		public var lastBtn:Button = null;
		public var pageTxt:TextInput = null;
		public var nextBtn:Button = null;
		public var endBtn:Button = null;
		protected static var uiXML:XML =
			<View width="500" height="35">
			  <Label text=" " x="4" y="3" width="491" height="28" backgroundColor="0x99cc" background="true" alpha="0.5" var="bgTxt"/>
			  <Label text="总共0条记录，每页50条，共0页" x="6" y="8" width="234" height="18" var="msgTxt"/>
			  <Box name="render" width="192" height="27" x="307" y="0" left="307" var="box">
			    <Button label="|&lt;" skin="png.comp.button" x="0" y="6" width="30" height="23" var="firBtn" toolTip="首页"/>
			    <Button label="&lt;" skin="png.comp.button" x="32" y="6" width="30" height="23" var="lastBtn" toolTip="上一页"/>
			    <TextInput text="0" skin="png.comp.textinput" x="64" y="6" width="34" height="22" align="center" toolTip="每页显示多少条" restrict="0-9" var="pageTxt"/>
			    <Button label=">" skin="png.comp.button" x="101" y="6" width="30" height="23" var="nextBtn" toolTip="下一页"/>
			    <Button label=">|" skin="png.comp.button" x="134" y="6" width="30" height="23" var="endBtn" toolTip="最后一页"/>
			  </Box>
			</View>;
		public function FlipUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}