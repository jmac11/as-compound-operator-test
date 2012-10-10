package
{
  import flash.display.Sprite;
  import flash.events.Event;

  [SWF(width="256", height="256", frameRate="30", backgroundColor="#3F3F3F")]
  public class CompoundTest
    extends Sprite
  {
    public function CompoundTest() {
      addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
      removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
      addCircle();
    }

    private function addCircle():void {
      addChild(new NumberedCircle()).x += 85;
    }
  }
}
