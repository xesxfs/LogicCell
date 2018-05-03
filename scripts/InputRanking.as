package
{
   public var InputRanking:InputRankingClass = new InputRankingClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;

class InputRankingClass extends Input
{
    
   
   private var nextRect:Rectangle;
   
   private var prevRect:Rectangle;
   
   private var menuRect:Rectangle;
   
   function InputRankingClass()
   {
      this.nextRect = new Rectangle(168,290,44,44);
      this.prevRect = new Rectangle(28,290,44,44);
      this.menuRect = new Rectangle(98,290,44,44);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.nextRect.containsPoint(_loc2_))
      {
         RankingScene(SceneManager.scene).nextSprite(1);
      }
      else if(this.prevRect.containsPoint(_loc2_))
      {
         RankingScene(SceneManager.scene).nextSprite(-1);
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
