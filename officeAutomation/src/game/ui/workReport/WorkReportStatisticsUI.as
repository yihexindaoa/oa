/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class WorkReportStatisticsUI extends View {
		protected static var uiXML:XML =
			<View width="800" height="900">
			  <Image skin="png.comp.bg" x="0" y="0" width="800" height="900" sizeGrid="50,50,10,10"/>
			  <Label text="工作报表统计" x="9" y="6" bold="true" color="0x3366ff"/>
			  <Label text="报表类型：" x="108" y="103"/>
			  <ComboBox labels="日报,周报,月报" skin="png.comp.combobox" x="186" y="103" selectedIndex="0"/>
			  <Label text="日期：" x="335" y="103"/>
			  <ComboBox labels="2017,2018,2019,2020,2021,2022,2023,2024,2025" skin="png.comp.combobox" x="400" y="103" width="78" height="23" selectedIndex="0"/>
			  <Image skin="png.comp.blank" x="483" y="112" width="25" height="2"/>
			  <ComboBox labels="1,2,3,4,5,6,7,8,9,10,11,12" skin="png.comp.combobox" x="514" y="103" width="60" height="23" selectedIndex="0"/>
			  <Label text="    工作报表管理  2017年3月工作日报表统计" x="236" y="38" width="267" height="18" bold="true"/>
			</View>;
		public function WorkReportStatisticsUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}