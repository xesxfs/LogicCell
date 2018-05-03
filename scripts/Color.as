package
{
   public class Color
   {
       
      
      public function Color()
      {
         super();
      }
      
      public static function getRBG(param1:uint) : Vector.<int>
      {
         param1 = param1 % 16777216;
         return Vector.<int>([param1 / 65536,param1 % 65536 / 256,param1 % 256]);
      }
   }
}
