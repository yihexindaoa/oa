package report
{
	import flash.display.Sprite;
	
	import game.ui.workReport.WorkReportStatisticsUI;
	
	import trade.Trade;
	/**
	 * 工作报表统计
	 * @author QS
	 * 
	 */	
	public class WorkReportStatistics extends Trade
	{
		protected var _container:Sprite;
		protected var _reportUI:WorkReportStatisticsUI;
		/**
		 * 工作报表统计
		 * @param container
		 * 
		 */		
		public function WorkReportStatistics(container:Sprite)
		{
			_container = container;
			initWork();
			super.initPopu(container,_reportUI);
		}
		
		/**
		 * 
		 * 
		 */		
		protected function initWork():void{
			_reportUI = new WorkReportStatisticsUI();
			_reportUI.x = 161;
			_container.addChild(_reportUI);
		}
	}
}