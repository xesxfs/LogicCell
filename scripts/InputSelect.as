package
{
   public var InputSelect:InputSelectClass = new InputSelectClass();
}

import flash.geom.Rectangle;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.net.navigateToURL;
import flash.net.URLRequest;

class InputSelectClass extends Input
{
    
   
   private var puzzleRect:Rectangle;
   
   private var scoreRect:Rectangle;
   
   private var score30Rect:Rectangle;
   
   private var score1minRect:Rectangle;
   
   private var score1comboRect:Rectangle;
   
   private var statisticsRect:Rectangle;
   
   private var optionRect:Rectangle;
   
   private var androidRect:Rectangle;
   
   function InputSelectClass()
   {
      this.puzzleRect = new Rectangle(15,95,100,50);
      this.scoreRect = new Rectangle(125,95,100,50);
      this.score30Rect = new Rectangle(15,155,100,50);
      this.score1minRect = new Rectangle(125,155,100,50);
      this.score1comboRect = new Rectangle(15,215,100,50);
      this.statisticsRect = new Rectangle(15,275,100,50);
      this.optionRect = new Rectangle(125,275,100,50);
      this.androidRect = new Rectangle(125,215,100,50);
      super();
   }
   
   override protected function mouseDownEvent(param1:MouseEvent) : void
   {
      var _loc2_:Point = new Point(mouseX,mouseY);
      if(this.puzzleRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new PuzzleSelectScene());
      }
      else if(this.scoreRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SetScoreScene());
      }
      else if(this.score30Rect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SetScore30Scene());
      }
      else if(this.score1minRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SetScore1minScene());
      }
      else if(this.statisticsRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new RankingScene());
      }
      else if(this.optionRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new OptionScene());
      }
      else if(this.androidRect.containsPoint(_loc2_))
      {
         navigateToURL(new URLRequest("https://play.google.com/store/apps/details?id=air.air.ConcentricHolic"));
      }
      else if(this.score1comboRect.containsPoint(_loc2_))
      {
         SceneManager.newScene(new SetScore1comboScene());
      }
   }
   
   override protected function mouseUpEvent(param1:MouseEvent) : void
   {
   }
   
   override protected function mouseOutEvent(param1:MouseEvent) : void
   {
   }
}
