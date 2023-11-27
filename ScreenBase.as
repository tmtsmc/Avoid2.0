package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;

	public class ScreenBase extends Sprite {
		protected var main:Main;
		protected var printf:Printf;
		protected var pause:Sprite;
		protected var sound:Soundf;
		
		public function ScreenBase(main:Main) {
			this.main = main;
			sound = new Soundf();
			printf = new Printf();
			this.addChild(printf);
			Mouse.show();
			Mouse.cursor = MouseCursor.ARROW;
		}
		
		public function update(e:Event):void {}
		
		// Call twice (not shure in-browser). 
		public function activate(e:Event):void {
			if (pause) {
				removeChild(pause);
				pause = null;
			}
		}
		
		// Call twice (not shure in-browser).
		public function deactivate(e:Event):void {
			if (!pause) {
				pause = new Sprite();
				pause.graphics.beginFill(0x000000, 0.5);
				pause.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
				pause.graphics.endFill();
				removeChild(printf);
				addChild(pause);
				addChild(printf);
			}
		}
		
		public function keyDown(e:KeyboardEvent):void {}
		
		public function keyUp(e:KeyboardEvent):void { }
		
		public function click(e:MouseEvent):void {}
	}
}