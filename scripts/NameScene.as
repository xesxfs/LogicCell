package
{
   import flash.text.TextField;
   import flash.events.KeyboardEvent;
   import flash.display.Bitmap;
   
   public class NameScene extends Scene
   {
       
      
      public var tf:TextField;
      
      private var bmdTf:BitmapDisplay;
      
      public function NameScene()
      {
         super();
         var _loc3_:Bitmap = new Bitmap(new BitmapString("Enter Your Name"));
         _loc3_.y = 60;
         _loc3_.x = 120 - _loc3_.width / 2;
         addChild(_loc3_);
         this.bmdTf = new BitmapDisplay(70,15);
         this.bmdTf.drawBorderRect(0,0,70,15,1,4290493371,0);
         this.bmdTf.y = 85;
         this.bmdTf.x = 85;
         addChild(this.bmdTf);
         var _loc4_:Bitmap = new Bitmap(new BitmapString("OK"));
         _loc4_.y = 130;
         _loc4_.x = 120 - _loc4_.width / 2;
         addChild(_loc4_);
         this.tf = new TextField();
         this.tf.type = "input";
         this.tf.visible = false;
         this.tf.maxChars = 8;
         this.tf.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownEvent);
         this.tf.restrict = "a-zA-Z0-9";
         addChild(this.tf);
         InputName.nameScene = this;
         InputManager.newInput(InputName);
      }
      
      private function keyDownEvent(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 13)
         {
            SharedManager.saveUserName(this.tf.text);
            SceneManager.newScene(new SelectScene());
         }
      }
      
      override public function update() : void
      {
         if(stage.focus != this.tf)
         {
            stage.focus = this.tf;
         }
         this.bmdTf.clear();
         this.bmdTf.drawBorderRect(0,0,70,15,1,4290493371,0);
         if(this.tf.text != "")
         {
            this.bmdTf.drawString(this.tf.text);
         }
      }
   }
}
