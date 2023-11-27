package {
	import flash.text.TextFormat;
	//import mochi.as3.MochiAd;
	
	public class ScreenPreloader extends ScreenBase {
		private var format:TextFormat;
		
		public function ScreenPreloader(foo:Main) {
			super(foo);
			/*MochiAd.showPreGameAd( { id:"ecb9d3a21232e117",
			res:"550x400",
			clip:main,
			ad_finished:function():void { main.setScreen(ScreenTitle); } } );*/
			printf.text = "Loading...";
			printf.width = 150;
			printf.textColor = 0xFFFFFF;
			format = new TextFormat();
			format.size = 25;
			printf.setTextFormat(format);
			printf.x = (Main.WIDTH - printf.textWidth) / 2;
			printf.y = Main.HEIGHT - 35;
			main.setScreen(ScreenTitle);
		}
	}
}