package
{
   public var SceneManager:SceneManagerClass = new SceneManagerClass();
}

import flash.display.Sprite;
import net.kawa.tween.easing.Linear;

class SceneManagerClass extends Sprite
{
    
   
   public var scene:Scene;
   
   private var nextScene:Scene;
   
   function SceneManagerClass()
   {
      super();
   }
   
   public function newScene(param1:Scene) : void
   {
      this.nextScene = param1;
      if(this.scene != null)
      {
         KTW.to(this.scene,0.3,{"alpha":0},Linear.easeOut,this.next);
      }
      else
      {
         this.next();
      }
   }
   
   public function next() : void
   {
      var _loc1_:int = 0;
      removeChildren();
      this.scene = null;
      this.scene = this.nextScene;
      if(this.scene is SetPuzzleScene)
      {
         _loc1_ = 0;
      }
      else if(this.scene is SetScoreScene)
      {
         _loc1_ = 1;
      }
      else if(this.scene is SetScore30Scene)
      {
         SetScore30Scene.cnt = 30;
         SetScore30Scene.isFinish = false;
         _loc1_ = 2;
      }
      else if(this.scene is SetScore1minScene)
      {
         SetScore1minScene.cnt = -95;
         SetScore1minScene.isFinish = false;
         _loc1_ = 3;
      }
      else if(this.scene is SetScore1comboScene)
      {
         SetScore1comboScene.isFinish = false;
         _loc1_ = 4;
      }
      Status.reset(_loc1_);
      this.nextScene.alpha = 0;
      KTW.to(this.nextScene,0.3,{"alpha":1},Linear.easeOut,null,0.2);
      addChild(this.scene);
   }
}
