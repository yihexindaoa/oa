package authority
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import game.ui.role.InforUI;
	
	import trade.Trade;
	/**
	 * 员工信息
	 * @author QS
	 * 
	 */	
	public class Infor extends Trade
	{
		protected var _container:Sprite;
		protected var _infor:InforUI;
		public function Infor(container:Sprite)
		{
			_container = container;
			initInfor();
			super.initPopu(container,_infor);
		}
		
		private function initInfor():void
		{
			_infor = new InforUI();
			_container.addChild(_infor);
			_infor.x = 161;
			var shape:Shape = new Shape();
			_infor.panelTable.addChildAt(shape,0);
			shape.graphics.lineStyle(2,0x000000);
			shape.graphics.moveTo(0,0);
			shape.graphics.lineTo(0,150);
			shape.graphics.lineTo(2340,150);
			shape.graphics.lineTo(2340,0);
			shape.graphics.lineTo(0,0);
			shape.graphics.drawRect(0,0,70,158);
			shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(0,0,70,75);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(70,0,70,75);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(140,20,60,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(200,20,60,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(260,20,90,55);
//			//听说读写
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(350,20,120,20);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(350,40,30,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(380,40,30,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(410,40,30,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(440,40,30,35);
			//QQ
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(470,20,60,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(530,20,60,55);
			//工作邮箱
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(590,20,120,20);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(590,40,60,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(650,40,60,35);
			//紧急联系电话
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(710,20,95,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(805,20,105,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(910,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1010,20,60,55);
			//毕业院校
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1070,20,90,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1160,20,90,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1250,20,50,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1300,20,95,55);
			//出生年月
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1395,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1495,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1595,20,100,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1695,20,80,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1775,20,70,55);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1845,20,100,55);
			//生日信息
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1945,20,300,20);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1945,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2020,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2095,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2170,40,75,35);
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(2245,20,95,55);
			//私人信息
			//[IF-JS]shape.graphics.beginFill(0xff0000,0.5);
			shape.graphics.drawRect(1070,0,1270,20);
		}
	}
}