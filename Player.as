package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
 
	public class Player extends Sprite {
		private var speedMax:int = 5;
		private var speedX:int, speedY:int;
		private var rot:Number, rotMax:Number = 3;
		private var allowRotation:Boolean;
		
		public function Player(allowRotation:Boolean) {
 			graphics.lineStyle(1,0x000000);
			graphics.beginFill(0x0000ff);
			graphics.drawRect(-10, -10, 20, 20);
			graphics.endFill();
			x = 550 / 2;
			y = 400 / 2;
			rot = 0;
			this.allowRotation = allowRotation;
		}
		
		public function die():void {
			width -= 2;
			height -= 2;
			alpha -= 0.1;
		}
		
		public function moveUp():void {
			if (speedY - 1 >= -speedMax) speedY -= 1;
		}
		
		public function moveDown():void {
			if (speedY + 1 <= speedMax) speedY += 1;
		}
		
		public function moveRight():void {
			if (speedX + 1 <= speedMax) speedX += 1;
			if (rot + 0.5 <= rotMax) rot += 0.5;
		}
		
		public function moveLeft():void {
			if (speedX - 1 >= -speedMax) speedX -= 1;
			if (rot - 0.5 >= -rotMax) rot -= 0.5;
		}
		
		public function movePlayer():void {
			x += speedX;
			y += speedY;
			if (x < 10) {
				x = 10;
				speedX = -speedX;
			}
			if (x > 550 - 10) {
				x = 550 - 10;
				speedX = -speedX;
			}
			if (y < 10) {
				y = 10;
				speedY = -speedY;
			}
			if (y > 400 - 10) {
				y = 400 - 10;
				speedY = -speedY;
			}
			if (allowRotation) rotation += rot;
		}
		
		public function getX():int {
			return x;
		}
		
		public function getY():int {
			return y;
		}
		
		public function slowX():void {
			if (speedX < 0) speedX += 1;
			else if (speedX > 0) speedX -= 1;
		}
		
		public function slowY():void {
			if (speedY < 0) speedY += 1;
			else if (speedY > 0) speedY -= 1;
		}
	}
}
