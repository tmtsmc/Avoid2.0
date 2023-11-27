package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class HUD extends Sprite {
 		private var score:Number, best:Number;
		private var scoreText:TextField, bestText:TextField;
		private var fortyTwo:TextField, one:TextField, three:TextField, five:TextField;
		private var great:TextField, excellent:TextField, awesome:TextField;
		
		public function HUD(best:Number) {
			this.best = best;
			score = 0;
			
			scoreText = new TextField();
			bestText = new TextField();
			fortyTwo = new TextField();
			one = new TextField();
			three = new TextField();
			five = new TextField();
			great = new TextField();
			excellent = new TextField();
			awesome = new TextField();
			
			scoreText.text = "Score : " + score * 10;
			bestText.text = "Best : " + best * 10;
			fortyTwo.text = "42 !";
			one.text = "1 000";
			three.text = "3 000";
			five.text = "5 000  <3";
			great.text = "Great !";
			excellent.text = "Excellent !";
			awesome.text = "!!! AWESOME !!!";
			
			scoreText.x = 15;
			scoreText.y = 15;
			bestText.x = 15 ;
			bestText.y = 30 ;
			fortyTwo.x = (550 - fortyTwo.textWidth) / 2;
			fortyTwo.y = 50;
			one.x = (550 - one.textWidth) / 2;
			one.y = 30;
			three.x = (550 - three.textWidth) / 2;
			three.y = 30;
			five.x = (550 - five.textWidth) / 2;
			five.y = 30;
			great.x = (550 - great.textWidth) / 2;
			great.y = 50;
			excellent.x = (550 - excellent.textWidth) / 2;
			excellent.y = 50;
			awesome.x = (550 - awesome.textWidth) / 2;
			awesome.y = 50;
			
			scoreText.width = 200;
			scoreText.height = 50;
			bestText.width = 200;// 120 ;
			bestText.height = 50; //20
			
			scoreText.textColor = 0xffffff;
			bestText.textColor = 0xffffff;
			fortyTwo.textColor = 0xffffff;
			one.textColor = 0xffffff;
			three.textColor = 0xffffff;
			five.textColor = 0xffffff;
			great.textColor = 0xffffff;
			excellent.textColor = 0xffffff;
			awesome.textColor = 0xffffff;
			
			addChild(scoreText);
			addChild(bestText);
			addChild(fortyTwo);
			addChild(one);
			addChild(three);
			addChild(five);
			addChild(great);
			addChild(excellent);
			addChild(awesome);
			
			fortyTwo.visible = false;
			one.visible = false;
			three.visible = false;
			five.visible = false;
			great.visible = false;
			excellent.visible = false;
			awesome.visible = false;
		}
		
		public function increaseScore(add:Number):void {
			score += add;
			scoreText.text = "Score : " + score * 10;
		}
		
		public function getBest():Number {
			if (score > best) {
				return score;
			} else {
				return best;
			}
		}
		
		public function display():void {
			fortyTwo.visible = false;
			one.visible = false;
			three.visible = false;
			five.visible = false;
			great.visible = false;
			excellent.visible = false;
			awesome.visible = false;
			if (score >= 1000 && score <= 1500) {
				one.visible = true;
				great.visible = true;
			}
			if (score >= 3000 && score <= 3500) {
				three.visible = true;
				excellent.visible = true;
			}
			if (score >= 5000 && score <= 5500) {
				five.visible = true;
				awesome.visible = true;
			}
			if (score >= 4200 && score <= 4750) {
				fortyTwo.visible = true;
			}
		}
		
		public function getScore():Number {
			return score;
		}
	}
}
