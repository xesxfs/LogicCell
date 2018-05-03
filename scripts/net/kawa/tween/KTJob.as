package net.kawa.tween
{
   import flash.events.EventDispatcher;
   import flash.events.Event;
   import flash.utils.getTimer;
   import net.kawa.tween.easing.Quad;
   
   public class KTJob extends EventDispatcher
   {
       
      
      public var name:String;
      
      public var duration:Number;
      
      public var target;
      
      public var from:Object;
      
      public var to:Object;
      
      public var ease:Function;
      
      public var finished:Boolean;
      
      public var round:Boolean;
      
      public var repeat:Boolean;
      
      public var yoyo:Boolean;
      
      public var onInit:Function;
      
      public var onChange:Function;
      
      public var onComplete:Function;
      
      public var onClose:Function;
      
      public var onCancel:Function;
      
      public var onInitParams:Array;
      
      public var onChangeParams:Array;
      
      public var onCompleteParams:Array;
      
      public var onCloseParams:Array;
      
      public var onCancelParams:Array;
      
      public var next:net.kawa.tween.KTJob;
      
      private var reverse:Boolean;
      
      private var initialized:Boolean;
      
      private var canceled:Boolean;
      
      private var pausing:Boolean;
      
      private var startTime:Number;
      
      private var lastTime:Number;
      
      private var firstProp:_KTProperty;
      
      private var invokeEvent:Boolean;
      
      public function KTJob(param1:*)
      {
         this.duration = 1;
         this.ease = Quad.easeOut;
         this.finished = false;
         this.round = false;
         this.repeat = false;
         this.yoyo = false;
         this.reverse = false;
         this.initialized = false;
         this.canceled = false;
         this.pausing = false;
         this.invokeEvent = false;
         super();
         this.target = param1;
      }
      
      public function init(param1:Number = -1) : void
      {
         var _loc2_:Event = null;
         if(this.initialized)
         {
            return;
         }
         if(this.finished)
         {
            return;
         }
         if(this.canceled)
         {
            return;
         }
         if(this.pausing)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = getTimer();
         }
         this.startTime = param1;
         this.setupValues();
         this.initialized = true;
         if(this.onInit is Function)
         {
            this.onInit.apply(this.onInit,this.onInitParams);
         }
         if(this.invokeEvent)
         {
            _loc2_ = new Event(Event.INIT);
            dispatchEvent(_loc2_);
         }
      }
      
      private function setupValues() : void
      {
         var _loc4_:_KTProperty = null;
         var _loc5_:_KTProperty = null;
         var _loc6_:* = null;
         var _loc1_:Object = this.from != null?this.from:this.target;
         var _loc2_:Object = this.to != null?this.to:this.target;
         var _loc3_:Object = this.to != null?this.to:this.from;
         if(_loc3_ == null)
         {
            return;
         }
         for(_loc6_ in _loc3_)
         {
            if(_loc1_[_loc6_] != _loc2_[_loc6_])
            {
               _loc4_ = new _KTProperty(_loc6_,_loc1_[_loc6_],_loc2_[_loc6_]);
               if(this.firstProp == null)
               {
                  this.firstProp = _loc4_;
               }
               else
               {
                  _loc5_.next = _loc4_;
               }
               _loc5_ = _loc4_;
            }
         }
         if(this.from != null)
         {
            this.applyFirstValues();
         }
      }
      
      private function applyFirstValues() : void
      {
         var _loc1_:_KTProperty = null;
         var _loc2_:Event = null;
         _loc1_ = this.firstProp;
         while(_loc1_ != null)
         {
            this.target[_loc1_.key] = _loc1_.from;
            _loc1_ = _loc1_.next;
         }
         if(this.onChange is Function)
         {
            this.onChange.apply(this.onChange,this.onChangeParams);
         }
         if(this.invokeEvent)
         {
            _loc2_ = new Event(Event.CHANGE);
            dispatchEvent(_loc2_);
         }
      }
      
      private function applyFinalValues() : void
      {
         var _loc1_:_KTProperty = null;
         var _loc2_:Event = null;
         _loc1_ = this.firstProp;
         while(_loc1_ != null)
         {
            this.target[_loc1_.key] = _loc1_.to;
            _loc1_ = _loc1_.next;
         }
         if(this.onChange is Function)
         {
            this.onChange.apply(this.onChange,this.onChangeParams);
         }
         if(this.invokeEvent)
         {
            _loc2_ = new Event(Event.CHANGE);
            dispatchEvent(_loc2_);
         }
      }
      
      public function step(param1:Number = -1) : void
      {
         var _loc4_:_KTProperty = null;
         var _loc5_:Event = null;
         if(this.finished)
         {
            return;
         }
         if(this.canceled)
         {
            return;
         }
         if(this.pausing)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = getTimer();
         }
         if(!this.initialized)
         {
            this.init(param1);
            return;
         }
         if(this.lastTime == param1)
         {
            return;
         }
         this.lastTime = param1;
         var _loc2_:Number = (param1 - this.startTime) * 0.001;
         if(_loc2_ >= this.duration)
         {
            if(this.repeat)
            {
               if(this.yoyo)
               {
                  this.reverse = !this.reverse;
               }
               _loc2_ = _loc2_ - this.duration;
               this.startTime = param1 - _loc2_ * 1000;
            }
            else
            {
               this.complete();
               return;
            }
         }
         var _loc3_:Number = _loc2_ / this.duration;
         if(this.reverse)
         {
            _loc3_ = 1 - _loc3_;
         }
         if(this.ease is Function)
         {
            _loc3_ = this.ease(_loc3_);
         }
         if(this.round)
         {
            _loc4_ = this.firstProp;
            while(_loc4_ != null)
            {
               this.target[_loc4_.key] = Math.round(_loc4_.from + _loc4_.diff * _loc3_);
               _loc4_ = _loc4_.next;
            }
         }
         else
         {
            _loc4_ = this.firstProp;
            while(_loc4_ != null)
            {
               this.target[_loc4_.key] = _loc4_.from + _loc4_.diff * _loc3_;
               _loc4_ = _loc4_.next;
            }
         }
         if(this.onChange is Function)
         {
            this.onChange.apply(this.onChange,this.onChangeParams);
         }
         if(this.invokeEvent)
         {
            _loc5_ = new Event(Event.CHANGE);
            dispatchEvent(_loc5_);
         }
      }
      
      public function complete() : void
      {
         var _loc1_:Event = null;
         if(!this.initialized)
         {
            return;
         }
         if(this.finished)
         {
            return;
         }
         if(this.canceled)
         {
            return;
         }
         if(!this.target)
         {
            return;
         }
         this.applyFinalValues();
         this.finished = true;
         if(this.onComplete is Function)
         {
            this.onComplete.apply(this.onComplete,this.onCompleteParams);
         }
         if(this.invokeEvent)
         {
            _loc1_ = new Event(Event.COMPLETE);
            dispatchEvent(_loc1_);
         }
      }
      
      public function cancel() : void
      {
         var _loc1_:Event = null;
         if(!this.initialized)
         {
            return;
         }
         if(this.canceled)
         {
            return;
         }
         if(!this.target)
         {
            return;
         }
         this.applyFirstValues();
         this.finished = true;
         this.canceled = true;
         if(this.onCancel is Function)
         {
            this.onCancel.apply(this.onCancel,this.onCancelParams);
         }
         if(this.invokeEvent)
         {
            _loc1_ = new Event(Event.CANCEL);
            dispatchEvent(_loc1_);
         }
      }
      
      public function close() : void
      {
         var _loc1_:Event = null;
         if(!this.initialized)
         {
            return;
         }
         if(this.canceled)
         {
            return;
         }
         this.finished = true;
         if(this.onClose is Function)
         {
            this.onClose.apply(this.onClose,this.onCloseParams);
         }
         if(this.invokeEvent)
         {
            _loc1_ = new Event(Event.CLOSE);
            dispatchEvent(_loc1_);
         }
         this.clearnup();
      }
      
      protected function clearnup() : void
      {
         this.onInit = null;
         this.onChange = null;
         this.onComplete = null;
         this.onCancel = null;
         this.onClose = null;
         this.onInitParams = null;
         this.onChangeParams = null;
         this.onCompleteParams = null;
         this.onCloseParams = null;
         this.onCancelParams = null;
         this.firstProp = null;
         this.invokeEvent = false;
      }
      
      public function abort() : void
      {
         this.finished = true;
         this.canceled = true;
         this.clearnup();
      }
      
      public function pause() : void
      {
         if(this.pausing)
         {
            return;
         }
         this.pausing = true;
         this.lastTime = getTimer();
      }
      
      public function resume() : void
      {
         if(!this.pausing)
         {
            return;
         }
         this.pausing = false;
         var _loc1_:Number = getTimer();
         this.startTime = _loc1_ - (this.lastTime - this.startTime);
         this.step(_loc1_);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         this.invokeEvent = true;
      }
   }
}

final class _KTProperty
{
    
   
   public var key:String;
   
   public var from:Number;
   
   public var to:Number;
   
   public var diff:Number;
   
   public var next:_KTProperty;
   
   function _KTProperty(param1:String, param2:Number, param3:Number, param4:_KTProperty = null)
   {
      super();
      this.key = param1;
      this.from = param2;
      this.to = param3;
      this.diff = param3 - param2;
      this.next = param4;
   }
}
