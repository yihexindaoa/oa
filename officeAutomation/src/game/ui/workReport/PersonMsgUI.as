/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class PersonMsgUI extends Dialog {
		public var table:List = null;
		public var submit:Button = null;
		protected static var uiXML:XML =
			<Dialog width="600" height="600">
			  <Image skin="png.comp.bg" x="-2" y="-1" width="601" height="602" sizeGrid="50,50,10,10"/>
			  <Button skin="png.comp.btn_close" x="565" y="6" name="close"/>
			  <Label x="13" y="5" width="71" height="18" text="接收人" color="0xffffff" size="14"/>
			  <List x="43" y="65" spaceY="10" width="517" height="22" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="726" height="27" x="0" y="0">
			      <CheckBox skin="png.comp.checkbox" x="0" y="0" name="check"/>
			      <Label text="用户" x="23" y="-4" size="14" name="userName"/>
			      <Label text="id" x="66" y="-4" name="id" visible="false"/>
			    </Box>
			  </List>
			  <Button label="关闭" skin="png.comp.button" x="515" y="566" width="57" height="24" name="close"/>
			  <Image skin="png.comp.blank_blue" x="0" y="540" width="596" height="1"/>
			  <Button label="确定" skin="png.comp.button" x="447" y="566" width="58" height="25" var="submit"/>
			  <Image skin="png.comp.blank" x="6" y="3" width="581" height="14" name="drag"/>
			</Dialog>;
		public function PersonMsgUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}