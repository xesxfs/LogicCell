package
{
   import flash.geom.Matrix;
   
   public class Effect extends BitmapDataEx
   {
       
      
      public var effectNumber:int;
      
      protected var w:int;
      
      protected var h:int;
      
      public var frameCnt:int;
      
      public var endCnt:int;
      
      public var doDraw:Boolean = false;
      
      public var matrix:Matrix;
      
      public function Effect()
      {
         super(this.w,this.h);
      }
      
      public function update() : Boolean
      {
         return false;
      }
   }
}
