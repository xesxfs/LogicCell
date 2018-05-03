package
{
   import flash.display.Sprite;
   import net.kawa.tween.easing.Quint;
   
   public class ClearSprite extends Sprite
   {
       
      
      private var clearBmd:BitmapDisplay;
      
      private var menuBmd:BitmapDisplay;
      
      private var retryBmd:BitmapDisplay;
      
      private var nextBmd:BitmapDisplay;
      
      public function ClearSprite(param1:Boolean = false)
      {
         super();
         mouseChildren = false;
         mouseEnabled = false;
         alpha = 0.9;
         this.clearBmd = new BitmapDisplay(90,44,4290493371);
         this.clearBmd.x = 46;
         this.clearBmd.y = -44;
         this.menuBmd = new BitmapDisplay(44,44,4290493371);
         this.menuBmd.x = 69;
         this.menuBmd.y = -128;
         this.retryBmd = new BitmapDisplay(44,44,4290493371);
         this.retryBmd.x = 115;
         this.retryBmd.y = -128;
         this.nextBmd = new BitmapDisplay(44,44,4290493371);
         this.nextBmd.x = 161;
         this.nextBmd.y = -128;
         if(param1)
         {
            this.clearBmd.drawString("Perfect",-1,-1,2236962);
         }
         else
         {
            this.clearBmd.drawString("Clear",-1,-1,2236962);
         }
         this.menuBmd.drawString("Menu",-1,-1,2236962);
         this.retryBmd.drawString("Retry",-1,-1,2236962);
         if(StageManager.index == 24)
         {
            this.nextBmd.drawString("Tweet",-1,-1,2236962);
         }
         else
         {
            this.nextBmd.drawString("Next",-1,-1,2236962);
         }
         addChild(this.clearBmd);
         addChild(this.menuBmd);
         addChild(this.retryBmd);
         addChild(this.nextBmd);
         x = 29;
         KTW.to(this.clearBmd,0.5,{
            "y":141,
            "x":46
         },Quint.easeOut);
         KTW.to(this.clearBmd,0.5,{"x":-23},Quint.easeOut,null,0.6);
         KTW.to(this.menuBmd,0.5,{"y":141},Quint.easeOut,null,0.6);
         KTW.to(this.retryBmd,0.5,{"y":141},Quint.easeOut,null,0.8);
         KTW.to(this.nextBmd,0.5,{"y":141},Quint.easeOut,null,1);
      }
   }
}
