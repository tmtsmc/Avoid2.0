package {
	//import mochi.as3.MochiServices;
	//import mochi.as3.MochiScores;

	public class ScreenLeaderboard extends ScreenBase {
		
		public function ScreenLeaderboard(foo:Main) {
			super(foo);
			printf.text = "Wait a bit...";
			printf.textColor = 0xffffff;
			//MochiServices.connect("ecb9d3a21232e117", main);
			//MochiScores.showLeaderboard( { boardID:"40533a2117368b03", score: (main.getOptions().score * 10), onClose:function():void { main.setScreen(ScreenTitle) } } );
		}
	}
}