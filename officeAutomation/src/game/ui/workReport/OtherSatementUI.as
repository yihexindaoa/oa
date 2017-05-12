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
			  <List x="0" y="-1" spaceY="10" width="901" height="472" repeatY="10" var="table">
			    <Box name="render" width="867" height="15" x="0" y="0">
			      <Image skin="png.comp.blank" x="26" y="145" width="1" height="34"/>
			      <Image skin="png.comp.blank" x="138" y="145" width="1" height="34"/>
			      <Image skin="png.comp.blank" x="272" y="147" width="1" height="34"/>
			      <Image skin="png.comp.blank" x="402" y="144" width="1" height="34"/>
			      <Image skin="png.comp.blank" x="483" y="146" width="1" height="34"/>
			      <Image skin="png.comp.blank" x="595" y="145" width="1" height="34"/>
			      <Image skin="png.comp.blank" x="26" y="178" width="569" height="1"/>
			      <Label text="小雷" x="67" y="155" size="14" width="32" height="20" name="userName"/>
			      <Label text="2017/3/21日报" x="151" y="154" size="14" width="112" height="20" name="reportName"/>
			      <Label text="2017/3/21 21:21:00" x="273" y="154" size="14" name="sendTime" width="128" height="20"/>
			      <Label text="未读" x="427" y="154" size="14" name="readState"/>
			      <Label text="id" x="604" y="156" visible="false" width="14" height="19" name="id"/>
			      <Button label="详情" x="486" y="153" width="47" height="23" name="details" labelColors="0x0000ff, 0x32556b, 0x32"/>
			      <Button label="删除" x="550" y="155" labelColors="0x0000ff, 0x32556b, 0x32" name="delect"/>
			      <Label x="632" y="156" name="reportType" visible="false" width="0" height="0"/>
			      <Label text="label" x="725" y="158" name="noticeContent" visible="false"/>
			      <Label text="label" x="767" y="158" visible="false" name="weeklyContent"/>
			      <Label text="label" x="810" y="157" visible="false" name="monthlyContent"/>
			    </Box>
			  </List>
			  <Label text="他人工作报表统计" x="20" y="30" size="14"/>
			  <Image skin="png.comp.blank_blue" x="22" y="53" width="112" height="3"/>
			  <Label text="日期 ：" x="19" y="73" size="14"/>
			  <Image skin="png.comp.blank" x="26" y="117" width="570" height="1"/>
			  <Image skin="png.comp.blank" x="26" y="115" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="27" y="148" width="569" height="1"/>
			  <Image skin="png.comp.blank" x="595" y="118" width="1" height="31"/>
			  <Image skin="png.comp.blank" x="138" y="115" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="272" y="115" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="402" y="116" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="483" y="115" width="1" height="34"/>
			  <Image skin="png.comp.blank" x="595" y="116" width="1" height="34"/>
			  <Label text="姓名" x="66" y="124" size="14"/>
			  <Label text="报表名称" x="178" y="122" size="14"/>
			  <Label text="提交时间" x="302" y="124" size="14" width="60" height="20"/>
			  <Label text="状态" x="427" y="124" size="14"/>
			  <Label text="操作" x="524" y="125" size="14"/>
			  <TextInput skin="png.comp.textinput" x="301" y="70" width="246" height="27" var="queryTxt" toolTip="请输入姓名搜索"/>
			  <Image skin="png.comp.search_button" x="519" y="74" buttonMode="true" var="search"/>
			  <TextInput text="2017/4/29" skin="png.comp.textinput" x="70" y="71" width="67" height="22" var="dateBeginTxt" restrict="0-9/"/>
			  <Clip skin="png.comp.clip_timg" x="139" y="73" clipX="4" clipY="4" width="21" height="19" index="1" var="dateBeginBtn"/>
			  <TextInput text="2017/4/29" skin="png.comp.textinput" x="190" y="73" width="67" height="22" var="dateEndTxt"/>
			  <Clip skin="png.comp.clip_timg" x="259" y="73" clipX="4" clipY="4" width="21" height="19" index="1" var="dateEndBtn"/>
			  <Label text="至" x="167" y="72" size="14"/>
			</View>;
		public function OtherSatementUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}