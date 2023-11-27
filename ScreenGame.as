package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.text.TextField;
	
	public class ScreenGame extends ScreenBase {
		private var backgroundGame:Sprite;
		private var player:Player;
		private var ennemy:Array, stars:Array;
		private var clock:int, clockGameOver:int = 0;
		private var mySound:MySound;
		private var hud:HUD;
		private var best:Number;
		private var up:Boolean, down:Boolean, right:Boolean, left:Boolean, boolLoop:Boolean, gameOver:Boolean;
		private var gravity:Boolean, allowRotation:Boolean;
		private var textScore:Printf;
		
		public function ScreenGame(main:Main) {
			super(main);
			this.gravity = main.getOptions().gravity;
			this.allowRotation = main.getOptions().rotation;
			this.best = main.getOptions().score;
			backgroundGame = new Sprite();
			addChild(backgroundGame);
 			backgroundGame.graphics.lineStyle(1,0x000000);
			if (!gravity && !allowRotation) {
				backgroundGame.graphics.beginFill(0x111122);
			} else if (gravity && !allowRotation) {
				backgroundGame.graphics.beginFill(0x112211);
			} else {
				backgroundGame.graphics.beginFill(0x221111);
			}
			backgroundGame.graphics.drawRect(0, 0, 550, 400);
			backgroundGame.graphics.endFill();
			stars = new Array();
			for (var i:uint = 0; i < 100; i++) {
				stars.push(new Stars());
				addChild(stars[i]);
			}
			player = new Player(allowRotation);
			ennemy = new Array();
			hud = new HUD(this.best);
			textScore = new Printf();
			textScore.text = "Press Space to Submit your score."
			textScore.textColor = 0xffffff;
			textScore.size(15);
			textScore.setFormat();
			textScore.x = (Main.WIDTH - textScore.width) / 2;
			textScore.y = Main.HEIGHT - 80;
			mySound = new MySound();
			up = down = right = left = boolLoop = gameOver = false;
			addChild(hud);
			addChild(player);
			//addChild(textScore);
		}
		
		public override function update(e:Event) : void {
			if (boolLoop) {
				clock += 1;
				hud.display();
				if (up) {
					player.moveUp();
				}
				if (down) {
					player.moveDown();
				}
				if (right) {
					player.moveRight();
				}
				if (left) {
					player.moveLeft();
				}
				if (!gravity) {
					if (!up && !down) {
						player.slowY();
					}
					if (!left && !right) {
						player.slowX();
					}
				}
				player.movePlayer();
				for (i = 0; i < ennemy.length; i++) ennemy[i].update();
				if (clock % 3 == 0 && !gameOver) {
					hud.increaseScore(1);
				}
				if (clock % 30 == 0) {
					ennemy.push(new Ennemy(allowRotation));
					addChild(ennemy[ennemy.length - 1]);
				}
				if (clock % 250) {
					mySound.playMusic();
				}
				if (clock == 30000) {
					clock = 0;
				}
				for (var i:int = 0; i < ennemy.length; i++) {
					if ((ennemy[i].getX() > 550) || (ennemy[i].getX() < -20) || (ennemy[i].getY() < -20) || (ennemy[i].getY() > 400)) {
						removeChild(ennemy[i]);
						ennemy[i] = new Ennemy(allowRotation);
						addChild(ennemy[i]);
					}
					if (!gameOver) {
						if (player.hitTestObject(ennemy[i])) {
							gameOver = true;
						}
					}
				}
				if (gameOver) {
					if (clockGameOver == 0) {
						mySound.playHurt();
						
					}
					player.die();
					for (i = 0; i < ennemy.length; i++) {
						ennemy[i].die();	
					}
					if (clockGameOver >= 10) {
						for (i = 0; i < ennemy.length; i++) {
							removeChild(ennemy[i]);
							ennemy[i] = null;
						}
						removeChild(player);
						player = null;
						removeChild(backgroundGame);
						backgroundGame = null;
						if (main.getOptions().score < hud.getScore()) main.setOptions( { score:hud.getScore() } );
						main.setScore(hud.getScore());
						die();
						main.setScreen(ScreenGame);
					} else {
						clockGameOver++;
					}
				}
			}
		}
		
		public override function keyDown(key:KeyboardEvent):void {
			if (textScore) {
				//removeChild(textScore);
				textScore = null;
			}
			if (key.keyCode == 38) {
				up = true;
			} else if (key.keyCode == 40) {
				down = true;
			} else if (key.keyCode == 39) {
				right = true;
			} else if (key.keyCode == 37) {
				left = true;
			}
			boolLoop = true;
		}
		
		public override function keyUp(key:KeyboardEvent):void {
			if (key.keyCode == 38) {
				up = false;
			} else if (key.keyCode == 40) {
				down = false;
			} else if (key.keyCode == 39) {
				right = false;
			} else if (key.keyCode == 37) {
				left = false;
			} else if (key.keyCode == Keyboard.ESCAPE) {
				for (var i:uint = 0; i < ennemy.length; i++) {
					removeChild(ennemy[i]);
					ennemy[i] = null;
				}
				removeChild(hud);
				removeChild(player);
				hud = null;
				player = null;
				die();
				main.setScreen(ScreenTitle);
			}/* else if (key.keyCode == Keyboard.SPACE) {
				for (i = 0; i < ennemy.length; i++) {
					removeChild(ennemy[i]);
					ennemy[i] = null;
				}
				removeChild(hud);
				removeChild(player);
				hud = null;
				player = null;
				die();
				main.setScreen(ScreenLeaderboard);
			}*/
		}
		
		public function die():void {
			for (var i:uint = 0; i < stars.length; i++) {
				if (stars[i]) {
					removeChild(stars[i]);
					stars[i].die();
					stars[i] = null;
				}
			}
		}
	}
}
