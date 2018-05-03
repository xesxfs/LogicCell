package net.kawa.tween.easing
{
   public class Quint
   {
       
      
      public function Quint()
      {
         super();
      }
      
      public static function easeIn(param1:Number) : Number
      {
         return param1 * param1 * param1 * param1 * param1;
      }
      
      public static function easeOut(param1:Number) : Number
      {
         return 1 - easeIn(1 - param1);
      }
      
      public static function easeInOut(param1:Number) : Number
      {
         return param1 < 0.5?Number(easeIn(param1 * 2) * 0.5):Number(1 - easeIn(2 - param1 * 2) * 0.5);
      }
   }
}
