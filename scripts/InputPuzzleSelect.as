package
{
   public var InputPuzzleSelect:InputPuzzleSelectClass = new InputPuzzleSelectClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;

class InputPuzzleSelectClass extends Input
{
    
   
   private var gridRect:Rectangle;
   
   private var menuRect:Rectangle;
   
   function InputPuzzleSelectClass()
   {
      this.gridRect = new Rectangle(5,50,230,230);
      this.menuRect = new Rectangle(98,290,44,44);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.gridRect.containsPoint(_loc2_))
      {
         _loc3_ = (mouseX - 5) / 48;
         _loc4_ = (mouseY - 50) / 48;
         if(_loc3_ + _loc4_ * 5 <= SharedManager.getPuzzleClearNum())
         {
            SceneManager.newScene(new SetPuzzleScene(StageManager.getStage(_loc3_ + _loc4_ * 5)));
         }
      }
      else if(this.menuRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SelectScene());
      }
   }
   
   override protected function mouseUpEvent(param1:MouseEvent) : void
   {
   }
   
   override protected function mouseOutEvent(param1:MouseEvent) : void
   {
   }
}
