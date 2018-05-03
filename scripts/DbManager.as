package
{
   public var DbManager:DbManagerClass = new DbManagerClass();
}

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLVariables;
import flash.events.Event;
import flash.net.URLRequestMethod;
import flash.net.URLLoaderDataFormat;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.system.System;

class DbManagerClass
{
    
   
   private var loader:URLLoader;
   
   private var request:URLRequest;
   
   private var variables:URLVariables;
   
   public var vecScoreRanking:Vector.<Ranking>;
   
   public var vecScoreDayRanking:Vector.<Ranking>;
   
   public var vecScore1minRanking:Vector.<Ranking>;
   
   public var vecScore1minDayRanking:Vector.<Ranking>;
   
   public var vecScore30Ranking:Vector.<Ranking>;
   
   public var vecScore30DayRanking:Vector.<Ranking>;
   
   public var vecScore1comboRanking:Vector.<Ranking>;
   
   public var vecScore1comboDayRanking:Vector.<Ranking>;
   
   public var rankingTime:Number = 0;
   
   function DbManagerClass()
   {
      super();
      System.useCodePage = true;
   }
   
   private function onComplete(param1:Event) : void
   {
      LoadingManager.complete();
   }
   
   public function sendScore(param1:int) : void
   {
      var _loc2_:Number = Math.floor(new Date().getTime() / 1000);
      switch(param1)
      {
         case 1:
            if(SharedManager.dayScore < Status.score || _loc2_ - SharedManager.sendScoreTime >= 86400)
            {
               SharedManager.saveDayScore(Status.score,_loc2_);
               break;
            }
            return;
         case 2:
            if(SharedManager.dayScore30 < Status.score || _loc2_ - SharedManager.sendScore30Time >= 86400)
            {
               SharedManager.saveDayScore30(Status.score,_loc2_);
               break;
            }
            return;
         case 3:
            if(SharedManager.dayScore1min < Status.score || _loc2_ - SharedManager.sendScore1minTime >= 86400)
            {
               SharedManager.saveDayScore1min(Status.score,_loc2_);
               break;
            }
            return;
         case 4:
            if(SharedManager.dayScore1combo < Status.score || _loc2_ - SharedManager.sendScore1comboTime >= 86400)
            {
               SharedManager.saveDayScore1combo(Status.score,_loc2_);
               break;
            }
            return;
      }
      this.request = new URLRequest("http://www.logicalcell.net/concentricholicscore.php");
      this.request.method = URLRequestMethod.POST;
      this.variables = new URLVariables();
      this.variables.mode = "" + param1;
      this.variables.score = "" + Status.score;
      this.variables.userName = SharedManager.userName;
      this.variables.time = "" + _loc2_;
      this.request.data = this.variables;
      this.loader = new URLLoader(this.request);
      this.loader.dataFormat = URLLoaderDataFormat.VARIABLES;
      this.loader.addEventListener(Event.COMPLETE,this.onComplete);
      LoadingManager.sendScoreStart();
      this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.errorEvent);
      this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.errorEvent);
      this.loader.load(this.request);
   }
   
   private function errorEvent(param1:IOErrorEvent) : void
   {
      LoadingManager.catchError();
   }
   
   public function getRanking() : void
   {
      if(new Date().getTime() - this.rankingTime < 60000)
      {
         return;
      }
      this.request = new URLRequest("http://www.logicalcell.net/concentricholicranking.php");
      this.request.method = URLRequestMethod.POST;
      this.loader = new URLLoader(this.request);
      this.loader.dataFormat = URLLoaderDataFormat.VARIABLES;
      this.loader.addEventListener(Event.COMPLETE,this.onCompleteRanking);
      LoadingManager.loadingStart();
      this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.errorEvent);
      this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.errorEvent);
      this.loader.load(this.request);
   }
   
   private function onCompleteRanking(param1:Event) : void
   {
      var _loc2_:Array = null;
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      var _loc5_:Ranking = null;
      LoadingManager.complete();
      this.rankingTime = new Date().getTime();
      var _loc6_:String = String(new URLVariables(param1.target.data).resultScore);
      _loc2_ = _loc6_.split(",");
      _loc2_.pop();
      this.vecScoreRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScoreRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc7_:String = String(new URLVariables(param1.target.data).resultScoreDay);
      _loc2_ = _loc7_.split(",");
      _loc2_.pop();
      this.vecScoreDayRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScoreDayRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc8_:String = String(new URLVariables(param1.target.data).resultScore30);
      _loc2_ = _loc8_.split(",");
      _loc2_.pop();
      this.vecScore30Ranking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScore30Ranking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc9_:String = String(new URLVariables(param1.target.data).resultScore30Day);
      _loc2_ = _loc9_.split(",");
      _loc2_.pop();
      this.vecScore30DayRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScore30DayRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc10_:String = String(new URLVariables(param1.target.data).resultScore1min);
      _loc2_ = _loc10_.split(",");
      _loc2_.pop();
      this.vecScore1minRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScore1minRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc11_:String = String(new URLVariables(param1.target.data).resultScore1minDay);
      _loc2_ = _loc11_.split(",");
      _loc2_.pop();
      this.vecScore1minDayRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScore1minDayRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc12_:String = String(new URLVariables(param1.target.data).resultScore1combo);
      _loc2_ = _loc12_.split(",");
      _loc2_.pop();
      this.vecScore1comboRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScore1comboRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
      var _loc13_:String = String(new URLVariables(param1.target.data).resultScore1comboDay);
      _loc2_ = _loc13_.split(",");
      _loc2_.pop();
      this.vecScore1comboDayRanking = new Vector.<Ranking>();
      _loc4_ = _loc2_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc5_ = new Ranking(_loc2_[_loc3_],_loc2_[_loc3_ + 1]);
         this.vecScore1comboDayRanking.push(_loc5_);
         _loc3_ = _loc3_ + 2;
      }
   }
}
