/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class InforUI extends View {
		public var queryTxt:TextInput = null;
		public var queryBtn:Clip = null;
		public var addBtn:Button = null;
		public var editBtn:Button = null;
		public var exportBtn:Button = null;
		public var importBtn:Button = null;
		public var deteBtn:Button = null;
		public var panelTable:Panel = null;
		protected static var uiXML:XML =
			<View width="800" height="900" buttonMode="true">
			  <Image skin="png.comp.bg" x="0" y="0" width="800" height="900" sizeGrid="50,50,10,10"/>
			  <TextInput skin="png.comp.textinput" x="509" y="74" width="175" height="22" toolTip="关键字搜索：姓名、部门、账号（手机号码" var="queryTxt"/>
			  <Clip skin="png.comp.clip_timg" x="687" y="73" clipX="4" clipY="4" index="2" width="29" height="23" var="queryBtn"/>
			  <Button label="新增" skin="png.comp.button" x="71" y="73" var="addBtn"/>
			  <Button label="编辑" skin="png.comp.button" x="162" y="73" var="editBtn"/>
			  <Button label="导出样本" skin="png.comp.button" x="250" y="73" var="exportBtn"/>
			  <Button label="批量导入" skin="png.comp.button" y="73" x="339" var="importBtn"/>
			  <Button label="删除" skin="png.comp.button" x="427" y="73" var="deteBtn"/>
			  <Panel x="10" y="140" width="760" height="160" hScrollBarSkin="png.comp.hscroll" var="panelTable">
			    <Label text="姓名" x="0" y="28" width="46" height="24" align="center"/>
			    <Label text="性别" x="81" y="28"/>
			    <Label text="现职务" x="149" y="50"/>
			    <Label text="入职时间" x="204" y="50"/>
			    <Label text="现合同起始时间" x="266" y="38" multiline="true" wordWrap="true" height="37" width="77" align="center"/>
			    <Label text="英文能力" x="385" y="19" width="60" height="18"/>
			    <Label text="听" x="363" y="43"/>
			    <Label text="说" x="393" y="43"/>
			    <Label text="读" x="419" y="43"/>
			    <Label text="写" x="445" y="43"/>
			    <Label text="QQ" x="500" y="50" width="31" height="25.59265927977839"/>
			    <Label text="微信" x="548" y="50"/>
			    <Label text="工作邮箱" x="627" y="19"/>
			    <Label text="公司" x="615" y="50"/>
			    <Label text="个人" x="674" y="50"/>
			    <Label text="紧急联系电话" x="728" y="38"/>
			    <Label text="招商银行帐号" x="825" y="38"/>
			    <Label text="社保卡电脑号" x="930" y="38"/>
			    <Label text="备注" x="1035" y="38"/>
			    <Label text="毕业院校" x="1098" y="38"/>
			    <Label text="所学专业" x="1183" y="38"/>
			    <Label text="学历" x="1256" y="38"/>
			    <Label text="毕业时间" x="1323" y="38"/>
			    <Label text="出生年月日" x="1427" y="38"/>
			    <Label text="身份证号码" x="1521" y="38"/>
			    <Label text="身份证地址" x="1632" y="38"/>
			    <Label text="现住址" x="1726" y="38"/>
			    <Label text="婚姻状况" x="1795" y="38"/>
			    <Label text="子女情况" x="1880" y="38"/>
			    <Label text="生日信息" x="2065" y="19"/>
			    <Label text="个人生日" x="1967" y="48"/>
			    <Label text="父母生日" x="2038" y="48"/>
			    <Label text="子女生日" x="2100" y="48"/>
			    <Label text="配偶生日" x="2177" y="48"/>
			    <Label text="个人爱好" x="2279" y="38"/>
			    <Label text="私人信息" x="1630" y="0"/>
			  </Panel>
			</View>;
		public function InforUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}