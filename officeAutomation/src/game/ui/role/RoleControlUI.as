/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class RoleControlUI extends Dialog {
		protected static var uiXML:XML =
			<Dialog width="217" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="50,50,10,10" width="217" height="900"/>
			  <Button skin="png.comp.btn_close" x="182" y="2" name="close"/>
			  <List x="8" y="37" spaceY="10" width="201" height="900" repeatX="1" repeatY="4">
			    <Box name="render" width="217" height="137" x="0" y="0">
			      <Clip skin="png.comp.clip_tree_arrow" x="0" y="0" clipX="1" clipY="2" index="0"/>
			      <CheckBox label="账号管理" skin="png.comp.checkbox" y="0" x="17"/>
			      <List x="0" y="30" spaceY="10" width="201" height="112" repeatX="1" repeatY="4">
			        <CheckBox label="角色管理" skin="png.comp.checkbox" y="0" x="29"/>
			      </List>
			    </Box>
			  </List>
			  <Image x="0" y="0" width="211" height="20" name="drag" url="png.comp.blank"/>
			</Dialog>;
		public function RoleControlUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}