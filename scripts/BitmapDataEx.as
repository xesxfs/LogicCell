package
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   
   public class BitmapDataEx extends BitmapData
   {
       
      
      public var fillColor:uint;
      
      public var x:int;
      
      public var y:int;
      
      public function BitmapDataEx(param1:int, param2:int, param3:uint = 0)
      {
         super(param1,param2,true,param3);
         this.fillColor = param3;
      }
      
      public function drawRect(param1:int, param2:int, param3:int, param4:int, param5:uint) : void
      {
         fillRect(new Rectangle(param1,param2,param3,param4),param5);
      }
      
      public function drawBorderRect(param1:int, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:uint) : void
      {
         fillRect(new Rectangle(param1,param2,param3,param4),param6);
         fillRect(new Rectangle(param1 + param5,param2 + param5,param3 - param5 * 2,param4 - param5 * 2),param7);
      }
      
      public function copy(param1:BitmapData, param2:int, param3:int, param4:int, param5:int, param6:int = 0, param7:int = 0, param8:Boolean = true) : void
      {
         copyPixels(param1,new Rectangle(param2,param3,param4,param5),new Point(param6,param7),null,null,param8);
      }
      
      public function clear() : void
      {
         fillRect(rect,this.fillColor);
      }
   }
}
