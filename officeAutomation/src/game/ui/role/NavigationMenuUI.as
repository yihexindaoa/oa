/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class NavigationMenuUI extends View {
		public var syspageBox:Box = null;
		public var syspageBtn:Button = null;
		public var authorityBox:Box = null;
		public var authorityBtn:Button = null;
		public var noticeBox:Box = null;
		public var noticeBtn:Button = null;
		public var reportBox:Box = null;
		public var reportBtn:Button = null;
		public var attendanceBox:Box = null;
		public var attendanceBtn:Button = null;
		public var wageBox:Box = null;
		public var wageBtn:Button = null;
		public var projectBox:Box = null;
		public var projectBtn:Button = null;
		public var contractBox:Box = null;
		public var contractBtn:Button = null;
		public var approvalBox:Box = null;
		public var approvalBtn:Button = null;
		public var statisticsBox:Box = null;
		public var statisticsBtn:Button = null;
		public var authorityChild:Box = null;
		public var noticeChild:Box = null;
		public var reportChild:Box = null;
		protected static var uiXML:XML =
			<View width="160" buttonMode="true" height="900" visible="true">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="50,50,10,10" width="160" height="900"/>
			  <Image x="30" y="31" width="95" height="105"/>
			  <Label text="小雷   产品经理" x="34" width="92" height="18" font="黑体" y="139"/>
			  <Box name="render" left="0" right="0" x="0" y="158" var="syspageBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="0" x="0" y="0" width="31"/>
			    <Button label="系统首页" skin="png.comp.button" x="31" y="0" width="123" height="32" var="syspageBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="190" var="authorityBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="13" x="0" y="0" width="31"/>
			    <Button label="权限管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="authorityBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="314" var="noticeBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="7" x="0" y="0" width="31"/>
			    <Button label="通知告示管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="noticeBtn" name="通知告示管理"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="370" var="reportBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="3" x="0" y="0" width="31"/>
			    <Button label="工作报表管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="reportBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="441" var="attendanceBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="10" x="0" y="0" width="31"/>
			    <Button label="考勤管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="attendanceBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="473" var="wageBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="11" x="0" y="0" width="31"/>
			    <Button label="工资管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="wageBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="505" var="projectBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="9" x="0" y="0" width="31"/>
			    <Button label="项目管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="projectBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="537" var="contractBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="5" x="0" y="0" width="31"/>
			    <Button label="合同管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="contractBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="569" var="approvalBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="2" x="0" y="0" width="31"/>
			    <Button label="审批管理" skin="png.comp.button" x="31" y="0" width="123" height="32" var="approvalBtn"/>
			  </Box>
			  <Box name="render" left="0" right="0" x="0" y="601" var="statisticsBox">
			    <Clip skin="png.comp.clip_timg" clipY="4" autoPlay="false" height="32" clipX="4" index="6" x="0" y="0" width="31"/>
			    <Button label="报表统计" skin="png.comp.button" x="31" y="0" width="123" height="32" var="statisticsBtn"/>
			  </Box>
			  <Box name="render" left="31" x="40" y="222" width="123" height="92" var="authorityChild" visible="false">
			    <Button label="角色管理" skin="png.comp.button" x="0" y="0" width="123" height="23" buttonMode="true"/>
			    <Button label="菜单管理" skin="png.comp.button" x="0" y="23" width="123" height="23"/>
			    <Button label="用户管理" skin="png.comp.button" x="0" y="46" width="123" height="23"/>
			    <Button label="信息表管理" skin="png.comp.button" x="0" y="69" width="123" height="23"/>
			  </Box>
			  <Box name="render" left="31" x="31" y="346" width="123" height="23" var="noticeChild" visible="false">
			    <Button label="通知告示统计表" skin="png.comp.button" x="0" y="0" width="123" height="23" buttonMode="true"/>
			  </Box>
			  <Box name="render" left="31" x="31" y="401" width="123" height="23" var="reportChild" visible="false">
			    <Button label="工作报表统计" skin="png.comp.button" x="0" y="0" width="123" height="23" buttonMode="true"/>
			  </Box>
			</View>;
		public function NavigationMenuUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}