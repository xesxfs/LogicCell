package net.kawa.tween
{
   public class KTween
   {
      
      private static var manager:net.kawa.tween.KTManager = new net.kawa.tween.KTManager();
      
      public static var jobClass:Class = KTJob;
       
      
      public function KTween()
      {
         super();
      }
      
      public static function from(param1:*, param2:Number, param3:Object, param4:Function = null, param5:Function = null) : KTJob
      {
         var _loc6_:KTJob = new jobClass(param1);
         _loc6_.from = param3;
         _loc6_.duration = param2;
         if(param4 != null)
         {
            _loc6_.ease = param4;
         }
         _loc6_.onClose = param5;
         queue(_loc6_);
         return _loc6_;
      }
      
      public static function to(param1:*, param2:Number, param3:Object, param4:Function = null, param5:Function = null) : KTJob
      {
         var _loc6_:KTJob = new jobClass(param1);
         _loc6_.to = param3;
         _loc6_.duration = param2;
         if(param4 != null)
         {
            _loc6_.ease = param4;
         }
         _loc6_.onClose = param5;
         queue(_loc6_);
         return _loc6_;
      }
      
      public static function fromTo(param1:*, param2:Number, param3:Object, param4:Object, param5:Function = null, param6:Function = null) : KTJob
      {
         var _loc7_:KTJob = new jobClass(param1);
         _loc7_.from = param3;
         _loc7_.to = param4;
         _loc7_.duration = param2;
         if(param5 != null)
         {
            _loc7_.ease = param5;
         }
         _loc7_.onClose = param6;
         queue(_loc7_);
         return _loc7_;
      }
      
      public static function queue(param1:KTJob, param2:Number = 0) : void
      {
         if(param1.from is Function)
         {
            throw new ArgumentError("Function is not allowed for the .from property.");
         }
         if(param1.to is Function)
         {
            throw new ArgumentError("Function is not allowed for the .to property.");
         }
         manager.queue(param1,param2);
      }
      
      public static function abort() : void
      {
         manager.abort();
      }
      
      public static function cancel() : void
      {
         manager.cancel();
      }
      
      public static function complete() : void
      {
         manager.complete();
      }
      
      public static function pause() : void
      {
         manager.pause();
      }
      
      public static function resume() : void
      {
         manager.resume();
      }
   }
}
