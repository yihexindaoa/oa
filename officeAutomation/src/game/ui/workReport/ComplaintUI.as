/**Created by the Morn,do not modify.*/
package game.ui.workReport {
	import morn.core.components.*;
	public class ComplaintUI extends View {
		protected static var uiXML:XML =
			<View width="734" height="432">
			  <Label text="发送" x="36" y="21" size="14"/>
			  <TextArea text="TextArea" skin="png.comp.textarea" x="93" y="16" width="164" height="27"/>
			  <Label text="投诉内容 ：" x="13" y="158" size="14"/>
			  <TextArea text="TextArea" skin="png.comp.textarea" x="93" y="59" width="604" height="220"/>
			  <Label text="上传附件 ：" x="21" y="309" size="14"/>
			  <Button label="点击上传附件" skin="png.comp.button" x="93" y="304" width="126" height="27"/>
			  <Button label="发送" skin="png.comp.button" x="322" y="353" width="69" height="31"/>
			</View>;
		public function ComplaintUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}