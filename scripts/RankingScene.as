package
{
   public class RankingScene extends Scene
   {
       
      
      private var index:int = 1;
      
      private var rankingSprite:RankingSprite;
      
      private var inited:Boolean = false;
      
      public function RankingScene()
      {
         var _loc2_:BitmapDisplay = null;
         var _loc3_:BitmapDisplay = null;
         var _loc4_:BitmapDisplay = null;
         super();
         DbManager.getRanking();
         InputManager.newInput(InputRanking);
         _loc2_ = new BitmapDisplay(22,22);
         _loc2_.copy(Resource.chip,22,220,22,22,0,0);
         _loc2_.setScale(2);
         _loc2_.alpha = 0.8;
         _loc2_.x = 98;
         _loc2_.y = 290;
         addChild(_loc2_);
         _loc3_ = new BitmapDisplay(22,22);
         _loc3_.copy(Resource.chip,66,220,22,22,0,0);
         _loc3_.setScale(2);
         _loc3_.alpha = 0.8;
         _loc3_.x = 168;
         _loc3_.y = 290;
         addChild(_loc3_);
         _loc4_ = new BitmapDisplay(22,22);
         _loc4_.copy(Resource.chip,44,220,22,22,0,0);
         _loc4_.setScale(2);
         _loc4_.alpha = 0.8;
         _loc4_.x = 28;
         _loc4_.y = 290;
         addChild(_loc4_);
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         if(!LoadingManager.isLoading && !this.inited)
         {
            this.inited = true;
            _loc1_ = DbManager.vecScoreRanking.length;
            addChild(this.rankingSprite = new RankingSprite(this.index));
         }
      }
      
      public function nextSprite(param1:int) : void
      {
         this.index = this.index + param1;
         if(this.index > 4)
         {
            this.index = this.index - 4;
         }
         else if(this.index < 1)
         {
            this.index = this.index + 4;
         }
         removeChild(this.rankingSprite);
         addChild(this.rankingSprite = new RankingSprite(this.index));
      }
   }
}
