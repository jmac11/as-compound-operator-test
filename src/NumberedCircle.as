package
{
  import flash.display.Sprite;
  import flash.display.Graphics;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFormatAlign;

  public class NumberedCircle
    extends Sprite
  {
    private static var NEXT_ID:uint = 0;

    private var id:String;

    public function NumberedCircle() {
      x = 85;
      y = 128;

      id = NEXT_ID.toString();
      ++NEXT_ID;

      var g:Graphics = graphics;

      g.lineStyle(5, 0xF0F0C0);
      g.beginFill(0x8F8F8F);
      g.drawCircle(0, 0, 32);
      g.endFill();

      var text:TextField = new TextField();
      var format:TextFormat = text.defaultTextFormat;

      format.font = "Arial";
      format.size = 24;
      format.bold = true;
      format.align = TextFormatAlign.CENTER;
      text.defaultTextFormat = format;

      text.textColor = 0xF0F0C0;
      text.text = id;
      text.width = 64;
      text.x = -text.width / 2;
      text.height = text.textHeight;
      text.y = -text.textHeight / 2;

      addChild(text);
    }
  }
}
