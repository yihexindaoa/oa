/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class OtherSatementUI extends View {
		public var table:List = null;
		public var queryTxt:TextInput = null;
		public var search:Image = null;
		public var dateBeginTxt:TextInput = null;
		public var dateBeginBtn:Clip = null;
		public var dateEndTxt:TextInput = null;
		public var dateEndBtn:Clip = null;
		protected static var uiXML:XML =
			<View width="980" height="319">
			  <Image skin="png.comp.bg" x="-1" y="4" sizeGrid="50,50,10,10" width="979" height="904"/>
			  
			  
			  <Label text=" " height="32" align="center" size="15" width="569" background="true" backgroundColor="0x6699cc" x="58" y="134"/>
			  <Label text="他人工作报表统计" x="20" y="30" size="14"/>
			  <Image skin="png.comp.blank_blue" x="22" y="53" width="112" height="3"/>
			  <Label text="日期 ：" x="19" y="73" size="14"/>
			  <Image skin="png.comp.blank" x="58" y="135" width="570" height="1"/>
			  <Image skin="png.comp.blank" x="58" y="133" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="59" y="166" width="569" height="1"/>
			  <Image skin="png.comp.blank" x="627" y="136" width="1" height="31"/>
			  <Image skin="png.comp.blank" x="170" y="133" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="304" y="133" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="434" y="134" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="515" y="133" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="627" y="134" width="1" height="34"/>
			  <Label text="姓名" x="98" y="142" size="14"/>
			  <Label text="报表名称" x="210" y="140" size="14"/>
			  <Label text="提交时间" x="334" y="142" size="14" width="60" height="20"/>
			  <Label text="状态" x="459" y="142" size="14"/>
			  <Label text="操作" x="556" y="143" size="14"/>
			  <TextInput skin="png.comp.textinput" x="301" y="70" width="246" height="27" var="queryTxt" toolTip="请输入姓名搜索"/>
			  <Image skin="png.comp.search_button" x="519" y="74" buttonMode="true" var="search"/>
			  <TextInput text="2017/4/29" skin="png.comp.textinput" x="70" y="71" width="67" height="22" var="dateBeginTxt" restrict="0-9/"/>
			  <Clip skin="png.comp.clip_timg" x="139" y="73" clipX="4" clipY="4" width="21" height="19" index="1" var="dateBeginBtn"/>
			  <TextInput text="2017/4/29" skin="png.comp.textinput" x="190" y="73" width="67" height="22" var="dateEndTxt"/>
			  <Clip skin="png.comp.clip_timg" x="259" y="73" clipX="4" clipY="4" width="21" height="19" index="1" var="dateEndBtn"/>
			  <Label text="至" x="167" y="72" size="14"/>
<List x="178" y="168" spaceY="10" width="517" height="142" repeatX="1" repeatY="4" var="table">
				<Box name="render" width="726" height="27" x="-120" y="0" left="-120">
				  <Label text="label" x="-1" y="0" width="114" height="34" size="15" align="center" background="true" backgroundColor="0x6699cc" name="userName"/>
				  <Label text="label" x="114" y="0" height="34" align="center" size="15" width="133" background="true" backgroundColor="0x6699cc" name="reportName"/>
				  <Label x="377" y="0" height="34" align="center" size="15" width="79" background="true" backgroundColor="0x6699cc" name="readState"/>
				  <Label text=" " x="459" y="0" height="33" align="center" size="15" width="110" background="true" backgroundColor="0x6699cc"/>
				  <Label text=" " x="249" y="0" height="34" align="center" size="15" width="126" background="true" backgroundColor="0x6699cc" name="sendTime" isDate="true"/>
				  <Button label="详情" x="463" y="6" width="47" height="23" name="details" labelColors="0x0000ff, 0x32556b, 0x32" skin="png.comp.button"/>
				  <Button label="删除" x="516" y="6" labelColors="0x0000ff, 0x32556b, 0x32" name="delect" skin="png.comp.button" width="47" height="23"/>
				  <Label text="id" x="604" y="12" visible="false" width="14" height="19" name="id"/>
				  <Label x="632" y="156" name="reportType" visible="false" width="0" height="0"/>
				  <Label text="label" x="725" y="14" name="noticeContent" visible="false"/>
				  <Label text="label" x="767" y="14" visible="false" name="weeklyContent"/>
				  <Label text="label" x="810" y="13" visible="false" name="monthlyContent"/>
				</Box>
			  </List>
			</View>;
		public function OtherSatementUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}