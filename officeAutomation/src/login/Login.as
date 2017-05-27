package login
{
	import com.greensock.TweenLite;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	
	import game.ui.login.LoginUI;
	
	import navigation.Navigation;
	
	import trade.Trade;

	public class Login extends Trade
	{
		protected var _container:Sprite;
		protected var loginUI:LoginUI
		public function Login( container:Sprite  )
		{
			_container = container;
			initLogin();
			super.initPopu(container,loginUI);
			
		}
		
		protected function initLogin():void
		{
			createEffect();
			loginUI = new LoginUI();
			_container.addChild(loginUI);
			loginUI.x = 300;
			loginUI.y = 100;
//			loginUI.account.filters=[new BevelFilter()];
			loginUI.graphics.beginFill(0x66cccc,0.3);
			loginUI.graphics.drawRoundRect(0,0,600,400,50,50);
			loginUI.loginBtn.addEventListener(MouseEvent.CLICK, onClickHandler);
			/*loginUI.rotation=30;
			var lx:Number = loginUI.x;
			var ly:Number = loginUI.y;
			TweenLite.to(loginUI, 0.6,{y:200,onComplete:function():void{
				TweenLite.to(loginUI, 0.3,{rotation:-30,x:lx+300,y:ly+200,onComplete:function():void{
					TweenLite.to(loginUI, 0.2,{rotation:0,x:lx,y:ly});
					
				}});
				
			}});*/
			TweenLite.to(loginUI, 0.6,{y:200});
			/*[IF-FLASH-BEGIN]*/
			var myLSO:SharedObject = SharedObject.getLocal("foo");
			if(myLSO.data.myObj == undefined){ 
			}else{ 
				loginUI.account.text = myLSO.data.myObj.loginName; 
				loginUI.password.text = myLSO.data.myObj.password;
			}
			/*[IF-FLASH-END]*/ 
			/*[IF-SCRIPT-BEGIN]
			this.loginUI.account.text=getCookie("loginName");
			this.loginUI.password.text=getCookie("password");
			function getCookie(c_name)
			{
			var c_start,c_end;
			if (Browser.document.cookie&&Browser.document.cookie.length>0)
			  {
			  c_start=Browser.document.cookie.indexOf(c_name + "=")
			  if (c_start!=-1)
			    { 
			    c_start=c_start + c_name.length+1 
			    c_end=Browser.document.cookie.indexOf(";",c_start)
			    if (c_end==-1) c_end=Browser.document.cookie.length
			    return unescape(Browser.document.cookie.substring(c_start,c_end))
			    } 
			  }
			return ""
			}
			
			[IF-SCRIPT-END]*/ 
			
		}
		
		protected function onClickHandler(event:MouseEvent):void
		{
			/*[IF-FLASH-BEGIN]*/
			var myLSO:SharedObject = SharedObject.getLocal("foo");
			var myObj:Object = {}; 
			myObj.loginName = loginUI.account.text;
			myObj.password = loginUI.password.text; 
			myLSO.data.myObj = myObj; 
			/*[IF-FLASH-END]*/ 
			/*[IF-SCRIPT-BEGIN]
			setCookie("loginName",this.loginUI.account.text,5);
			setCookie("password",this.loginUI.password.text,5);
			function setCookie(c_name,value,expiredays)
			{
				var exdate=new Date()
				exdate.setDate(exdate.getDate()+expiredays)
			Browser.document.cookie=c_name+ "=" +escape(value)+
				((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
			}
			
			[IF-SCRIPT-END]*/ 
			send("login/userLogin",{"loginName":loginUI.account.text,"password":loginUI.password.text},function(data:Object):void{
				trace("登陆数据data=",data);
				if(data.status == 200){
					_container.removeChild(loginUI);
					loginUI = null;
					var nav:Navigation = new Navigation(_container, data.data[0].userName);
				}else{
					popu("登陆出错!");
				}
				
			},function(v:String):void{
				trace("=======",v);
				popu("登陆出错!");
			},"POST");
			
		}
		
		
		
		protected function createEffect():void
		{
			for(var i:int = 0;i<20;i++){
				var shape:Shape = new Shape(); 
				shape.graphics.beginFill(0xff0000,0.5);
				shape.graphics.drawCircle(0,0,i);
				shape.x = Math.random()*300+300;
				shape.y=Math.random()*300+300;
				_container.addChild(shape);
				var c:Number = Math.random();
				var err:Array = [1,-1];
				TweenLite.to(shape,1*c+1,{x:c*1000*err[Math.floor(Math.random()*2)]+200,y:(c*200+1000)*err[Math.floor(Math.random()*2)],onComplete:function():void{
					//TweenLite.to(shape, 1,{y:1000});
				
				}});
			}
		}
	}
}