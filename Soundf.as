package {
	import flash.media.SoundChannel;
	import flash.media.Sound;

	public class Soundf {
		//[Embed(source = "assets/TitleTheme.mp3")] 
		private var titleTheme:Class;
		private var length:Number;
		private var soundChannel:SoundChannel
		private var titleThemeSound:Sound;
		
		public function Soundf() {
			soundChannel = new SoundChannel();
			//titleThemeSound = new titleTheme as Sound;
		}
		
		public function isTerminate():Boolean {
			return (int(soundChannel.position / 100) >= int(length / 100));
		}
		
		public function playTitle():void {
			length = titleThemeSound.length;
			soundChannel = titleThemeSound.play();
		}
		
		/*public function playNoise():void {
			soundChannel = timeNoise.play();
		}*/
		
		public function stop():void {
			soundChannel.stop();
		}
	}
}