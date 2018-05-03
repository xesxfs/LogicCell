package
{
   public var SharedManager:SharedManagerClass = new SharedManagerClass();
}

import flash.net.SharedObject;

class SharedManagerClass
{
    
   
   public var so:SharedObject;
   
   public var vecPuzzleClear:Vector.<int>;
   
   public var score:int;
   
   public var score1min:int;
   
   public var score30:int;
   
   public var score1combo:int;
   
   public var userName:String;
   
   public var sound:Boolean = true;
   
   public var sendScoreTime:Number = 0;
   
   public var sendScore30Time:Number = 0;
   
   public var sendScore1minTime:Number = 0;
   
   public var sendScore1comboTime:Number = 0;
   
   public var dayScore:int;
   
   public var dayScore30:int;
   
   public var dayScore1min:int;
   
   public var dayScore1combo:int;
   
   function SharedManagerClass()
   {
      super();
      this.so = SharedObject.getLocal("s");
      this.init();
   }
   
   public function init() : void
   {
      var _loc2_:int = 0;
      if(this.so.data.vecPuzzleClear != undefined)
      {
         this.vecPuzzleClear = Vector.<int>(this.so.data.vecPuzzleClear);
         while(this.vecPuzzleClear.length < 25)
         {
            this.vecPuzzleClear.push(0);
         }
      }
      else
      {
         this.vecPuzzleClear = new Vector.<int>();
         _loc2_ = 0;
         while(_loc2_ < 25)
         {
            this.vecPuzzleClear[_loc2_] = 0;
            _loc2_++;
         }
      }
      if(this.so.data.score != undefined)
      {
         this.score = int(this.so.data.score);
      }
      else
      {
         this.score = 0;
      }
      if(this.so.data.score1min != undefined)
      {
         this.score1min = int(this.so.data.score1min);
      }
      else
      {
         this.score1min = 0;
      }
      if(this.so.data.score30 != undefined)
      {
         this.score30 = int(this.so.data.score30);
      }
      else
      {
         this.score30 = 0;
      }
      if(this.so.data.score1combo != undefined)
      {
         this.score1combo = int(this.so.data.score1combo);
      }
      else
      {
         this.score1combo = 0;
      }
      if(this.so.data.sound != undefined)
      {
         this.sound = this.so.data.sound;
      }
      else
      {
         this.sound = true;
      }
      if(this.so.data.userName != undefined)
      {
         this.userName = this.so.data.userName;
      }
      else
      {
         this.userName = "";
      }
      if(this.so.data.sendScoreTime != undefined)
      {
         this.sendScoreTime = this.so.data.sendScoreTime;
      }
      else
      {
         this.sendScoreTime = 0;
      }
      if(this.so.data.sendScore30Time != undefined)
      {
         this.sendScore30Time = this.so.data.sendScore30Time;
      }
      else
      {
         this.sendScore30Time = 0;
      }
      if(this.so.data.sendScore1minTime != undefined)
      {
         this.sendScore1minTime = this.so.data.sendScore1minTime;
      }
      else
      {
         this.sendScore1minTime = 0;
      }
      if(this.so.data.sendScore1comboTime != undefined)
      {
         this.sendScore1comboTime = this.so.data.sendScore1comboTime;
      }
      else
      {
         this.sendScore1comboTime = 0;
      }
      if(this.so.data.dayScore != undefined)
      {
         this.dayScore = int(this.so.data.dayScore);
      }
      else
      {
         this.dayScore = 0;
      }
      if(this.so.data.dayScore30 != undefined)
      {
         this.dayScore30 = int(this.so.data.dayScore30);
      }
      else
      {
         this.dayScore30 = 0;
      }
      if(this.so.data.dayScore1min != undefined)
      {
         this.dayScore1min = int(this.so.data.dayScore1min);
      }
      else
      {
         this.dayScore1min = 0;
      }
      if(this.so.data.dayScore1combo != undefined)
      {
         this.dayScore1combo = int(this.so.data.dayScore1combo);
      }
      else
      {
         this.dayScore1combo = 0;
      }
   }
   
   public function erase() : void
   {
      this.so.clear();
      this.so.flush();
      this.init();
   }
   
   public function getPuzzleClearNum() : int
   {
      var _loc1_:int = 0;
      var _loc2_:int = this.vecPuzzleClear.length;
      _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         if(this.vecPuzzleClear[_loc1_] == 0)
         {
            return _loc1_;
         }
         _loc1_++;
      }
      return 25;
   }
   
   public function getPerfect() : Boolean
   {
      var _loc1_:int = 0;
      var _loc2_:int = this.vecPuzzleClear.length;
      var _loc3_:int = 0;
      _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         _loc3_ = _loc3_ + this.vecPuzzleClear[_loc1_];
         _loc1_++;
      }
      if(_loc3_ >= 50)
      {
         return true;
      }
      return false;
   }
   
   public function saveVecPuzzleClear() : void
   {
      this.so.data.vecPuzzleClear = this.vecPuzzleClear;
      this.so.flush();
   }
   
   public function saveScore(param1:int) : void
   {
      if(this.score < param1)
      {
         this.score = param1;
         this.so.data.score = param1;
         this.so.flush();
      }
   }
   
   public function saveScore1min(param1:int) : void
   {
      if(this.score1min < param1)
      {
         this.score1min = param1;
         this.so.data.score1min = this.score1min;
         this.so.flush();
      }
   }
   
   public function saveScore30(param1:int) : void
   {
      if(this.score30 < param1)
      {
         this.score30 = param1;
         this.so.data.score30 = this.score30;
         this.so.flush();
      }
   }
   
   public function saveScore1combo(param1:int) : void
   {
      if(this.score1combo < param1)
      {
         this.score1combo = param1;
         this.so.data.score1combo = this.score1combo;
         this.so.flush();
      }
   }
   
   public function saveDayScore(param1:int, param2:Number) : void
   {
      this.dayScore = param1;
      this.so.data.dayScore = this.dayScore;
      this.sendScoreTime = param2;
      this.so.data.sendScoreTime = this.sendScoreTime;
      this.so.flush();
   }
   
   public function saveDayScore1min(param1:int, param2:Number) : void
   {
      this.dayScore1min = param1;
      this.so.data.dayScore1min = this.dayScore1min;
      this.sendScore1minTime = param2;
      this.so.data.sendScore1minTime = this.sendScore1minTime;
      this.so.flush();
   }
   
   public function saveDayScore30(param1:int, param2:Number) : void
   {
      this.dayScore30 = param1;
      this.so.data.dayScore30 = this.dayScore30;
      this.sendScore30Time = param2;
      this.so.data.sendScore30Time = this.sendScore30Time;
      this.so.flush();
   }
   
   public function saveDayScore1combo(param1:int, param2:Number) : void
   {
      this.dayScore1combo = param1;
      this.so.data.dayScore1combo = this.dayScore1combo;
      this.sendScore1comboTime = param2;
      this.so.data.sendScore1comboTime = this.sendScore1comboTime;
      this.so.flush();
   }
   
   public function soundChange() : void
   {
      if(this.sound)
      {
         this.sound = false;
      }
      else
      {
         this.sound = true;
      }
      this.so.data.sound = this.sound;
      this.so.flush();
      SoundManager.volumeReset();
   }
   
   public function saveUserName(param1:String) : void
   {
      this.userName = param1;
      this.so.data.userName = this.userName;
      this.so.flush();
   }
}
