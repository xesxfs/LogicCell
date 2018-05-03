package
{
   import flash.display.Sprite;
   import net.kawa.tween.easing.Quint;
   
   public class CountDownSprite extends Sprite
   {
       
      
      private var finishBmd:BitmapDisplay;
      
      public function CountDownSprite()
      {
         super();
         mouseChildren = false;
         mouseEnabled = false;
         alpha = 0.9;
         this.finishBmd = new BitmapDisplay(90,44,4290493371);
         this.finishBmd.x = 46;
         this.finishBmd.y = 141;
         this.finishBmd.drawString("3",-1,-1,2236962);
         addChild(this.finishBmd);
         x = 29;
         var dy:int = 141;
         KTW.to(this,1.5,{},null,function():void
         {
            finishBmd.clear();
            finishBmd.drawString("2",-1,-1,2236962);
         });
         KTW.to(this,1,{},null,function():void
         {
            finishBmd.clear();
            finishBmd.drawString("1",-1,-1,2236962);
         },1.5);
         KTW.to(this,1,{},null,function():void
         {
            finishBmd.clear();
            finishBmd.drawString("start",-1,-1,2236962);
         },2.5);
         KTW.to(this,0.2,{"y":-185},Quint.easeIn,null,3.5);
      }
   }
}
