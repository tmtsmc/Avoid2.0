package {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class BaseMenu extends Sprite {
		protected var main:Main;
		public var stageRef:Stage;
		public var loadNext:BaseMenu;
		
		public function BaseMenu(main:Main) {
			this.main = main;
		}
		
		public function unload(loadMe:BaseMenu = null) : void {
			if (loadMe != null)
				loadNext = loadMe;
			dispatchEvent(new Event("menuRemoved"));
			if (stageRef.contains(this))
				stageRef.removeChild(this);
			if (loadNext != null) 
				loadNext.load();
		}
		
		public function load() : void {
			addChild(this);
		}
	}
}
