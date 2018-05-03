package
{
   public class EffectScore extends Effect
   {
       
      
      public function EffectScore(param1:String, param2:int, param3:int)
      {
         var _loc4_:BitmapBorderString = null;
         _loc4_ = new BitmapBorderString(param1,16777215);
         x = param2 * 45 + Field.fieldX + int(45 - _loc4_.width) / 2;
         y = param3 * 45 + Field.fieldY + int(45 - _loc4_.height) / 2;
         w = _loc4_.width;
         h = _loc4_.height;
         super();
         copy(_loc4_,0,0,_loc4_.width,_loc4_.height);
         endCnt = 15;
      }
      
      override public function update() : Boolean
      {
         y = y - (15 - frameCnt) / 10;
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
