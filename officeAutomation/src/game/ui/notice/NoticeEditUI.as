/**Created by the Morn,do not modify.*/
package game.ui.notice {
	import morn.core.components.*;
	public class NoticeEditUI extends Dialog {
		public var signType:ComboBox = null;
		public var title:TextInput = null;
		public var content:TextArea = null;
		public var bBtn:Button = null;
		public var fontBtn:ComboBox = null;
		public var sizeBtn:ComboBox = null;
		public var iBtn:TextInput = null;
		public var uBtn:Label = null;
		public var upLoadBtn:Button = null;
		public var progress:ProgressBar = null;
		public var sendBtn:Button = null;
		public var operTxt:Label = null;
		protected static var uiXML:XML =
			<Dialog width="600" height="600">
			  <Image skin="png.comp.bg" x="0" y="0" width="600" height="600" sizeGrid="50,50,10,10"/>
			  <Button skin="png.comp.btn_close" x="565" y="4" name="close"/>
			  <Image skin="png.comp.blank" x="4" y="3" width="561" height="19" name="drag"/>
			  <Label text="通知告示类型：" x="25" y="48" width="107" height="21" size="15" align="right" font="黑体"/>
			  <ComboBox labels="公司通知,奖励通知,惩罚通知" skin="png.comp.combobox" x="142" y="46" width="121" height="23" selectedIndex="0" var="signType" name="signType"/>
			  <Label text="标题：" x="25" width="107" height="21" y="82" align="right"/>
			  <TextInput skin="png.comp.textinput" x="142" y="82" width="145" height="22" var="title" name="title"/>
			  <TextArea text="&lt;font  face=&quot;微软雅黑&quot; size=&quot;30&quot;>黑体&lt;/font>&lt;font   size=&quot;30&quot;>大幅度&lt;/font>" skin="png.comp.textarea" x="142" y="148" width="447" height="195" isHtml="true" align="left" var="content" name="content"/>
			  <Label text="内容：" x="25" y="224" width="107" height="21" align="right"/>
			  <Button label="B" skin="png.comp.button" x="278" y="122" width="26" height="23" labelBold="true" toolTip="变粗" var="bBtn"/>
			  <ComboBox labels="arial,宋体,黑体" skin="png.comp.combobox" x="143" y="122" width="75" height="23" selectedIndex="0" var="fontBtn"/>
			  <ComboBox labels="10,11,12,14,16,20,36" skin="png.comp.combobox" x="223" y="122" width="52" height="23" toolTip="尺寸" selectedIndex="0" var="sizeBtn"/>
			  <Button skin="png.comp.button" x="310" y="122" width="26" height="23" labelBold="true"/>
			  <TextInput text="&lt;i>I&lt;/i>" x="310" y="122" width="22" height="22" isHtml="true" align="center" bold="true" size="15" editable="false" mouseChildren="false" mouseEnabled="false" var="iBtn"/>
			  <Button skin="png.comp.button" x="344" y="122" width="26" height="23"/>
			  <Label text="&lt;u>U&lt;/u>" x="346" y="124" mouseEnabled="false" width="22" height="22" isHtml="true" align="center" var="uBtn"/>
			  <Label text="上传附件:" x="25" y="385" align="right" width="107" height="21"/>
			  <Button label="点击上传" skin="png.comp.button" x="142" y="383" width="112" height="23" var="upLoadBtn"/>
			  <Label text="支持doc,pdf,xls,jpg类型文件，20M以内" x="146" y="416" width="221" height="18" color="0xff0000"/>
			  <ProgressBar skin="png.comp.progress" x="284" y="387" var="progress" visible="false"/>
			  <Button label="发送" skin="png.comp.button" x="142" y="464" var="sendBtn"/>
			  <Label text="新增" x="14" y="4" width="48" height="18" var="operTxt"/>
			</Dialog>;
		public function NoticeEditUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}