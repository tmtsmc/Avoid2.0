package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.sampler.Sample;
	
	public class MySound {
		private var music:Number;
		private var coin:Sound, hurt:Sound;
		[Embed (source = "sons/note11.mp3")] private var note11:Class;
		[Embed (source = "sons/note21.mp3")] private var note21:Class;
		[Embed (source = "sons/note31.mp3")] private var note31:Class;
		[Embed (source = "sons/note41.mp3")] private var note41:Class;
		[Embed (source = "sons/note51.mp3")] private var note51:Class;
		private var note1:Sound = new note11() as Sound;
		private var note2:Sound = new note21();
		private var note3:Sound = new note31();
		private var note4:Sound = new note41();
		private var note5:Sound = new note51();
		private var chanel:SoundChannel;
		
		public function MySound() {
			chanel = new SoundChannel();
			coin = new Sound();
			hurt = new Sound();
		}
		
		public function playHurt():void {
		}

		public function playCoin():void {
		}
		
		public function playMusic():void {
			music = Math.random();
			if (music < 0.2) {
				chanel = note1.play();
			} else if (music < 0.4) {
				chanel = note2.play();
			} else if (music < 0.6) {
				chanel = note3.play();
			} else if (music < 0.8) {
				chanel = note4.play();
			} else {
				chanel = note5.play();
			}
		}
	}
}
