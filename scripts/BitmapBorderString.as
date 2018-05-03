package
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.geom.ColorTransform;
   
   public class BitmapBorderString extends BitmapDataEx
   {
       
      
      private const vecSpace:Vector.<uint> = Vector.<uint>([2,4,2,0,0,0,0,4,3,3,0,0,4,0,4,0,0,0,0,0,0,0,0,0,0,0,4,4,1,0,1,0,0,0,0,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,2,2,0,3,0,0,0,0,0,2,0,0,4,3,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0]);
      
      private const chip:BitmapData = Resource.borderStringChip;
      
      private var cloneChip:BitmapData;
      
      private var string:String;
      
      public function BitmapBorderString(param1:String, param2:uint = 16777215, param3:uint = 0, param4:Number = 1.0, param5:Number = 1.0)
      {
         this.string = param1;
         super(this.getWidth(),11);
         var _loc6_:Vector.<int> = Color.getRBG(param2);
         var _loc7_:Vector.<int> = Color.getRBG(param3);
         this.cloneChip = this.chip.clone();
         this.cloneChip.colorTransform(new Rectangle(0,0,140,55),new ColorTransform(0,0,0,param4,_loc6_[0],_loc6_[1],_loc6_[2]));
         this.cloneChip.colorTransform(new Rectangle(0,55,140,55),new ColorTransform(0,0,0,param5,_loc7_[0],_loc7_[1],_loc7_[2]));
         this.drawString();
      }
      
      public function getWidth() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.string.length;
         var _loc3_:int = _loc2_ * 8 - 1;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc3_ - this.vecSpace[this.string.charCodeAt(_loc1_) - 32];
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function drawString() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = this.string.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this.string.charCodeAt(_loc1_);
            if(_loc4_ <= 32 || 122 < _loc4_)
            {
               _loc3_ = _loc3_ + 4;
            }
            else
            {
               _loc5_ = (_loc4_ - 33) % 20 * 7;
               _loc6_ = int((_loc4_ - 33) / 20) * 11;
               copy(this.cloneChip,_loc5_,_loc6_,7,11,_loc3_,0);
               copy(this.cloneChip,_loc5_,_loc6_ + 55,7,11,_loc3_,0);
               _loc3_ = _loc3_ + 8;
               _loc3_ = _loc3_ - this.vecSpace[_loc4_ - 32];
            }
            _loc1_++;
         }
      }
   }
}
