/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class UserMangUI extends View {
		public var addBtn:Button = null;
		public var queryTxt:TextInput = null;
		public var table:List = null;
		public var editBtn:Button = null;
		public var deleteBtn:Button = null;
		public var disBtn:Button = null;
		public var adbleBtn:Button = null;
		public var queryBtn:Clip = null;
		protected static var uiXML:XML =
			<View width="800" height="900" sceneColor="0x336666" sceneBg="E:/qisong/oa/OA系统/img/bg.jpg" layers="1,1,0,0,第 1 层" buttonMode="true" compId="10" selectedBox="4">
			  <Image skin="png.comp.bg" x="0" y="0" layer="1" width="800" height="900" sizeGrid="50,50,10,10" compId="1"/>
			  <Button label="新增" skin="png.comp.button" x="167" y="87" layer="1" var="addBtn" compId="2"/>
			  <TextInput skin="png.comp.textinput" x="265" y="86" layer="1" width="175" height="22" toolTip="关键字搜索：姓名、部门、账号（手机号码" var="queryTxt" compId="3"/>
			  <List layers="1,1,0" layer="1" x="170" y="165" spaceY="10" width="517" height="142" repeatX="1" repeatY="4" var="table" compId="4">
				<Box layers="2,1,1,0,第 2 层;1,1,1,0,第 1 层" layer="1" name="render" width="726" height="27" x="-120" y="0" compId="18" left="-120">
				  <Label styleSkin="png.comp.label" x="621" y="0" layer="1" width="106" height="34" background="true" backgroundColor="0x6699cc" compId="11" text=" "/>
				  <Button label="编辑" skin="png.comp.button" x="637" y="3" layer="1" width="30" height="23" labelColors="0x0000ff" compId="12" name="editBtn"/>
				  <Button label="删除" skin="png.comp.button" x="684" y="3" layer="1" width="34" height="23" labelColors="0x0000ff" compId="13" name="deleteBtn"/>
				  <Label text="01" styleSkin="png.comp.label" x="-1" y="0" layer="1" width="49" height="34" align="center" size="15" background="true" backgroundColor="0x6699cc" name="roleId" compId="15"/>
				  <Label text="label" styleSkin="png.comp.label" x="49" y="0" layer="1" width="95" height="34" size="15" align="center" background="true" backgroundColor="0x6699cc" name="roleCode" compId="16"/>
				  <Label text="label" styleSkin="png.comp.label" x="145" y="0" layer="1" height="34" align="center" size="15" width="103" background="true" backgroundColor="0x6699cc" name="roleNme" compId="17"/>
				  <Label text="label" styleSkin="png.comp.label" x="354" y="0" layer="1" height="34" align="center" size="15" width="82" background="true" backgroundColor="0x6699cc" name="roleNme" compId="23"/>
				  <Label text="label" styleSkin="png.comp.label" x="438" y="0" layer="1" height="34" align="center" size="15" width="91" background="true" backgroundColor="0x6699cc" name="roleNme" compId="24"/>
				  <Label text=" " styleSkin="png.comp.label" x="532" y="0" layer="1" height="34" align="center" size="15" width="86" background="true" backgroundColor="0x6699cc" name="roleNme" compId="25"/>
				  <Label text="label" styleSkin="png.comp.label" x="250" y="0" layer="1" height="34" align="center" size="15" width="103" background="true" backgroundColor="0x6699cc" name="roleNme" compId="26"/>
				  <Button compId="27" label="禁用" skin="png.comp.button" x="538" y="3" layer="1" width="37" height="23" labelColors="0xff0000" name="disBtn"/>
				  <Button compId="28" label="启用" skin="png.comp.button" x="580" y="3" layer="1" width="35" height="23" labelColors="0x0000ff" name="adbleBtn"/>
				</Box>
			  </List>
			  <Clip skin="png.comp.clip_timg" x="443" y="85" layer="1" clipX="4" clipY="4" index="2" width="29" height="23" var="queryBtn" compId="5"/>
			  <Label text="序号" styleSkin="png.comp.label" x="48" y="134" layer="1" width="50" height="30" background="true" backgroundColor="0x99cc" bold="true" size="18" selectable="true" align="center" compId="6"/>
			  <Label text="姓名" styleSkin="png.comp.label" x="99" y="134" layer="1" width="95" height="30" backgroundColor="0x99cc" background="true" size="18" bold="true" align="center" compId="7"/>
			  <Label text="状态" styleSkin="png.comp.label" x="581" y="134" layer="1" width="86" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18" compId="8"/>
			  <Label text="职位" styleSkin="png.comp.label" x="300" y="134" layer="1" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18" compId="19"/>
			  <Label text="账号" styleSkin="png.comp.label" x="490" y="134" layer="1" width="89" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18" compId="20"/>
			  <Label text="直属上级" styleSkin="png.comp.label" x="405" y="134" layer="1" width="83" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18" compId="21"/>
			  <Label text="部门" styleSkin="png.comp.label" x="195" y="134" layer="1" width="104" height="30" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18" compId="22"/>
			  <Label text="操作" styleSkin="png.comp.label" x="671" y="134" layer="1" height="30" width="106" background="true" backgroundColor="0x99cc" bold="true" align="center" size="18" compId="9"/>
			</View>;
		public function UserMangUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}