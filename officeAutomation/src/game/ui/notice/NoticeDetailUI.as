/**Created by the Morn,do not modify.*/
package game.ui.notice {
	import morn.core.components.*;
	public class NoticeDetailUI extends Dialog {
		public var signType:ComboBox = null;
		public var title:TextInput = null;
		public var content:TextArea = null;
		public var operTxt:Label = null;
		protected static var uiXML:XML =
			<Dialog width="600" height="600">
			  <Image skin="png.comp.bg" x="0" y="0" width="600" height="600" sizeGrid="50,50,10,10"/>
			  <Button skin="png.comp.btn_close" x="565" y="4" name="close"/>
			  <Image skin="png.comp.blank" x="4" y="3" width="561" height="19" name="drag"/>
			  <Label text="通知告示类型：" x="25" y="48" width="107" height="21" size="15" align="right" font="黑体"/>
			  <ComboBox labels="公司通知,惩罚通知,奖励通知" skin="png.comp.combobox" x="142" y="46" width="121" height="23" selectedIndex="0" var="signType" name="signType" mouseEnabled="false"/>
			  <Label text="标题：" x="25" width="107" height="21" y="82" align="right"/>
			  <TextInput skin="png.comp.textinput" x="142" y="82" width="145" height="22" var="title" name="title" editable="false" mouseChildren="false" mouseEnabled="false"/>
			  <TextArea text="&lt;font  face=&quot;微软雅黑&quot; size=&quot;30&quot;>黑体&lt;/font>&lt;font   size=&quot;30&quot;>大幅度&lt;/font>" skin="png.comp.textarea" x="142" y="123" width="439" height="277" isHtml="true" align="left" var="content" name="content" editable="false" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="内容：" x="25" y="199" width="107" height="21" align="right"/>
			  <Label text="详情" x="14" y="4" width="48" height="18" var="operTxt"/>
			</Dialog>;
		public function NoticeDetailUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}