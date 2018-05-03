package
{
   public var InputName:InputNameClass = new InputNameClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;

class InputNameClass extends Input
{
    
   
   private var tfRect:Rectangle;
   
   private var okRect:Rectangle;
   
   public var nameScene:NameScene;
   
   function InputNameClass()
   {
      this.tfRect = new Rectangle(85,85,70,15);
      this.okRect = new Rectangle(100,120,140,230);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.tfRect.containsPoint(_loc2_))
      {
         stage.focus = this.nameScene.tf;
         this.nameScene.tf.requestSoftKeyboard();
      }
      else if(this.okRect.containsPoint(_loc2_))
      {
         if(this.nameScene.tf.length != 0)
         {
            SharedManager.saveUserName(this.nameScene.tf.text);
            SceneManager.newScene(new SelectScene());
         }
      }
   }
   
   override protected function mouseUpEvent(param1:MouseEvent) : void
   {
   }
   
   override protected function mouseOutEvent(param1:MouseEvent) : void
   {
   }
}
