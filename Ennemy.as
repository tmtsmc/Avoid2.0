package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Ennemy extends Sprite {
		private var allowRotation:Boolean;
		private var speed:int = 3, speedX:int, speedY:int;
		private var rot:Number;
		
		public function Ennemy(allowRotation:Boolean) {
			if (Math.random() < 0.5) {
				(Math.random() < 0.5) ? x = -15 : x = 550;
				y = int(Math.random() * 400);
				(x == -15) ? speedX = speed : speedX = -speed;
				speedY = 0;
			} else {
				x = int(Math.random() * 550);
				(Math.random() < 0.5) ? y = -15 : y = 400;
				speedX = 0;
				(y == -15) ? speedY = speed : speedY = -speed;
			}
			rot = Math.random() * 3;
			this.allowRotation = allowRotation;
			graphics.lineStyle(1,0x000000);
			graphics.beginFill(0xff0000);
			graphics.drawRect(-10, -10, 20, 20);
			graphics.endFill();
		}
		
		public function die():void {
			width -= 2;
			height -= 2;
			alpha -= 0.1;    
		}
		
		public function loop():void {
			x += speedX;
			y += speedY;
			if (allowRotation) rotation += rot;
		}
		
		public function update():void {
			x += speedX;
			y += speedY;
			if (allowRotation) rotation += rot;
		}
		
		public function getX():int {
			return x;
		}
		
		public function getY():int {
			return y;
		}
		
		public function nowRotation():void {
			allowRotation = true;
		}
	}
}
