package
{
   import flash.geom.Rectangle;
   
   public class SetScore1minScene extends Scene
   {
      
      public static var cnt:int;
      
      public static var isFinish:Boolean = false;
       
      
      private var field:Field;
      
      private var hudManager:HudManagerScore1min;
      
      public var undoBmd:BitmapDisplay;
      
      public function SetScore1minScene()
      {
         var _loc1_:BitmapDisplay = null;
         super();
         Status.mode = 3;
         addChild(this.field = new Field(new StageData("0,0,ScoreAttack,3,3,111111111")));
         BlockManager.addRandomInventoryBlock(1);
         BlockManager.addRandomInventoryBlock(2);
         BlockManager.addRandomInventoryBlock(3);
         _loc1_ = new BitmapDisplay(22,22);
         _loc1_.copy(Resource.chip,22,220,22,22,0,0);
         _loc1_.setScale(2);
         _loc1_.alpha = 0.8;
         _loc1_.x = 98;
         _loc1_.y = 290;
         addChild(_loc1_);
         addChild(BlockManager);
         addChild(this.hudManager = new HudManagerScore1min());
         addChild(EffectManager);
         InputManager.newInput(null);
         addChild(BackMenuBitmap);
         BackMenuBitmap.menuRect = new Rectangle(98,290,44,44);
         addChild(new CountDownSprite());
      }
      
      override public function update() : void
      {
         if(cnt == 0)
         {
            InputSetScore.field = this.field;
            InputSetScore.fieldRect = new Rectangle(this.field.x,this.field.y,this.field.width,this.field.height);
            InputManager.newInput(InputSetScore);
         }
         if(!isFinish)
         {
            cnt++;
         }
         BlockManager.update();
         EffectManager.update();
         Status.update();
         BackMenuBitmap.update();
         this.hudManager.update();
         if(!isFinish && this.field.matchingJob == null && cnt >= 1800)
         {
            SetScore1minScene.isFinish = true;
            BlockManager.finish(SetScore1minScene);
         }
      }
   }
}
