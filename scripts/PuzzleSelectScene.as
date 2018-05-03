package
{
   public class PuzzleSelectScene extends Scene
   {
       
      
      private var vecGrid:Vector.<BitmapDisplay>;
      
      public function PuzzleSelectScene()
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:BitmapDisplay = null;
         var _loc6_:BitmapDisplay = null;
         super();
         this.vecGrid = new Vector.<BitmapDisplay>();
         var _loc3_:BitmapDisplay = new BitmapDisplay(120,10);
         _loc3_.y = 20;
         _loc3_.setScale(2);
         _loc3_.drawString("Stage Select",-1,-1,12303291);
         addChild(_loc3_);
         var _loc4_:int = SharedManager.getPuzzleClearNum() + 1;
         _loc1_ = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = 0;
            while(_loc2_ < 5)
            {
               _loc6_ = new BitmapDisplay(44,44);
               _loc6_.x = 1 + 46 * _loc1_ + 5;
               _loc6_.y = 1 + 46 * _loc2_ + 50;
               this.vecGrid.push(_loc6_);
               if(_loc1_ + _loc2_ * 5 < _loc4_)
               {
                  if(SharedManager.vecPuzzleClear[_loc1_ + _loc2_ * 5] == 2)
                  {
                     _loc6_.drawBorderRect(3,3,38,38,2,4290493371,0);
                  }
                  _loc6_.drawBorderRect(6,6,32,32,3,4290493371,0);
                  _loc6_.drawString("" + (_loc1_ + _loc2_ * 5 + 1),-1,18,12303291);
               }
               else
               {
                  _loc6_.drawBorderRect(6,6,32,32,3,4290493371,4290493371);
               }
               addChild(_loc6_);
               _loc2_++;
            }
            _loc1_++;
         }
         _loc5_ = new BitmapDisplay(22,22);
         _loc5_.copy(Resource.chip,22,220,22,22,0,0);
         _loc5_.setScale(2);
         _loc5_.alpha = 0.8;
         _loc5_.x = 98;
         _loc5_.y = 290;
         addChild(_loc5_);
         InputManager.newInput(InputPuzzleSelect);
      }
      
      override public function update() : void
      {
      }
   }
}
