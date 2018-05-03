package
{
   public var InputManager:InputManagerClass = new InputManagerClass();
}

import flash.display.Sprite;

class InputManagerClass extends Sprite
{
    
   
   public var input:Input;
   
   function InputManagerClass()
   {
      super();
   }
   
   public function newInput(param1:Input) : void
   {
      removeChildren();
      this.input = param1;
      if(param1 != null)
      {
         addChild(param1);
      }
   }
}
