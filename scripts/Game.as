package
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Game extends Sprite
   {
       
      
      public function Game()
      {
         super();
         addChild(SceneManager);
         SceneManager.newScene(new TitleScene());
         SceneManager.mouseChildren = false;
         SceneManager.mouseEnabled = false;
         addChild(LoadingManager);
         addChild(InputManager);
         addEventListener(Event.ENTER_FRAME,this.ent);
      }
      
      private function ent(param1:Event) : void
      {
         SceneManager.scene.update();
      }
   }
}
