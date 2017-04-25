package notice.vo.noticeList
{

	/**
	 * 通知告示统计表请求类
	 * @author QS
	 * 
	 */	
	public class NoticeListReq
	{
		/**是	int	当前页**/
		public var pageNum:int;
		/**
		 *	是	int	每页的数量 
		 */		
		public var pageSize:int;
		/**
		 *否	string	日期 
		 */		
		public var date	:String;
		/**
		 *否	string	关键字 
		 */		
		public var keyword:String;	
		
		
	}
}