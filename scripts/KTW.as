package
{
   import net.kawa.tween.KTJob;
   import net.kawa.tween.KTween;
   
   public class KTW
   {
       
      
      public function KTW()
      {
         super();
      }
      
      public static function to(param1:*, param2:Number, param3:Object, param4:Function = null, param5:Function = null, param6:Number = 0, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false) : KTJob
      {
         var _loc10_:KTJob = new KTJob(param1);
         _loc10_.duration = param2;
         _loc10_.to = param3;
         _loc10_.ease = param4;
         _loc10_.onComplete = param5;
         _loc10_.repeat = param8;
         _loc10_.yoyo = param9;
         _loc10_.round = param7;
         KTween.queue(_loc10_,param6);
         return _loc10_;
      }
   }
}
