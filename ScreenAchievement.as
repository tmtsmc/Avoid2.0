package {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	
	public class ScreenAchievement extends ScreenBase {
		private var backgroundGame:Sprite, backgroundAchievement:Sprite;
		private var stars:Array;
		private var bestScore:Number;
		private var mySound:MySound;
		private var best:TextField, great:TextField, excellent:TextField, awesome:TextField, fortyTwo:TextField;
		
		public function ScreenAchievement(main:Main, bestScore:Number = 0) {
			super(main);
			backgroundGame = new Sprite();
			backgroundAchievement = new Sprite();
			this.bestScore = bestScore;
			addChild(backgroundGame);
			stars = new Array();
			for (var i:int = 0; i < 100; i++) {
				stars.push(new Stars());
				addChild(stars[i]);
			}
 			backgroundGame.graphics.lineStyle(1,0x000000);
			backgroundGame.graphics.beginFill(0x112222);
			backgroundGame.graphics.drawRect(0, 0, 550, 400);
			backgroundGame.graphics.endFill();
			backgroundAchievement.graphics.lineStyle(1,0x000000);
			backgroundAchievement.graphics.beginFill(0x001111);
			backgroundAchievement.graphics.drawRect(90, 90, 300, 140);
			backgroundAchievement.graphics.endFill();
			addChild(backgroundAchievement);
			mySound = new MySound();
			mySound.playMusic();
			
			best = new TextField();
			great = new TextField();
			excellent = new TextField();
			awesome = new TextField();
			fortyTwo = new TextField();
			
			best.text = "Best : " + bestScore;
			great.text = "Great : over 1 000 points.";
			excellent.text = "Excellent : over 3 000 points.";
			awesome.text = "!!! AWESOME !!! : over 5 000 points. You're really good.";
			fortyTwo.text = "42 ! : there is 42 ennemies on the screen.";
			
			best.textColor = 0xffffff;
			great.textColor = 0xffffff;
			excellent.textColor = 0xffffff;
			awesome.textColor = 0xffffff;
			fortyTwo.textColor = 0xffffff;
			
			best.x = 100;
			great.x = 100;
			excellent.x = 100;
			awesome.x = 100;
			fortyTwo.x = 100;
			best.y = 100;
			great.y = 125;
			excellent.y = 150;
			awesome.y = 175;
			fortyTwo.y = 200;
			
			best.width = best.textWidth + 5;
			great.width = great.textWidth + 3;
			excellent.width = excellent.textWidth + 3;
			awesome.width = awesome.textWidth + 3;
			fortyTwo.width = fortyTwo.textWidth + 3;
			
			addChild(best);
			addChild(great);
			addChild(excellent);
			addChild(awesome);
			addChild(fortyTwo);
		}
		
		public override function keyUp(key:KeyboardEvent):void {
			mySound.playCoin();
			die();
			main.setScreen(ScreenTitle);
		}
		
		private function die():void {
			addChild(best);
			addChild(great);
			addChild(excellent);
			addChild(awesome);
			addChild(fortyTwo);
			best = null;
			great = null;
			excellent = null;
			awesome = null;
			fortyTwo = null;
			for (var i:uint = 0; i < stars.length; i++) {
				removeChild(stars[i]);
				stars[i].die();
				stars[i] = null;
			}
		}
	}
}
