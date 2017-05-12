/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class ReportDetailsUI extends Dialog {
		public var userName:Label = null;
		public var dateTime:Label = null;
		public var content:TextArea = null;
		protected static var uiXML:XML =
			<Dialog width="600" height="400">
			  <Image skin="png.comp.bg" x="-2" y="-3" width="604" height="405" sizeGrid="50,50,10,10"/>
			  <Label text="时间：" x="387" y="40" width="43" height="19" size="14"/>
			  <Label text="姓名：" x="23" y="42" width="45" height="19" size="14"/>
			  <Label text="内容：" x="24" y="108" width="547" height="22" size="14"/>
			  <Image skin="png.comp.blank" x="15" y="3" width="566" height="16" name="drag"/>
			  <Label text="详情" x="8" y="2" width="57" height="19" color="0xffffff" size="14"/>
			  <Button skin="png.comp.btn_close" x="553" y="3" width="34" height="25" name="close"/>
			  <Label text="label" x="66" y="42" width="244" height="21" size="14" var="userName"/>
			  <Label text="label" x="435" y="40" width="157" height="22" size="14" var="dateTime"/>
			  <TextArea text="TextArea" skin="png.comp.textarea" x="24" y="133" width="554" height="259" var="content" size="14" editable="false"/>
			</Dialog>;
		public function ReportDetailsUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}