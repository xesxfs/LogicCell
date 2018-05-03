package
{
   public var BackBitmap:BackBitmapClass = new BackBitmapClass();
}

class BackBitmapClass extends BitmapDisplay
{
    
   
   function BackBitmapClass()
   {
      var _loc2_:uint = 0;
      var _loc7_:int = 0;
      var _loc8_:int = 0;
      var _loc9_:int = 0;
      var _loc10_:int = 0;
      var _loc11_:int = 0;
      var _loc12_:int = 0;
      var _loc13_:int = 0;
      var _loc14_:int = 0;
      var _loc15_:int = 0;
      var _loc16_:int = 0;
      _loc2_ = 4282668373;
      super(360,570,_loc2_);
      var _loc3_:Vector.<int> = Color.getRBG(_loc2_);
      var _loc4_:int = _loc3_[0];
      var _loc5_:int = _loc3_[1];
      var _loc6_:int = _loc3_[2];
      x = -60;
      y = -95;
      _loc7_ = 0;
      while(_loc7_ < 9)
      {
         _loc8_ = 0;
         while(_loc8_ < 17)
         {
            _loc11_ = Math.random() * 5;
            _loc15_ = (60 - _loc11_ - 1) / (_loc11_ + 1);
            _loc9_ = 0;
            while(_loc9_ < _loc11_ + 1)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc11_ + 1)
               {
                  _loc16_ = 10;
                  _loc12_ = Math.random() * _loc16_ - _loc16_ / 2;
                  _loc14_ = Math.random() * _loc16_ - _loc16_ / 2;
                  _loc13_ = Math.random() * _loc16_ - _loc16_ / 2;
                  drawBorderRect(_loc7_ * 60 + (_loc15_ + 1) * _loc9_,_loc8_ * 60 + (_loc15_ + 1) * _loc10_,_loc15_,_loc15_,2,255 * 16777216 + (_loc4_ + _loc12_) * 65536 + (_loc5_ + _loc12_) * 256 + (_loc6_ + _loc12_),_loc2_);
                  _loc10_++;
               }
               _loc9_++;
            }
            _loc8_++;
         }
         _loc7_++;
      }
   }
}
