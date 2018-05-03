package
{
   public var LoadingManager:LoadingManagerClass = new LoadingManagerClass();
}

import flash.display.Sprite;
import net.kawa.tween.KTJob;
import net.kawa.tween.easing.Quint;

class LoadingManagerClass extends Sprite
{
    
   
   private var loadingBmd:BitmapDisplay;
   
   private var completeBmd:BitmapDisplay;
   
   public var isLoading:Boolean = false;
   
   private var loadingJob:KTJob;
   
   function LoadingManagerClass()
   {
      super();
      this.loadingBmd = new BitmapDisplay(120,10);
      this.loadingBmd.x = 0;
      this.loadingBmd.y = -10;
      addChild(this.loadingBmd);
      this.completeBmd = new BitmapDisplay(100,10);
      this.completeBmd.x = 0;
      this.completeBmd.y = -10;
      addChild(this.completeBmd);
      alpha = 0.8;
   }
   
   public function sendScoreStart() : void
   {
      this.isLoading = true;
      this.loadingBmd.clear();
      this.loadingBmd.drawString("Sending...",5);
      this.loadingJob = KTW.to(this.loadingBmd,0.2,{"y":5},Quint.easeOut);
   }
   
   public function loadingStart() : void
   {
      this.isLoading = true;
      this.loadingBmd.clear();
      this.loadingBmd.drawString("Loading...",5);
      this.loadingJob = KTW.to(this.loadingBmd,0.2,{"y":5},Quint.easeOut);
   }
   
   public function complete() : void
   {
      this.isLoading = false;
      this.completeBmd.clear();
      this.completeBmd.drawString("Complete",5);
      if(this.loadingJob != null)
      {
         this.loadingJob.complete();
      }
      KTW.to(this.loadingBmd,0.2,{"y":-10},Quint.easeOut);
      KTW.to(this.completeBmd,0.2,{"y":5},Quint.easeOut);
      KTW.to(this.completeBmd,0.2,{"y":-10},Quint.easeOut,null,1);
   }
   
   public function catchError() : void
   {
      if(this.loadingJob != null)
      {
         this.loadingJob.complete();
      }
      KTW.to(this.loadingBmd,0.2,{"y":-10},Quint.easeOut);
      this.isLoading = false;
      this.completeBmd.clear();
      this.completeBmd.drawString("Network Error",5);
      KTW.to(this.completeBmd,0.2,{"y":5},Quint.easeOut);
      KTW.to(this.completeBmd,0.2,{"y":-10},Quint.easeOut,null,2);
   }
}
