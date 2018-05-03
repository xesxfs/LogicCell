package
{
   public var InputFinish:InputFinishClass = new InputFinishClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.utils.escapeMultiByte;

class InputFinishClass extends Input
{
    
   
   private var menuRect:Rectangle;
   
   private var retryRect:Rectangle;
   
   private var tweetRect:Rectangle;
   
   private var tweetURL:String = "https://twitter.com/intent/tweet?text=";
   
   public var retryScene:Class;
   
   function InputFinishClass()
   {
      this.menuRect = new Rectangle(98,141,44,44);
      this.retryRect = new Rectangle(144,141,44,44);
      this.tweetRect = new Rectangle(190,141,44,44);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc3_:* = null;
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.menuRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SelectScene());
      }
      else if(this.retryRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new this.retryScene());
      }
      else if(this.tweetRect.containsPoint(_loc2_))
      {
         _loc3_ = "[FlashGame:ConcentricHolic]    ";
         _loc3_ = _loc3_ + ("Score : " + Status.score);
         switch(Status.mode)
         {
            case 1:
               _loc3_ = _loc3_ + " [Score]";
               break;
            case 2:
               _loc3_ = _loc3_ + " [30Mode]";
               break;
            case 3:
               _loc3_ = _loc3_ + " [1minMode]";
               break;
            case 4:
               _loc3_ = _loc3_ + " [1comboMode]";
         }
         _loc3_ = _loc3_ + ("  MaxCombo : " + Status.maxCombo);
         _loc3_ = _loc3_ + "    http://www.logicalcell.net/concentricholic   #ConcentricHolic";
         navigateToURL(new URLRequest(this.tweetURL + escapeMultiByte(_loc3_)));
      }
   }
   
   override protected function mouseUpEvent(param1:MouseEvent) : void
   {
   }
   
   override protected function mouseOutEvent(param1:MouseEvent) : void
   {
   }
}
