package
{
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class HudManagerScore1min extends Sprite
   {
       
      
      private var scoreBmd:BitmapDisplay;
      
      private var timeBmd:BitmapDisplay;
      
      private var matrix:Matrix;
      
      public function HudManagerScore1min()
      {
         super();
         y = 0;
         this.scoreBmd = new BitmapDisplay(120,20,855638016);
         this.scoreBmd.scaleX = 2;
         this.scoreBmd.scaleY = 2;
         addChild(this.scoreBmd);
         this.timeBmd = new BitmapDisplay(60,20);
         this.timeBmd.y = 40;
         this.timeBmd.x = 90;
         addChild(this.timeBmd);
      }
      
      public function update() : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.scoreBmd.clear();
         this.timeBmd.clear();
         this.scoreBmd.drawBorderString("" + Status.drawScore,-1,6);
         var _loc1_:int = SetScore1minScene.cnt;
         if(_loc1_ >= 0)
         {
            if(_loc1_ > 1800)
            {
               _loc1_ = 1800;
            }
            _loc2_ = "";
            _loc3_ = (1800 - _loc1_) / 30;
            _loc4_ = _loc3_ % 60;
            _loc5_ = int(_loc3_ * 100) % 100;
            if(_loc4_ < 10)
            {
               _loc2_ = _loc2_ + "0";
            }
            _loc2_ = _loc2_ + ("" + _loc4_ + ".");
            if(_loc5_ < 10)
            {
               _loc2_ = _loc2_ + "0";
            }
            _loc2_ = _loc2_ + ("" + _loc5_);
            this.timeBmd.drawBorderString(_loc2_,-1,6);
         }
         else
         {
            this.timeBmd.drawBorderString("60.00",-1,6);
         }
      }
   }
}
