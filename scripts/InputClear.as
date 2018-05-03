package
{
   public var InputClear:InputClearClass = new InputClearClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.utils.escapeMultiByte;

class InputClearClass extends Input
{
    
   
   private var menuRect:Rectangle;
   
   private var retryRect:Rectangle;
   
   private var nextRect:Rectangle;
   
   private var tweetURL:String = "https://twitter.com/intent/tweet?text=";
   
   function InputClearClass()
   {
      this.menuRect = new Rectangle(98,141,44,44);
      this.retryRect = new Rectangle(144,141,44,44);
      this.nextRect = new Rectangle(190,141,44,44);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc3_:StageData = null;
      var _loc4_:* = null;
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.menuRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SelectScene());
      }
      else if(this.retryRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SetPuzzleScene(StageManager.getStage(-2)));
      }
      else if(this.nextRect.containsPoint(_loc2_))
      {
         _loc3_ = StageManager.getStage(-1);
         if(_loc3_ != null)
         {
            SceneManager.newScene(new SetPuzzleScene(_loc3_));
         }
         else
         {
            _loc4_ = "[FlashGame:ConcentoricHolic]    ";
            _loc4_ = _loc4_ + "Solved all puzzles!!";
            if(SharedManager.getPerfect())
            {
               _loc4_ = _loc4_ + "[PERFECT]";
            }
            _loc4_ = _loc4_ + "    http://www.logicalcell.net/concentricholic   #ConcentricHolic";
            navigateToURL(new URLRequest(this.tweetURL + escapeMultiByte(_loc4_)));
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
