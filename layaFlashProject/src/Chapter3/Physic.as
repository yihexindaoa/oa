package Chapter3
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Joints.b2DistanceJoint;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Physic extends Sprite
	{
		private var world:b2World; 
		private var worldScale:Number=30; 
		
		public function Physic()
		{
			world=new b2World(new b2Vec2(0,5),true); 
			debugDraw(); 
			/*for(var i:int = 0 ;i < 100; i++)
			{
				createShape(i+100,20, 20 * (i%2+0.2),20, null, 1);
			}*/
			var circle:b2Body = createShape(150,20, 50 ,20, "circle", 1);
			var joint:b2DistanceJointDef = new b2DistanceJointDef();
			joint.bodyA = circle
			joint.bodyB = createShape(30,20, 50 ,20, null, 1);
			var j:b2DistanceJoint = new b2DistanceJoint(joint);
//			joint.length = 2;
			joint.collideConnected = true;
			world.CreateJoint(joint);
			
			var joint1:b2DistanceJointDef = new b2DistanceJointDef();
			joint1.bodyA = circle;
			joint1.bodyB = createShape(280,20, 50 ,20, null, 1);
			world.CreateJoint(joint1);
			floor();
			addEventListener(Event.ENTER_FRAME,updateWorld); 
			Staged.staged.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			Staged.staged.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			Staged.staged.addEventListener(MouseEvent.MOUSE_MOVE, mouseMovehandler);
		}
		
		
		private var currentB2Body:b2Body;
		protected function mouseMovehandler(e:MouseEvent):void
		{
			
		}
		
		protected function mouseUpHandler(e:MouseEvent):void
		{
//			var pX:Number=mouseX/worldScale; 
//			var pY:Number=mouseY/worldScale; 
//			world.QueryPoint(queryCallback,new b2Vec2(pX,pY)); 
//			
			if(currentB2Body)
			{
				currentB2Body = null;
			}
		}
		
		protected function mouseDownHandler(e:MouseEvent):void
		{
			var pX:Number=mouseX/worldScale; 
			var pY:Number=mouseY/worldScale; 
			world.QueryPoint(queryCallback,new b2Vec2(pX,pY)); 
			
		}
		
		protected function updateWorld(event:Event):void
		{
			var radToDeg:Number=180/Math.PI; 
			world.Step(1/30,10,10); 
			world.ClearForces(); 
			world.DrawDebugData(); 
			for (var bb:b2Body = world.GetBodyList(); bb; bb = bb.GetNext()){
				if (bb.GetUserData() is Sprite){
					var sprite:Sprite = bb.GetUserData() as Sprite;
					sprite.x = bb.GetPosition().x * 30;
					sprite.y = bb.GetPosition().y * 30;
					sprite.rotation = bb.GetAngle() * (180/Math.PI);
				}
			}
			
			if(currentB2Body)
			{
				var pX:Number=mouseX/worldScale; 
				var pY:Number=mouseY/worldScale; 
				currentB2Body.SetPosition(new b2Vec2(pX, pY) );
				currentB2Body.SetType(b2Body.b2_dynamicBody);
			}
		}
		
		private function createShape(pX:int,pY:int,w:Number,h:Number = 0,s:Object = null,types:int = 0):b2Body { 
			var bodyDef:b2BodyDef=new b2BodyDef(); 
			bodyDef.position.Set(pX/worldScale,pY/worldScale); 
			bodyDef.type=b2Body.b2_dynamicBody; 
			bodyDef.userData=s; 
			var polygonShape:b2Shape//:b2PolygonShape=new b2PolygonShape(); 
			switch(types)
			{
				case 0:
					polygonShape =new b2PolygonShape(); 
					(polygonShape as b2PolygonShape).SetAsBox(w/2/worldScale,h/2/worldScale); 
					break;
				case 1:
					polygonShape = new b2CircleShape(w/2/worldScale);
					
					break;
				default:
					break;
			}
			
			var fixtureDef:b2FixtureDef=new b2FixtureDef(); 
			fixtureDef.shape=polygonShape; 
			fixtureDef.density=2; 
			fixtureDef.restitution=0.4; 
			fixtureDef.friction=0.5; 
			var theBrick:b2Body=world.CreateBody(bodyDef); 
			theBrick.CreateFixture(fixtureDef); 
			return theBrick;
		}
		
		private function floor():void { 
			var bodyDef:b2BodyDef=new b2BodyDef(); 
			bodyDef.position.Set(320/worldScale,465/worldScale); 
			var polygonShape:b2PolygonShape=new b2PolygonShape(); 
			polygonShape.SetAsBox(320/worldScale,15/worldScale); 
			var fixtureDef:b2FixtureDef=new b2FixtureDef(); 
			fixtureDef.shape=polygonShape; 
			fixtureDef.restitution=0.4; 
			fixtureDef.friction=0.5; 
			var theFloor:b2Body=world.CreateBody(bodyDef); 
			theFloor.CreateFixture(fixtureDef); 
//			theFloor.SetAngle(Math.PI / 10);
		} 
		
		private function debugDraw():void {
			var debugDraw:b2DebugDraw=new b2DebugDraw();
			var debugSprite:Sprite=new Sprite();
			addChild(debugSprite);
			debugDraw.SetSprite(debugSprite);
			debugDraw.SetDrawScale(worldScale);
			debugDraw.SetFlags(b2DebugDraw.e_shapeBit);
			debugDraw.SetFillAlpha(0.5);
			world.SetDebugDraw(debugDraw);
		}
		
		
		private function queryCallback(fixture:b2Fixture):Boolean { 
			var touchedBody:b2Body=fixture.GetBody(); 
//			var userData:Sprite=touchedBody.GetUserData(); 
			var userData:String = touchedBody.GetUserData();
			if (userData=="circle") { 
//				world.DestroyBody(touchedBody); 
//				userData.visible=false;
				currentB2Body = touchedBody;
			} 
			return false; 
		} 
		
		
		
	}
}