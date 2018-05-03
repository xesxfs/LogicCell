package
{
   import flash.display.Sprite;
   import net.kawa.tween.easing.Quint;
   
   public class FinishSprite extends Sprite
   {
       
      
      private var finishBmd:BitmapDisplay;
      
      private var menuBmd:BitmapDisplay;
      
      private var retryBmd:BitmapDisplay;
      
      private var tweetBmd:BitmapDisplay;
      
      public function FinishSprite()
      {
         super();
         mouseChildren = false;
         mouseEnabled = false;
         alpha = 0.9;
         this.finishBmd = new BitmapDisplay(90,44,4290493371);
         this.finishBmd.x = 46;
         this.finishBmd.y = -44;
         this.menuBmd = new BitmapDisplay(44,44,4290493371);
         this.menuBmd.x = 69;
         this.menuBmd.y = -128;
         this.retryBmd = new BitmapDisplay(44,44,4290493371);
         this.retryBmd.x = 115;
         this.retryBmd.y = -128;
         this.tweetBmd = new BitmapDisplay(44,44,4290493371);
         this.tweetBmd.x = 161;
         this.tweetBmd.y = -128;
         this.finishBmd.drawString("Finish",-1,-1,2236962);
         this.menuBmd.drawString("Menu",-1,-1,2236962);
         this.retryBmd.drawString("Retry",-1,-1,2236962);
         this.tweetBmd.drawString("Tweet",-1,-1,2236962);
         addChild(this.finishBmd);
         addChild(this.menuBmd);
         addChild(this.retryBmd);
         addChild(this.tweetBmd);
         x = 29;
         KTW.to(this.finishBmd,0.5,{
            "y":141,
            "x":46
         },Quint.easeOut);
         KTW.to(this.finishBmd,0.5,{"x":-23},Quint.easeOut,null,0.6);
         KTW.to(this.menuBmd,0.5,{"y":141},Quint.easeOut,null,0.6);
         KTW.to(this.retryBmd,0.5,{"y":141},Quint.easeOut,null,0.8);
         KTW.to(this.tweetBmd,0.5,{"y":141},Quint.easeOut,null,1);
      }
   }
}
