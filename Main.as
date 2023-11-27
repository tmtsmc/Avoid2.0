package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public dynamic class Main extends MovieClip {
		//private var _mochiads_game_id:String = "ecb9d3a21232e117";
		public static const WIDTH:uint = 550;
		public static const HEIGHT:uint = 400;
		private var options:Object;
		private var screen:ScreenBase;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			options = new Object();
			options.score = 0;
			options.gravity = false;
			options.rotation = false;
			setScreen(ScreenTitle);
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(Event.ACTIVATE, activate);
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		public function setScreen(screen:Class):Sprite {
			if (this.screen != null) removeChild(this.screen);
			this.screen = new screen(this);
			addChild(this.screen);
			return this.screen;
		}
		
		public function setOptions(options:Object):void {
			var k:String;
            if (options) for (k in options) this.options[k] = options[k];
        }
		
		public function getOptions():Object {
			return options;
		}
		
		public function setScore(score:uint):void {
			this.score = score;
		}
		
		public function update(e:Event):void {
			screen.update(e);
		}
		
		public function activate(e:Event):void {
			screen.activate(e);
		}
		
		public function deactivate(e:Event):void {
			screen.deactivate(e);
		}
		
		public function keyDown(e:KeyboardEvent):void {
			screen.keyDown(e);
		}
		
		public function keyUp(e:KeyboardEvent):void {
			screen.keyUp(e);
		}
	}
}
