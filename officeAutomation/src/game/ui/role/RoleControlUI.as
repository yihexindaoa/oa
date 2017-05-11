/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class RoleControlUI extends Dialog {
		public var table:List = null;
		public var title:Label = null;
		protected static var uiXML:XML =
			<Dialog width="217" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="30,30,10,10" width="241" height="900"/>
			  <Button skin="png.comp.btn_close" x="210" y="2" name="close"/>
			  <List x="19" y="37" spaceY="10" width="201" height="900" repeatX="1" repeatY="4" var="table">
			    <Box name="render" width="217" height="137" x="0" y="0" visible="false">
			      <Clip skin="png.comp.clip_tree_arrow" x="0" y="0" clipX="1" clipY="2" index="0"/>
			      <CheckBox skin="png.comp.checkbox" y="0" x="17" name="parentCheck"/>
			      <List x="29" y="30" spaceY="10" repeatX="1" repeatY="4" name="sonTable">
			        <Box name="render">
			          <CheckBox label="角色管理" skin="png.comp.checkbox" name="sonMenu"/>
			        </Box>
			      </List>
			      <Label text="账号管理" x="35" y="-2" name="meunName"/>
			    </Box>
			  </List>
			  <Image x="0" y="0" width="211" height="20" name="drag" url="png.comp.blank"/>
			  <Label text="角色的菜单权限分配" x="7" y="-1" width="200" height="36" var="title" wordWrap="true" multiline="true"/>
			</Dialog>;
		public function RoleControlUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}