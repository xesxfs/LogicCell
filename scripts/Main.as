package
{
   import flash.display.Sprite;
   import flash.display.StageScaleMode;
   import flash.display.StageAlign;
   import flash.ui.Multitouch;
   import flash.ui.MultitouchInputMode;
   
   public class Main extends Sprite
   {
       
      
      public function Main()
      {
         super();
         stage.scaleMode = StageScaleMode.SHOW_ALL;
         stage.align = StageAlign.TOP_RIGHT;
         Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
         addChild(BackBitmap);
         addChild(new Game());
      }
   }
}
