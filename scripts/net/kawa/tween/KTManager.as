package net.kawa.tween
{
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class KTManager
   {
       
      
      private var stage:Sprite;
      
      private var running:Boolean;
      
      private var firstJob:net.kawa.tween.KTJob;
      
      private var lastJob:net.kawa.tween.KTJob;
      
      private var firstAdded:net.kawa.tween.KTJob;
      
      private var lastAdded:net.kawa.tween.KTJob;
      
      public function KTManager()
      {
         this.running = false;
         super();
         this.stage = new Sprite();
      }
      
      public function queue(param1:net.kawa.tween.KTJob, param2:Number = 0) : void
      {
         var that:KTManager = null;
         var closure:Function = null;
         var job:net.kawa.tween.KTJob = param1;
         var delay:Number = param2;
         if(delay > 0)
         {
            that = this;
            closure = function():void
            {
               that.queue(job);
            };
            setTimeout(closure,delay * 1000);
            return;
         }
         job.init();
         if(this.lastAdded != null)
         {
            this.lastAdded.next = job;
         }
         else
         {
            this.firstAdded = job;
         }
         this.lastAdded = job;
         if(!this.running)
         {
            this.awake();
         }
      }
      
      private function awake() : void
      {
         if(this.running)
         {
            return;
         }
         this.stage.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
         this.running = true;
      }
      
      private function sleep() : void
      {
         this.stage.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.running = false;
      }
      
      private function enterFrameHandler(param1:Event) : void
      {
         if(this.firstAdded != null)
         {
            this.mergeList();
         }
         if(this.firstJob == null)
         {
            this.sleep();
            return;
         }
         var _loc2_:Number = getTimer();
         var _loc3_:net.kawa.tween.KTJob = null;
         var _loc4_:net.kawa.tween.KTJob = this.firstJob;
         _loc4_ = this.firstJob;
         while(_loc4_ != null)
         {
            if(_loc4_.finished)
            {
               if(_loc3_ == null)
               {
                  this.firstJob = _loc4_.next;
               }
               else
               {
                  _loc3_.next = _loc4_.next;
               }
               if(_loc4_.next == null)
               {
                  this.lastJob = _loc3_;
               }
               _loc4_.close();
            }
            else
            {
               _loc4_.step(_loc2_);
               _loc3_ = _loc4_;
            }
            _loc4_ = _loc4_.next;
         }
      }
      
      public function abort() : void
      {
         var _loc1_:net.kawa.tween.KTJob = null;
         this.mergeList();
         _loc1_ = this.firstJob;
         while(_loc1_ != null)
         {
            _loc1_.abort();
            _loc1_ = _loc1_.next;
         }
      }
      
      public function cancel() : void
      {
         var _loc1_:net.kawa.tween.KTJob = null;
         this.mergeList();
         _loc1_ = this.firstJob;
         while(_loc1_ != null)
         {
            _loc1_.cancel();
            _loc1_ = _loc1_.next;
         }
      }
      
      public function complete() : void
      {
         var _loc1_:net.kawa.tween.KTJob = null;
         this.mergeList();
         _loc1_ = this.firstJob;
         while(_loc1_ != null)
         {
            _loc1_.complete();
            _loc1_ = _loc1_.next;
         }
      }
      
      public function pause() : void
      {
         var _loc1_:net.kawa.tween.KTJob = null;
         this.mergeList();
         _loc1_ = this.firstJob;
         while(_loc1_ != null)
         {
            _loc1_.pause();
            _loc1_ = _loc1_.next;
         }
      }
      
      public function resume() : void
      {
         var _loc1_:net.kawa.tween.KTJob = null;
         _loc1_ = this.firstJob;
         while(_loc1_ != null)
         {
            _loc1_.resume();
            _loc1_ = _loc1_.next;
         }
      }
      
      private function mergeList() : void
      {
         if(!this.firstAdded)
         {
            return;
         }
         if(this.lastJob != null)
         {
            this.lastJob.next = this.firstAdded;
         }
         else
         {
            this.firstJob = this.firstAdded;
         }
         this.lastJob = this.lastAdded;
         this.firstAdded = null;
         this.lastAdded = null;
      }
   }
}
