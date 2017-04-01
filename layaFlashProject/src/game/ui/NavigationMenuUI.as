/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class NavigationMenuUI extends View {
		protected static var uiXML:XML =
			<View width="160" buttonMode="true" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="50,50,10,10" width="160" height="900"/>
			  <Image x="30" y="31" width="95" height="105"/>
			  <Label text="小雷   产品经理" x="34" width="92" height="18" font="黑体" y="139"/>
			  <Box name="render" left="0" right="0" x="11" y="158">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="0" x="0" y="0" width="31"/>
			    <Button label="系统首页" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="190">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="13" x="0" y="0" width="31"/>
			    <Button label="权限管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="394">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="7" x="0" y="0" width="31"/>
			    <Button label="通知告示管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="426">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="3" x="0" y="0" width="31"/>
			    <Button label="工作报表管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="458">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="10" x="0" y="0" width="31"/>
			    <Button label="考勤管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="490">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="11" x="0" y="0" width="31"/>
			    <Button label="工资管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="522">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="9" x="0" y="0" width="31"/>
			    <Button label="项目管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="554">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="5" x="0" y="0" width="31"/>
			    <Button label="合同管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="586">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="2" x="0" y="0" width="31"/>
			    <Button label="审批管理" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="618">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="6" x="0" y="0" width="31"/>
			    <Button label="报表统计" skin="png.comp.button" x="31" y="0" width="123" height="32"/>
			  </Box>
			  <Box name="render" left="40" x="84" y="221" width="110" height="92">
			    <Button label="角色管理" skin="png.comp.button" x="0" y="0" width="110" height="23"/>
			    <Button label="菜单管理" skin="png.comp.button" x="0" y="23" width="110"/>
			    <Button label="用户管理" skin="png.comp.button" x="0" y="46" width="110" height="23"/>
			    <Button label="信息表管理" skin="png.comp.button" x="0" y="69" width="110" height="23"/>
			  </Box>
			</View>;
		public function NavigationMenuUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}