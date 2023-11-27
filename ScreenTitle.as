package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class ScreenTitle extends ScreenBase {
		private var tinyWorldText:TextField, blog:TextField, catchPhrase:TextField, pressSpace:TextField;
		private var classic:TextField, gravity:TextField, rotate:TextField, achievement:TextField;
		private var myFormat:TextFormat, mySuperFormat:TextFormat;
		private var stars:Array;
		private var mySound:MySound;
		private var clock:int = 0, position:int = 1;
		private var best:Number;
		
		public function ScreenTitle(main:Main, best:Number = 0) {
			super(main);
			this.best = best;
			stars = new Array();
			for (var i:int = 0; i < 100; i++) {
				stars.push(new Stars());
				addChild(stars[i]);
			}
			
			myFormat = new TextFormat();
			myFormat.align = TextFormatAlign.CENTER;
			myFormat.size = 30;
			
			pressSpace = new TextField();
			tinyWorldText = new TextField();
			blog = new TextField();
			catchPhrase = new TextField();
			classic = new TextField();
			gravity = new TextField();
			rotate = new TextField();
			achievement = new TextField();
			
			pressSpace.defaultTextFormat = myFormat;
			
			pressSpace.x = 0;
			pressSpace.y = 150;
			tinyWorldText.x = 15;
			tinyWorldText.y = 400 - 30;
			blog.x = 550 - 125;
			blog.y = 400 - 30;
			catchPhrase.x = 215;
			catchPhrase.y = 300;
			classic.x = 90;
			classic.y = 250;
			gravity.x = 190;
			gravity.y = 250;
			rotate.x = 300;
			rotate.y = 250;
			achievement.x = 400;
			achievement.y = 250;
			
			pressSpace.width = 550;
			pressSpace.height = 50;
			tinyWorldText.width = 120;
			tinyWorldText.height = 50;
			blog.width = 120;// 120 ;
			blog.height = 50; //20
			catchPhrase.width = 120;
			classic.width = 80;
			gravity.width = 80;
			rotate.width = 80;
			achievement.width = 80
			
			pressSpace.text = "Press Space !";
			tinyWorldText.text = "Tiny World !";
			blog.text = "Matttmtsmc - Bullshit";
			catchPhrase.text = "Too tiny for everyone !";
			classic.text = "Classic";
			gravity.text = "0 Gravity";
			rotate.text = "Rotation";
			achievement.text = "Achievements";
			
			pressSpace.antiAliasType = AntiAliasType.ADVANCED;
			tinyWorldText.antiAliasType = AntiAliasType.ADVANCED;
			blog.antiAliasType = AntiAliasType.ADVANCED;
			catchPhrase.antiAliasType = AntiAliasType.ADVANCED;
			classic.antiAliasType = AntiAliasType.ADVANCED;
			gravity.antiAliasType = AntiAliasType.ADVANCED;
			rotate.antiAliasType = AntiAliasType.ADVANCED;
			achievement.antiAliasType = AntiAliasType.ADVANCED;
			
			pressSpace.textColor = 0xffffff;
			tinyWorldText.textColor = 0xffffff;
			blog.textColor = 0xffffff;
			catchPhrase.textColor = 0xffffff;
			classic.textColor = 0x00ffff;
			gravity.textColor = 0xffffff;
			rotate.textColor = 0xffffff;
			achievement.textColor = 0xffffff;
			
			mySound = new MySound();
			mySound.playMusic();
			
			addChild(pressSpace);
			addChild(tinyWorldText);
			//addChild(blog);
			addChild(catchPhrase);
			addChild(classic);
			addChild(gravity);
			addChild(rotate);
			addChild(achievement);
		}
		
		public override function update(e:Event):void {
			clock++;
			if (clock % 250) {
				mySound.playMusic();
			}
		}
		
		public override function keyUp(key:KeyboardEvent):void {
			mySound.playCoin();
			if (key.keyCode == 37) {
				if (position - 1 == 0) {
					position = 6;
				} else {
					position -= 1;
				}
			}
			if (key.keyCode == 39) {
				if (position + 1 == 7) {
					position = 1;
				} else {
					position += 1;
				}
			}
			if (position == 1) {
				classic.textColor = 0x00ffff;
				gravity.textColor = 0xffffff;
				rotate.textColor = 0xffffff;
				achievement.textColor = 0xffffff;
				tinyWorldText.textColor = 0xffffff;
				blog.textColor = 0xffffff;
			} else if (position == 2) {
				classic.textColor = 0xffffff;
				gravity.textColor = 0x00ffff;
				rotate.textColor = 0xffffff;
				achievement.textColor = 0xffffff;
				tinyWorldText.textColor = 0xffffff;
				blog.textColor = 0xffffff;
			} else if (position == 3) {
				classic.textColor = 0xffffff;
				gravity.textColor = 0xffffff;
				rotate.textColor = 0x00ffff;
				achievement.textColor = 0xffffff;
				tinyWorldText.textColor = 0xffffff;
				blog.textColor = 0xffffff;
			} else if (position == 4) {
				classic.textColor = 0xffffff;
				gravity.textColor = 0xffffff;
				rotate.textColor = 0xffffff;
				achievement.textColor = 0x00ffff;
				tinyWorldText.textColor = 0xffffff;
				blog.textColor = 0xffffff;
			} else if (position == 5) {
				classic.textColor = 0xffffff;
				gravity.textColor = 0xffffff;
				rotate.textColor = 0xffffff;
				achievement.textColor = 0xffffff;
				tinyWorldText.textColor = 0x00ffff;
				blog.textColor = 0xffffff;
			} else {
				classic.textColor = 0xffffff;
				gravity.textColor = 0xffffff;
				rotate.textColor = 0xffffff;
				achievement.textColor = 0xffffff;
				tinyWorldText.textColor = 0xffffff;
				blog.textColor = 0x00ffff;
			}
			if (key.keyCode == 32) {
				if (position == 1) {
					die();
					main.setOptions( { gravity:false, rotation:false } );
					main.setScreen(ScreenGame);
				} else if (position == 2) {
					die();
					main.setOptions( { gravity:true, rotation:false } );
					main.setScreen(ScreenGame);
				} else if (position == 3) {
					die();
					main.setOptions( { gravity:true, rotation:true } );
					main.setScreen(ScreenGame);
				} else if (position == 4) {
					die();
					main.setScreen(ScreenAchievement);
				} else if (position == 5) {
					for (var i:int = 0; i < 100; i++) {
						stars.push(new Stars());
						addChild(stars[stars.length - 1]);
					}
				} else {
					//navigateToURL(new URLRequest("http://www.tmtsmc.comze.com"));
				}
			}
		}
		
		private function die():void {
			for (var i:uint = 0; i < stars.length; i++) {
				removeChild(stars[i]);
				stars[i].die();
				stars[i] = null;
			}
			removeChild(pressSpace);
			removeChild(tinyWorldText);
			//removeChild(blog);
			removeChild(catchPhrase);
			removeChild(classic);
			removeChild(gravity);
			removeChild(rotate);
			removeChild(achievement);
			pressSpace = null;
			tinyWorldText = null;
			blog = null;
			catchPhrase = null;
			classic = null;
			gravity = null;
			rotate = null;
			achievement = null;
		}
	}
}
