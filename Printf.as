package {
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;

	public class Printf extends TextField {
		protected var format:TextFormat;
		
		public function Printf(text:String = "") {
			this.text = text;
			format = new TextFormat();
			this.selectable = false;
			this.autoSize = TextFieldAutoSize.LEFT;
		}
		
		public function size(size:int):void {
			format.size = size;
		}
		
		public function setFormat():void {
			setTextFormat(format);
		}
	}
}