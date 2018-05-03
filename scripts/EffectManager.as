package
{
   public var EffectManager:EffectManagerClass = new EffectManagerClass();
}

class EffectManagerClass extends BitmapDisplay
{
    
   
   public var vecEffect:Vector.<Effect>;
   
   function EffectManagerClass()
   {
      super(240,381);
      this.vecEffect = new Vector.<Effect>();
   }
   
   public function update() : void
   {
      var _loc1_:int = 0;
      var _loc3_:Effect = null;
      var _loc2_:int = this.vecEffect.length;
      clear();
      _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         _loc3_ = this.vecEffect[_loc1_];
         if(_loc3_.update())
         {
            _loc1_--;
            _loc2_--;
         }
         if(!_loc3_.doDraw)
         {
            copy(_loc3_,0,0,_loc3_.width,_loc3_.height,_loc3_.x,_loc3_.y);
         }
         else
         {
            bitmapData.draw(_loc3_,_loc3_.matrix);
         }
         _loc1_++;
      }
   }
   
   public function addEffect(param1:Effect) : void
   {
      param1.effectNumber = this.vecEffect.length;
      this.vecEffect.push(param1);
   }
   
   public function removeEffect(param1:int) : void
   {
      var _loc2_:int = 0;
      this.vecEffect.splice(param1,1);
      var _loc3_:int = this.vecEffect.length;
      _loc2_ = param1;
      while(_loc2_ < _loc3_)
      {
         this.vecEffect[_loc2_].effectNumber--;
         _loc2_++;
      }
   }
}
