/**Created by the Morn,do not modify.*/
package game.ui.salary {
	import morn.core.components.*;
	public class NewSalaryUI extends View {
		public var outputExcelSample:Button = null;
		public var inputExcel:Button = null;
		public var findAllOutputExcel:Button = null;
		protected static var uiXML:XML =
			<View width="800" height="900">
			  <Button label="导出样本" skin="png.comp.button" x="98" y="40" width="82" height="23" var="outputExcelSample"/>
			  <Button label="批量导入" skin="png.comp.button" x="208" y="41" width="80" height="23" var="inputExcel"/>
			  <Label text="工资单年份" x="95" y="84" width="78" height="18"/>
			  <TextInput skin="png.comp.textinput" x="177" y="85" width="136" height="22"/>
			  <Label text="工资单年份" x="343" y="85" width="78" height="18"/>
			  <TextInput skin="png.comp.textinput" x="424" y="84" width="142" height="23"/>
			  <Label text="Excel文件" x="99" y="139" width="67" height="18"/>
			  <TextInput skin="png.comp.textinput" x="187" y="134" width="189" height="26"/>
			  <Button label="预览" skin="png.comp.button" x="388" y="136" width="38" height="23" var="findAllOutputExcel"/>
			</View>;
		public function NewSalaryUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}