package
{
   public var InputOption:InputOptionClass = new InputOptionClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;

class InputOptionClass extends Input
{
    
   
   private var resetRect:Rectangle;
   
   private var soundRect:Rectangle;
   
   private var changeRect:Rectangle;
   
   private var menuRect:Rectangle;
   
   function InputOptionClass()
   {
      this.resetRect = new Rectangle(70,225,100,50);
      this.soundRect = new Rectangle(70,155,100,50);
      this.changeRect = new Rectangle(70,85,100,50);
      this.menuRect = new Rectangle(98,290,44,44);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.soundRect.containsPoint(_loc2_))
      {
         SharedManager.soundChange();
         OptionScene(SceneManager.scene).soundChange();
      }
      else if(this.changeRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new NameScene());
      }
      else if(this.resetRect.containsPoint(_loc2_))
      {
         DataResetBitmap.updateStart();
      }
      else if(this.menuRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SelectScene());
      }
   }
   
   override protected function mouseUpEvent(param1:MouseEvent) : void
   {
      DataResetBitmap.updateFinish();
   }
   
   override protected function mouseOutEvent(param1:MouseEvent) : void
   {
   }
}
