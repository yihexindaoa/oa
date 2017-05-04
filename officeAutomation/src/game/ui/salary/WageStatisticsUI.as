/**Created by the Morn,do not modify.*/
package game.ui.salary {
	import morn.core.components.*;
	public class WageStatisticsUI extends View {
		public var item:Box = null;
		public var tab01:Button = null;
		public var line:Image = null;
		public var tab02:Button = null;
		public var item1:Box = null;
		public var addBtn:Button = null;
		public var input:TextInput = null;
		public var outputExcel:Button = null;
		public var dateTime:TextInput = null;
		public var table:List = null;
		public var SerialNumber:Label = null;
		public var find:Image = null;
		public var item2:Box = null;
		public var outputExcelSample:Button = null;
		public var inputExcel:Button = null;
		public var timeDate:Label = null;
		public var year:TextInput = null;
		public var findAllOutputExcel:Button = null;
		public var item3:Box = null;
		public var item5:Box = null;
		public var input2:TextInput = null;
		public var outputExcelSalaryIncrease:Button = null;
		public var imageOne:Image = null;
		public var table2:List = null;
		public var SerialNumber1:Label = null;
		public var item6:Box = null;
		public var names:TextInput = null;
		public var position:TextInput = null;
		public var salaryIncrease:TextInput = null;
		public var salaryIncreaseReason:TextInput = null;
		public var salaryBasicWage:TextInput = null;
		public var originalBasicSalary:TextInput = null;
		public var workingTime:TextInput = null;
		public var addSalary:Button = null;
		public var imageTwo:Image = null;
		public var payrollRecord:Button = null;
		public var addSalaryIncrease:Button = null;
		protected static var uiXML:XML =
			<View width="1062" height="900">
			  <Image skin="png.comp.bg" width="1059" height="900" sizeGrid="50,50,10,10" x="-3" y="0"/>
			  <Box x="-288" y="-42" name="item" visible="true" var="item" width="1230" height="275">
			    <Button label="工资统计表" width="115" height="18" var="tab01" x="325" y="109"/>
			    <Image skin="png.comp.blank_blue" x="345" y="128" width="77" height="3" var="line"/>
			    <Button label="调薪记录" width="102" height="18" var="tab02" x="427" y="110"/>
			    <Box x="347" y="156" name="item1" visible="true" var="item1">
			      <Button label="新增" skin="png.comp.button" width="64" height="23" var="addBtn" name="addBtn"/>
			      <Label text="日期：" x="107" y="3" width="39" height="18"/>
			      <TextInput skin="png.comp.textinput" x="249" width="199" height="23" toolTip="关键字搜索" y="1" var="input"/>
			      <Button label="导出" skin="png.comp.button" x="501" var="outputExcel" y="1" width="64" height="23"/>
			      <Label text="基本信息" x="193" y="52" width="59" height="21"/>
			      <TextInput label="日期" x="144" width="64" height="23" var="dateTime" skin="png.comp.textinput" y="0"/>
			      <Label x="477" y="51" width="46" height="20" text="应扣款"/>
			      <Label text="报销及奖金" x="614" y="51" width="71" height="21"/>
			      <Label text="本月实发工资" x="770" y="54" width="84" height="18"/>
			      <Label text="序号" x="35" y="98" width="28" height="19"/>
			      <Label text="姓名" x="82" y="98" width="28" height="19"/>
			      <Label x="134" y="90" width="41" height="37" text="应出勤天数" multiline="true" align="center" wordWrap="true"/>
			      <Label text="实际出勤天数" x="187" y="91" width="56" height="37" wordWrap="true" multiline="true" align="center"/>
			      <Label text="基本工资" x="249" y="98" width="56" height="18"/>
			      <Label text="应发工资" x="308" y="93" width="34" height="39" multiline="true" wordWrap="true" align="center"/>
			      <Label text="社保" x="362" y="98"/>
			      <Label text="公积金" x="416" y="97" width="46" height="18"/>
			      <Label text="个税" x="480" y="99"/>
			      <Label text="其他扣款" x="530" y="98" width="58" height="18"/>
			      <Label text="报销" x="603" y="98"/>
			      <Label text="其他" x="664" y="99"/>
			      <Label text="实发工资" x="715" y="97" width="59" height="18"/>
			      <Label text="第一次发金额" x="776" y="92" width="54" height="35" wordWrap="true" align="center"/>
			      <Label text="剩余" x="858" y="98"/>
			      <List x="37" y="135" spaceY="10" width="901" height="27" repeatY="10" var="table">
			        <Box name="render" width="867" height="15" x="0" y="0">
			          <Label text="01" x="0" y="0" width="34" height="18" name="SerialNumber" var="SerialNumber"/>
			          <Label text="label" x="36" y="-2" name="name"/>
			          <Label text="label" x="99" y="-1" name="attendanceDays"/>
			          <Label text="label" x="156" y="-2" name="actualAttendanceDays"/>
			          <Label text="label" x="207" y="-3" name="basicSalary"/>
			          <Label text="label" x="267" y="-2" name="shouldPay"/>
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
			          <Image skin="png.comp.blank" x="82" y="-5" width="2" height="25"/>
			          <Image skin="png.comp.blank" x="204" y="-5" width="2" height="25"/>
			          <Image skin="png.comp.blank" x="311" y="-5" width="2" height="25"/>
			          <Image skin="png.comp.blank" x="142" y="-5" width="2" height="25"/>
			          <Image skin="png.comp.blank" x="264" y="-5" width="2" height="25"/>
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
			      <Image skin="png.comp.blank" x="34" y="42" width="867" height="2"/>
			      <Image skin="png.comp.blank" x="34" y="43" width="2" height="88"/>
			      <Image skin="png.comp.blank" x="898" y="43" width="2" height="89"/>
			      <Image skin="png.comp.blank" x="34" y="130" width="865" height="2"/>
			      <Image skin="png.comp.blank" x="34" y="77" width="867" height="2"/>
			      <Image skin="png.comp.blank" x="404" y="43" width="2" height="88"/>
			      <Image skin="png.comp.blank" x="589" y="45" width="2" height="88"/>
			      <Image skin="png.comp.blank" x="702" y="42" width="2" height="90"/>
			      <Image skin="png.comp.blank" x="71" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="119" y="78" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="179" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="241" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="301" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="348" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="462" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="520" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="648" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="771" y="77" width="2" height="53"/>
			      <Image skin="png.comp.blank" x="841" y="77" width="2" height="53"/>
			      <Image skin="png.comp.search_button" x="430" y="4" var="find"/>
			    </Box>
			    <Box name="item2" width="1059" height="300" visible="false" disabled="false" var="item2">
			      <Button label="导出样本" skin="png.comp.button" x="346" y="157" width="82" height="23" var="outputExcelSample"/>
			      <Button label="批量导入" skin="png.comp.button" x="456" y="158" width="80" height="23" var="inputExcel"/>
			      <Label text="工资单年月：" x="346" y="204" width="78" height="18" var="timeDate"/>
			      <TextInput skin="png.comp.textinput" x="425" y="202" width="136" height="22" name="year" var="year"/>
			      <Label text="Excel文件：" x="347" y="256" width="67" height="18"/>
			      <TextInput skin="png.comp.textinput" x="425" y="249" width="189" height="26"/>
			      <Button label="预览" skin="png.comp.button" x="636" y="251" width="38" height="23" var="findAllOutputExcel"/>
			    </Box>
			  </Box>
			  <Box name="render" width="480" height="184" x="76" y="423" visible="false" var="item3">
			    <Box x="-65" y="-438" visible="true" var="item5" width="1113" height="70">
			      <TextInput skin="png.comp.textinput" x="69" y="122" width="223" height="27" toolTip="关键字搜索" var="input2"/>
			      <Button label="导出" skin="png.comp.button" x="313" y="123" width="59" height="24" var="outputExcelSalaryIncrease"/>
			      <Image skin="png.comp.search_button" x="268" y="126" width="19" height="18" var="imageOne"/>
			      <Image skin="png.comp.blank" x="83" y="184" width="828" height="2"/>
			      <Image skin="png.comp.blank" x="84" y="237" width="828" height="2"/>
			      <Image skin="png.comp.blank" x="82" y="185" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="911" y="184" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="126" y="185" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="311" y="186" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="403" y="186" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="495" y="186" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="611" y="186" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="728" y="186" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="815" y="183" width="2" height="54"/>
			      <Image skin="png.comp.blank" x="182" y="186" width="2" height="54"/>
			      <Label text="序号" x="92" y="203" width="36" height="21"/>
			      <Label text="姓名" x="140" y="203" width="30" height="20"/>
			      <Label text="职位" x="210" y="203" width="27" height="18"/>
			      <Label text="在职时长" x="333" y="203" width="52" height="20"/>
			      <Label text="原基本工资" x="418" y="203" width="67" height="25"/>
			      <Label text="调薪后基本工资" x="506" y="203" width="97" height="23" size="13"/>
			      <Label text="调薪理由" x="631" y="203" width="57" height="23" size="13"/>
			      <Label text="调薪月份" x="744" y="203" width="66" height="20" size="13"/>
			      <Label text="操作" x="831" y="200" width="32" height="18"/>
			      <List x="77" y="163" spaceY="10" width="901" height="45" repeatY="10" var="table2">
			        <Box name="render" width="867" height="17" x="0" y="-1">
			          <Image skin="png.comp.blank" x="8" y="102" width="828" height="2"/>
			          <Image skin="png.comp.blank" x="326" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="833" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="738" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="651" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="534" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="418" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="234" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="5" y="76" width="2" height="28"/>
			          <Image skin="png.comp.blank" x="105" y="74" width="2" height="30"/>
			          <Image skin="png.comp.blank" x="49" y="74" width="2" height="30"/>
			          <Label text="label" x="10" y="79" name="SerialNumber1" var="SerialNumber1" width="37" height="18"/>
			          <Label text="label" x="56" y="80" name="name" width="43" height="18"/>
			          <Label text="label" x="108" y="80" name="position" width="125" height="18"/>
			          <Label text="label" x="245" y="79" width="78" height="18" name="workingTime"/>
			          <Label text="label" x="330" y="80" width="83" height="18" name="originalBasicSalary"/>
			          <Label text="label" x="424" y="78" width="109" height="18" name="salaryBasicWage"/>
			          <Label text="label" x="541" y="78" width="102" height="20" name="salaryIncreaseReason"/>
			          <Label text="label" x="660" y="79" width="73" height="18" name="salaryIncrease"/>
			          <Label text="id" x="843" y="79" width="43" height="18" name="id" visible="false"/>
			          <Label text="编辑" x="750" y="80" width="31" height="18" color="0xff"/>
			          <Label text="删除" x="795" y="80" color="0xff"/>
			        </Box>
			      </List>
			    </Box>
			    <Box x="27" y="-151" visible="false" var="item6" width="367" height="128">
			      <Label text="姓名：" x="10" y="-111" width="44" height="19" size="14"/>
			      <TextInput skin="png.comp.textinput" x="61" y="-115" var="names" width="143" height="26"/>
			      <TextInput skin="png.comp.textinput" x="61" y="-75" var="position" width="142" height="26"/>
			      <Label text="岗位：" x="11" y="-70" width="39" height="20" size="14"/>
			      <Label text="在职时长：" x="-18" y="-31" width="71" height="20" size="14"/>
			      <Label text="原基本工资：" x="-32" y="13" width="85" height="20" size="14"/>
			      <Label text="调薪后基本工资：" x="-61" y="55" width="115" height="19" size="14"/>
			      <Label text="调薪理由：" x="-20" y="95" width="66" height="20" size="14"/>
			      <Label text="调薪年月：" x="-17" y="140" width="68" height="21" size="14"/>
			      <TextInput skin="png.comp.textinput" x="61" y="133" width="143" height="26" var="salaryIncrease"/>
			      <TextInput skin="png.comp.textinput" x="61" y="91" width="143" height="26" var="salaryIncreaseReason"/>
			      <TextInput skin="png.comp.textinput" x="61" y="50" width="143" height="26" var="salaryBasicWage"/>
			      <TextInput skin="png.comp.textinput" x="61" y="8" width="143" height="26" var="originalBasicSalary"/>
			      <TextInput skin="png.comp.textinput" x="60" y="-34" width="143" height="26" var="workingTime"/>
			      <Button label="保存" skin="png.comp.button" x="62" y="190" width="59" height="27" var="addSalary"/>
			    </Box>
			    <Image skin="png.comp.blank_blue" x="-17" y="-337" width="72" height="3" var="imageTwo"/>
			    <Button label="调薪记录" x="-18" y="-355" width="70" height="19" var="payrollRecord"/>
			    <Button label="新增调薪" x="80" y="-355" width="58" height="19" var="addSalaryIncrease"/>
			  </Box>
			</View>;
		public function WageStatisticsUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}