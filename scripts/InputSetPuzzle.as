package
{
   public var InputSetPuzzle:InputSetPuzzleClass = new InputSetPuzzleClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;

class InputSetPuzzleClass extends Input
{
    
   
   private var mouseIndexX:int;
   
   private var mouseIndexY:int;
   
   public var field:Field;
   
   public var fieldRect:Rectangle;
   
   public var inventoryPadding:int;
   
   function InputSetPuzzleClass()
   {
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc2_:int = 0;
      if(this.field.matchingJob != null)
      {
         return;
      }
      if(mouseY < 240 || mouseY > 340)
      {
         return;
      }
      if(mouseY < 290)
      {
         _loc2_ = (mouseX - this.inventoryPadding) / 48;
         BlockManager.mouseDownInventory(_loc2_);
      }
      else if(mouseX > 50 && mouseX < 94)
      {
         BackMenuBitmap.updateStart();
      }
      else if(mouseX > 146 && mouseX < 190)
      {
         BlockManager.undo();
      }
   }
   
   override protected function mouseUpEvent(param1:MouseEvent) : void
   {
      var _loc2_:int = 0;
      var _loc3_:int = 0;
      BackMenuBitmap.updateFinish();
      if(BlockManager.mouseDownBlock == null)
      {
         return;
      }
      if(this.fieldRect.containsPoint(new Point(mouseX,mouseY)))
      {
         _loc2_ = (mouseX - this.field.x) / 45;
         _loc3_ = (mouseY - this.field.y) / 45;
         this.field.mouseUpField(_loc2_,_loc3_);
      }
      else
      {
         BlockManager.mouseUp();
      }
   }
   
   override protected function mouseOutEvent(param1:MouseEvent) : void
   {
      var _loc2_:int = 0;
      var _loc3_:int = 0;
      if(!param1.buttonDown)
      {
         return;
      }
      if(BlockManager.mouseDownBlock == null)
      {
         return;
      }
      if(this.fieldRect.containsPoint(new Point(mouseX,mouseY)))
      {
         _loc2_ = (mouseX - this.field.x) / 45;
         _loc3_ = (mouseY - this.field.y) / 45;
         this.field.mouseUpField(_loc2_,_loc3_);
      }
      else
      {
         BlockManager.mouseUp();
      }
   }
}
