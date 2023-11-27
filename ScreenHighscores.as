package {
	//import mochi.as3.MochiServices;
	//import mochi.as3.MochiScores;

	public class ScreenHighscores extends ScreenBase {
		
		public function ScreenHighscores(foo:Main) {
			super(foo);
			printf.text = "Wait a bit...";
			printf.textColor = 0xffffff;
			//MochiServices.connect("ecb9d3a21232e117", main);
			//MochiScores.showLeaderboard( { boardID:"40533a2117368b03", onClose:function():void { main.setScreen(ScreenTitle); } } );
		}
	}
}