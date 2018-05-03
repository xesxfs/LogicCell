package
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class Input extends Sprite
   {
       
      
      public function Input()
      {
         super();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,480,762);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseUpEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.mouseOutEvent);
      }
      
      protected function mouseDownEvent(param1:MouseEvent) : void
      {
      }
      
      protected function mouseUpEvent(param1:MouseEvent) : void
      {
      }
      
      protected function mouseOutEvent(param1:MouseEvent) : void
      {
      }
   }
}
