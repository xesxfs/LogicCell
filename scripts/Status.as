package
{
   public var Status:StatusClass = new StatusClass();
}

import flash.utils.getTimer;

class StatusClass
{
    
   
   public var score:int;
   
   public var drawScore:int;
   
   public var combo:int;
   
   public var maxCombo:int;
   
   public var startTime:int = 0;
   
   public var finishTime:int = 0;
   
   public var mode:int;
   
   private const vecComboScore:Vector.<int> = Vector.<int>([0,10,20,40,70,110,160,220,290,370,460,560,670,790,920,1060,1210,1370,1540,1720,1910,2110,2320,2540,2770,3010,3260,3520,3790,4070,4360,4660,4970,5290,5620,5960,6310,6670,7040,7420,7810,8210,8620,9040,9470,9910,10360,10820,11290,11770]);
   
   function StatusClass()
   {
      super();
   }
   
   public function reset(param1:int) : void
   {
      this.score = 0;
      this.drawScore = 0;
      this.combo = 0;
      this.maxCombo = 0;
      this.startTime = getTimer();
      this.finishTime = 0;
      this.mode = param1;
   }
   
   public function update() : void
   {
      if(this.drawScore != this.score)
      {
         this.drawScore = this.drawScore + (int((this.score - this.drawScore) / 5) + 1);
      }
   }
   
   public function addScore() : int
   {
      var _loc2_:int = this.vecComboScore[this.combo];
      this.score = this.score + _loc2_;
      return _loc2_;
   }
   
   public function getPlayTime() : String
   {
      var _loc1_:int = this.finishTime - this.startTime;
      var _loc2_:* = "";
      var _loc3_:Number = _loc1_ / 1000;
      var _loc4_:int = _loc3_ / 60;
      var _loc5_:int = _loc3_ % 60;
      var _loc6_:int = int(_loc3_ * 100) % 100;
      if(_loc4_ < 10)
      {
         _loc2_ = _loc2_ + "0";
      }
      _loc2_ = _loc2_ + ("" + _loc4_ + " : ");
      if(_loc5_ < 10)
      {
         _loc2_ = _loc2_ + "0";
      }
      _loc2_ = _loc2_ + ("" + _loc5_ + " : ");
      if(_loc6_ < 10)
      {
         _loc2_ = _loc2_ + "0";
      }
      _loc2_ = _loc2_ + ("" + _loc6_);
      return _loc2_;
   }
}
