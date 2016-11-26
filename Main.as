package 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import fl.motion.MotionEvent;

	public class Main extends MovieClip 
	{
		private var mytimer: Timer;
		private var time: int;
		private var i: int;
		private var speed: Array;
		private var rect: Rectangle;

		public function Main() 
		{
			init();
		}

		private function init(): void 
		{
			sp1.x = 30;
			sp1.y = 25;

			sp2.x = 390;
			sp2.y = 25;

			sp3.x = 30;
			sp3.y = 345;

			sp4.x = 270;
			sp4.y = 420;

			mc.x = 220;
			mc.y = 200;

			i = 0;
			time = 0;
            rect = new Rectangle(10,10,410,410);
			speed = [4, 3, -4, 2, 3, -2, -4, 3];
			mytimer = new Timer(10);
			mytimer.addEventListener(TimerEvent.TIMER, mathtime);
			mc.addEventListener(MouseEvent.MOUSE_DOWN,spfol);
			mc.addEventListener(MouseEvent.MOUSE_UP,spstop);
		}
		
		private function mathtime(event:TimerEvent):void
		{
			time+= 10;
		}
		
		private function spfol(event:MouseEvent):void
		{
			mc.startDrag(false,rect);
			mytimer.start();
			sp1.addEventListener(Event.ENTER_FRAME,sp1move);
			sp2.addEventListener(Event.ENTER_FRAME,sp2move);
			sp3.addEventListener(Event.ENTER_FRAME,sp3move);
			sp4.addEventListener(Event.ENTER_FRAME,sp4move);
		}
		private function spstop(event:MouseEvent):void
		{
			mc.stopDrag();
		}
		
		private function sp1move(event:Event):void
		{
			sp1.x +=  speed[0];
			sp1.y +=  speed[1];
			if (sp1.x > 353)
			{
				speed[0] =  -  speed[0];
				speed[0] -=  i;
			}
			if (sp1.x < 12)
			{
				speed[0] =  -  speed[0];
				speed[0] +=  i;
			}
			if (sp1.y > 414)
			{
				speed[1] =  -  speed[1];
				speed[1] -=  i;
			}
			if (sp1.y < 12)
			{
				speed[1] =  -  speed[1];
				speed[1] +=  i;
			}
			if (sp1.hitTestObject(mc))
			{
				gameOver();
			}
		}

		private function sp2move(event:Event):void
		{
			sp2.x +=  speed[2];
			sp2.y +=  speed[3];
			if (sp2.x > 407)
			{
				speed[2] =  -  speed[2];
				speed[2] -=  i;
			}
			if (sp2.x < 12)
			{
				speed[2] =  -  speed[2];
				speed[2] +=  i;
			}
			if (sp2.y > 407)
			{
				speed[3] =  -  speed[3];
				speed[3] -=  i;
			}
			if (sp2.y < 12)
			{
				speed[3] =  -  speed[3];
				speed[3] +=  i;
			}
			if (sp2.hitTestObject(mc))
			{
				gameOver();
			}
		}

		private function sp3move(event:Event):void
		{
			sp3.x +=  speed[4];
			sp3.y +=  speed[5];
			if (sp3.x > 427)
			{
				speed[4] =  -  speed[4];
				speed[4] -=  i;
			}
			if (sp3.x < 12)
			{
				speed[4] =  -  speed[4];
				speed[4] +=  i;
			}
			if (sp3.y > 362)
			{
				speed[5] =  -  speed[5];
				speed[5] -=  i;
			}
			if (sp3.y < 12)
			{
				speed[5] =  -  speed[5];
				speed[5] +=  i;
			}
			if (sp3.hitTestObject(mc))
			{
				gameOver();
			}
		}

		private function sp4move(event:Event):void
		{
			sp4.x +=  speed[6];
			sp4.y +=  speed[7];
			if (sp4.x > 287)
			{
				speed[6] =  -  speed[6];
				speed[6] -=  i;
			}
			if (sp4.x < 12)
			{
				speed[6] =  -  speed[6];
				speed[6] +=  i;
			}
			if (sp4.y > 437)
			{
				speed[7] =  -  speed[7];
				speed[7] -=  i;
			}
			if (sp4.y < 12)
			{
				speed[7] =  -  speed[7];
				speed[7] +=  i;
			}
			if (sp4.hitTestObject(mc))
			{
				gameOver();
			}
		}
		
		private function gameOver():void
		{
			mytimer.stop();
			mc.removeEventListener(MouseEvent.MOUSE_DOWN,spfol);
			mc.stopDrag();
			sp1.removeEventListener(Event.ENTER_FRAME,sp1move);
			sp2.removeEventListener(Event.ENTER_FRAME,sp2move);
			sp3.removeEventListener(Event.ENTER_FRAME,sp3move);
			sp4.removeEventListener(Event.ENTER_FRAME,sp4move);
			
			mcOver.x=10;
			mcOver.txt.text=Number(time/1000)+"秒";
			mcOver.btnBack.addEventListener(MouseEvent.CLICK,gameAgain);
		}
		
		function gameAgain(event:MouseEvent):void
		{
			mcOver.x=520;
			init();
		}

		
	}
}