/**Created by the Morn,do not modify.*/
package game.ui.salary {
	import morn.core.components.*;
	public class MySalaryUI extends View {
		public var dateTime:TextInput = null;
		public var table:List = null;
		public var SerialNumber:Label = null;
		protected static var uiXML:XML =
			<View width="1184" height="337">
			  <Image skin="png.comp.bg" x="0" y="0" sizeGrid="50,50,10,10" width="1059" height="900"/>
			  <Box name="render" width="872" height="152" x="7" y="72">
			    <Label text="日期：" x="69" y="63" width="43" height="19" size="13"/>
			    <TextInput skin="png.comp.textinput" x="134" y="59" width="74" height="27" toolTip="关键字搜索" var="dateTime"/>
			    <Button label="查询" skin="png.comp.button" x="235" y="58" width="50" height="28"/>
			    <Image skin="png.comp.blank" x="70" y="109" width="866" height="2"/>
			    <Image skin="png.comp.blank" x="70" y="109" width="2" height="96"/>
			    <Image skin="png.comp.blank" x="70" y="149" width="864" height="2"/>
			    <Image skin="png.comp.blank" x="440" y="110" width="2" height="95"/>
			    <Image skin="png.comp.blank" x="625" y="109" width="2" height="96"/>
			    <Image skin="png.comp.blank" x="738" y="110" width="2" height="94"/>
			    <Image skin="png.comp.blank" x="70" y="203" width="866" height="2"/>
			    <Image skin="png.comp.blank" x="934" y="110" width="2" height="93"/>
			    <Image skin="png.comp.blank" x="107" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="684" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="556" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="498" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="384" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="332" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="271" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="215" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="159" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="877" y="151" width="2" height="52"/>
			    <Image skin="png.comp.blank" x="807" y="151" width="2" height="52"/>
			    <Label text="基本信息" x="232" y="123" width="58" height="18" size="13"/>
			    <Label text="应扣款" x="503" y="122" width="46" height="18" size="13"/>
			    <Label text="报销及奖金" x="649" y="124" width="72" height="19" size="13"/>
			    <Label text="本月实发工资" x="799" y="122" width="89" height="19" size="13"/>
			    <Label text="序号" x="74" y="169" size="13"/>
			    <Label text="姓名" x="117" y="172" width="32" height="18" size="13"/>
			    <Label text="应出勤天数" x="165" y="161" width="46" height="37" wordWrap="true" multiline="true" align="center" size="13"/>
			    <Label text="实际出勤天数" x="216" y="162" width="57" height="37" size="13" multiline="true" wordWrap="true" align="center"/>
			    <Label text="基本工资" x="275" y="169" width="59" height="19" size="13"/>
			    <Label text="应发工资" x="344" y="162" width="33" height="36" size="13" multiline="true" wordWrap="true" align="center"/>
			    <Label text="社保" x="401" y="168" width="34" height="25" size="13"/>
			    <Label text="公积金" x="449" y="169" width="44" height="24" size="13"/>
			    <Label text="个税" x="503" y="168" width="36" height="22" size="13"/>
			    <Label text="其他扣款" x="570" y="168" width="53" height="20" size="13"/>
			    <Label text="报销" x="635" y="169" width="39" height="22" size="13"/>
			    <Label text="其他" x="694" y="169" width="34" height="20" size="13"/>
			    <Label text="实发工资" x="743" y="169" width="60" height="19" size="13"/>
			    <Label text="第一次发金额" x="817" y="158" width="56" height="36" align="center" multiline="true" wordWrap="true" size="13"/>
			    <Label text="剩余" x="889" y="170" width="39" height="21" size="13"/>
			    <List x="73" y="210" spaceY="10" width="901" height="27" repeatY="10" var="table">
			      <Box name="render" width="867" height="15" x="0" y="0">
			        <Label text="01" x="0" y="0" width="34" height="18" name="SerialNumber" var="SerialNumber"/>
			        <Label text="label" x="39" y="-2" name="name"/>
			        <Label text="label" x="96" y="-1" name="attendanceDays"/>
			        <Label text="label" x="156" y="-2" name="actualAttendanceDays"/>
			        <Label text="label" x="207" y="-3" name="basicSalary"/>
			        <Label text="label" x="262" y="-2" name="shouldPay" width="31" height="19"/>
			        <Label text="label" x="315" y="-2" name="socialSecurity"/>
			        <Label text="label" x="374" y="-2" name="accumulationFund"/>
			        <Label text="label" x="430" y="-2" name="incomeTax"/>
			        <Label text="label" x="489" y="-2" name="otherDeductions"/>
			        <Label text="label" x="554" y="-3" name="expenseAccount"/>
			        <Label text="label" x="619" y="-1" width="31" height="19" name="other"/>
			        <Label text="label" x="673" y="-2" name="realWages"/>
			        <Label text="label" x="741" y="-3" width="31" height="19" name="sendAmountFirst"/>
			        <Label text="label" x="808" y="-2" width="31" height="19" name="remaining"/>
			        <Image skin="png.comp.blank" x="-3" y="18" width="865" height="2"/>
			        <Image skin="png.comp.blank" x="861" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="-3" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="86" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="198" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="311" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="142" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="259" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="367" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="34" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="804" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="734" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="665" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="611" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="552" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="483" y="-5" width="2" height="25"/>
			        <Image skin="png.comp.blank" x="425" y="-5" width="2" height="25"/>
			        <Label text="id" x="868" y="-4" name="id" visible="false"/>
			      </Box>
			    </List>
			  </Box>
			</View>;
		public function MySalaryUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}