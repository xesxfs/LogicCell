package
{
   import flash.geom.Matrix;
   
   public class EffectLayerErase extends Effect
   {
       
      
      private var color:uint;
      
      public function EffectLayerErase(param1:int, param2:int, param3:uint)
      {
         x = param1 * 45 + Field.fieldX;
         y = param2 * 45 + Field.fieldY;
         w = 44;
         h = 44;
         super();
         this.color = param3;
         endCnt = 25;
         matrix = new Matrix();
         doDraw = true;
         drawBorderRect(0,0,44,44,3,param3,0);
      }
      
      override public function update() : Boolean
      {
         var _loc1_:Number = 1 + frameCnt * 0.5;
         var _loc2_:Number = 1 - _loc1_;
         matrix.createBox(_loc1_,_loc1_,0,x + _loc2_ * width / 2,y + _loc2_ * height / 2);
         drawBorderRect(0,0,44,44,3,this.color % 16777216 + (250 - frameCnt * 10) * 16777216,0);
         if(endCnt == frameCnt)
         {
            EffectManager.removeEffect(effectNumber);
            return true;
         }
         frameCnt++;
         return false;
      }
   }
}
