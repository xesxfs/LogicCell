package
{
   import flash.display.Bitmap;
   import flash.geom.Rectangle;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BitmapDisplay extends Bitmap
   {
       
      
      public var fillColor:uint;
      
      public function BitmapDisplay(param1:int, param2:int, param3:uint = 0)
      {
         super();
         bitmapData = new BitmapData(param1,param2,true,param3);
         this.fillColor = param3;
      }
      
      public function drawRect(param1:int, param2:int, param3:int, param4:int, param5:uint) : void
      {
         bitmapData.fillRect(new Rectangle(param1,param2,param3,param4),param5);
      }
      
      public function drawBorderRect(param1:int, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:uint) : void
      {
         if(param5 != 0)
         {
            bitmapData.fillRect(new Rectangle(param1,param2,param3,param4),param6);
         }
         if(param5 != -1)
         {
            bitmapData.fillRect(new Rectangle(param1 + param5,param2 + param5,param3 - param5 * 2,param4 - param5 * 2),param7);
         }
      }
      
      public function copy(param1:BitmapData, param2:int, param3:int, param4:int, param5:int, param6:int = 0, param7:int = 0, param8:Boolean = true) : void
      {
         bitmapData.copyPixels(param1,new Rectangle(param2,param3,param4,param5),new Point(param6,param7),null,null,param8);
      }
      
      public function drawString(param1:String, param2:int = -1, param3:int = -1, param4:uint = 16777215, param5:Number = 1.0) : void
      {
         var _loc6_:BitmapString = new BitmapString(param1,param4,param5);
         if(param2 == -1)
         {
            param2 = (width / scaleX - _loc6_.width) / 2;
         }
         if(param3 == -1)
         {
            param3 = (height / scaleY - _loc6_.height) / 2;
         }
         bitmapData.copyPixels(_loc6_,new Rectangle(0,0,_loc6_.width,_loc6_.height),new Point(param2,param3),null,null,true);
      }
      
      public function drawString714(param1:String, param2:int = -1, param3:int = -1, param4:uint = 16777215, param5:Number = 1.0) : void
      {
         var _loc6_:BitmapString714 = new BitmapString714(param1,param4,param5);
         if(param2 == -1)
         {
            param2 = (width - _loc6_.width) / 2;
         }
         if(param3 == -1)
         {
            param3 = (height - _loc6_.height) / 2;
         }
         bitmapData.copyPixels(_loc6_,_loc6_.rect,new Point(param2,param3),null,null,true);
      }
      
      public function drawBorderString(param1:String, param2:int = -1, param3:int = -1, param4:uint = 16777215, param5:uint = 0, param6:Number = 1.0, param7:Number = 1.0) : void
      {
         var _loc8_:BitmapBorderString = new BitmapBorderString(param1,param4,param5,param6,param7);
         if(param2 == -1)
         {
            param2 = (width / scaleX - _loc8_.width) / 2;
         }
         if(param3 == -1)
         {
            param3 = (height / scaleY - _loc8_.height) / 2;
         }
         bitmapData.copyPixels(_loc8_,new Rectangle(0,0,_loc8_.width,_loc8_.height),new Point(param2,param3),null,null,true);
      }
      
      public function clear() : void
      {
         bitmapData.fillRect(bitmapData.rect,this.fillColor);
      }
      
      public function setScale(param1:Number) : void
      {
         scaleX = param1;
         scaleY = param1;
      }
   }
}
