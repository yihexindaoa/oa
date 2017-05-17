/**Created by the Morn,do not modify.*/
package game.ui.role {
	import morn.core.components.*;
	public class EditInforUI extends Dialog {
		public var title:Label = null;
		public var workNumber:TextInput = null;
		public var creationTime:TextInput = null;
		public var remarks:TextInput = null;
		public var personalInterests:TextInput = null;
		public var spouseBirthday:TextInput = null;
		public var childrenBirthday:TextInput = null;
		public var parentsBirthday:TextInput = null;
		public var personalBirthday:TextInput = null;
		public var thing:Label = null;
		public var maritalStatus:TextInput = null;
		public var currentAddress:TextInput = null;
		public var idAddress:TextInput = null;
		public var idCard:TextInput = null;
		public var dateBirth:TextInput = null;
		public var graduationTime:TextInput = null;
		public var recordFormalSchooling:TextInput = null;
		public var whatLearnProfessional:TextInput = null;
		public var graduateSchool:TextInput = null;
		public var accumulationFundCard:TextInput = null;
		public var accumulationFundAccount:TextInput = null;
		public var socialSecurityCard:TextInput = null;
		public var securityCardComputer:TextInput = null;
		public var bankAccount:TextInput = null;
		public var contactPhone:TextInput = null;
		public var emergencyContact:TextInput = null;
		public var personalMailbox:TextInput = null;
		public var emergencyCall:TextInput = null;
		public var englishReading:TextInput = null;
		public var companyMailbox:TextInput = null;
		public var wechat:TextInput = null;
		public var qq:TextInput = null;
		public var englishWritten:TextInput = null;
		public var englishSay:TextInput = null;
		public var nameTxt:TextInput = null;
		public var englishListening:TextInput = null;
		public var contractStartTime:TextInput = null;
		public var inductionTime:TextInput = null;
		public var incumbent:TextInput = null;
		public var sex:TextInput = null;
		public var saveBtn:Button = null;
		protected static var uiXML:XML =
			<Dialog width="800" height="900">
			  <Image skin="png.comp.bg" y="0" width="800" height="900" sizeGrid="50,50,10,10"/>
			  <Image skin="png.comp.blank" x="3" y="3" width="764" height="21" name="drag"/>
			  <Button skin="png.comp.btn_close" x="767" y="4" name="close"/>
			  <Label text="新增" x="20" y="5" width="87" height="18" var="title"/>
			  <Label text="姓名：" x="86" y="45" width="40" height="19"/>
			  <Label text="性别：" x="85" y="77"/>
			  <TextInput skin="png.comp.textinput" x="522" y="43" var="workNumber" name="workNumber"/>
			  <Label text="工号：" x="487" y="45"/>
			  <TextInput skin="png.comp.textinput" x="526" y="538" name="employee_creationTime" var="creationTime"/>
			  <Label text="创建时间：" x="466" y="540"/>
			  <TextInput skin="png.comp.textinput" x="526" y="478" width="263" height="50" multiline="true" wordWrap="true" name="remarks" var="remarks"/>
			  <Label text="备注信息：" x="467" y="475"/>
			  <TextInput skin="png.comp.textinput" x="524" y="404" name="personalInterests" var="personalInterests" width="264" height="62" multiline="true" wordWrap="true"/>
			  <Label text="个人爱好：" x="464" y="405"/>
			  <TextInput skin="png.comp.textinput" x="524" y="376" var="spouseBirthday" name="employee_spouseBirthday"/>
			  <Label text="配偶生日：" x="463" y="377"/>
			  <TextInput skin="png.comp.textinput" x="524" y="348" var="childrenBirthday" name="employee_childrenBirthday"/>
			  <Label text="子女生日：" x="464" y="349"/>
			  <TextInput skin="png.comp.textinput" x="524" y="318" name="employee_parentsBirthday" var="parentsBirthday"/>
			  <Label text="父母生日：" x="464" y="319"/>
			  <TextInput skin="png.comp.textinput" x="524" y="286" name="employee_personalBirthday" var="personalBirthday"/>
			  <Label text="个人生日：" x="464" y="288"/>
			  <TextInput skin="png.comp.textinput" x="524" y="256"/>
			  <Label text="子女情况：" x="463" y="256" name="thing" var="thing"/>
			  <TextInput skin="png.comp.textinput" x="524" y="230" name="maritalStatus" var="maritalStatus"/>
			  <Label text="婚姻状况：" x="463" y="231"/>
			  <TextInput skin="png.comp.textinput" x="524" y="200" name="currentAddress" var="currentAddress"/>
			  <Label text="现住址：" x="474" y="201"/>
			  <TextInput skin="png.comp.textinput" x="524" y="168" width="263" height="22" name="idAddress" var="idAddress"/>
			  <Label text="身份证地址：" x="450" y="169" width="74" height="19"/>
			  <TextInput skin="png.comp.textinput" x="524" y="138" name="idCard" var="idCard"/>
			  <Label text="身份证号码：" x="450" y="140" width="86" height="19"/>
			  <TextInput skin="png.comp.textinput" x="524" y="106" var="dateBirth" name="employee_dateBirth"/>
			  <Label text="出生年月日：" x="451" y="107"/>
			  <TextInput skin="png.comp.textinput" x="524" y="75" var="graduationTime" name="employee_graduationTime"/>
			  <Label text="毕业时间：" x="463" y="74"/>
			  <TextInput skin="png.comp.textinput" x="123" y="809" name="recordFormalSchooling" var="recordFormalSchooling" width="238" height="22"/>
			  <Label text="学历：" x="84" y="808"/>
			  <TextInput skin="png.comp.textinput" x="123" y="780" var="whatLearnProfessional" name="whatLearnProfessional" width="238" height="22"/>
			  <Label text="所学专业：" x="60" y="781"/>
			  <TextInput skin="png.comp.textinput" x="123" y="750" width="239" height="22" name="graduateSchool" var="graduateSchool"/>
			  <Label text="毕业院校：" x="60" y="751" width="87" height="19"/>
			  <TextInput skin="png.comp.textinput" x="123" y="722" name="accumulationFundCard" var="accumulationFundCard"/>
			  <Label text="公积金卡编号：" x="36" y="722"/>
			  <TextInput skin="png.comp.textinput" x="123" y="690" name="accumulationFundAccount" var="accumulationFundAccount"/>
			  <Label text="公积金卡账号：" x="36" y="689"/>
			  <TextInput skin="png.comp.textinput" x="123" y="658" name="socialSecurityCard" var="socialSecurityCard"/>
			  <Label text="社保卡编号：" x="49" y="655"/>
			  <TextInput skin="png.comp.textinput" x="123" y="627" var="securityCardComputer" name="securityCardComputer"/>
			  <Label text="社保卡电脑号：" x="38" y="628" width="88" height="18"/>
			  <TextInput skin="png.comp.textinput" x="123" y="594" var="bankAccount" name="bankAccount" width="182" height="22"/>
			  <Label text="招商银行银行账号：" x="14" y="594"/>
			  <TextInput skin="png.comp.textinput" x="123" y="566" var="contactPhone" name="contactPhone"/>
			  <Label text="联系电话：" x="62" y="567"/>
			  <TextInput skin="png.comp.textinput" x="123" y="534" var="emergencyContact" name="emergencyContact"/>
			  <Label text="紧急联系人：" x="50" y="535"/>
			  <TextInput skin="png.comp.textinput" x="123" y="469" name="personalMailbox" var="personalMailbox"/>
			  <Label text="紧急联系电话：" x="38" y="502"/>
			  <TextInput skin="png.comp.textinput" x="123" y="500" var="emergencyCall" name="emergencyCall"/>
			  <Label text="个人邮箱：" x="62" y="469"/>
			  <TextInput skin="png.comp.textinput" x="123" y="301" name="englishReading" var="englishReading"/>
			  <Label text="公司邮箱：" x="62" y="439"/>
			  <TextInput skin="png.comp.textinput" x="123" y="438" var="companyMailbox" name="companyMailbox"/>
			  <Label text="微信：" x="85" y="405"/>
			  <TextInput skin="png.comp.textinput" x="123" y="404" var="wechat" name="wechat"/>
			  <Label text="QQ：" x="90" y="373"/>
			  <TextInput skin="png.comp.textinput" x="123" y="371" var="qq" name="qq"/>
			  <Label text="英文能力(写)：" x="43" y="342"/>
			  <TextInput skin="png.comp.textinput" x="123" y="337" var="englishWritten" name="englishWritten"/>
			  <Label text="英文能力(读)：" x="43" y="303" width="83" height="19"/>
			  <TextInput skin="png.comp.textinput" x="123" y="267" var="englishSay" name="englishSay"/>
			  <Label text="英文能力(说)：" x="43" y="270"/>
			  <TextInput skin="png.comp.textinput" x="122" y="45" var="nameTxt" name="name"/>
			  <Label text="英文能力(听)：" x="43" y="232"/>
			  <TextInput skin="png.comp.textinput" x="123" y="231" name="englishListening" var="englishListening"/>
			  <Label text="现合同起始时间：" x="27" y="195"/>
			  <TextInput skin="png.comp.textinput" x="124" y="194" var="contractStartTime" name="employee_contractStartTime"/>
			  <Label text=" " x="74" y="124"/>
			  <TextInput skin="png.comp.textinput" x="122" y="153" var="inductionTime" name="employee_inductionTime"/>
			  <Label text="入职时间：" x="62" y="153"/>
			  <TextInput skin="png.comp.textinput" x="122" y="116" var="incumbent" name="incumbent"/>
			  <Label text="现任职务：" x="62" y="116" width="61" height="19"/>
			  <TextInput skin="png.comp.textinput" x="122" y="78" var="sex" name="sex"/>
			  <Button label="保存" skin="png.comp.button" x="479" y="668" width="88" height="58" var="saveBtn"/>
			  <TextInput text="id" skin="png.comp.textinput" x="644" y="627" name="id" visible="false"/>
			</Dialog>;
		public function EditInforUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}