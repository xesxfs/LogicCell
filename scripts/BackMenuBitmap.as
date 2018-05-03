package
{
   public var BackMenuBitmap:BackMenuBitmapClass = new BackMenuBitmapClass();
}

import net.kawa.tween.KTJob;
import flash.geom.Rectangle;
import net.kawa.tween.easing.Quint;
import flash.geom.Point;

class BackMenuBitmapClass extends BitmapDisplay
{
    
   
   private var job:KTJob;
   
   private var cnt:int = 0;
   
   private var updateFlag:Boolean = false;
   
   public var menuRect:Rectangle;
   
   function BackMenuBitmapClass()
   {
      alpha = 0.9;
      super(90,44,4290493371);
      drawString("Back to Menu",-1,21,2236962);
      y = -128;
      x = 75;
   }
   
   public function updateStart() : void
   {
      if(this.updateFlag)
      {
         return;
      }
      if(this.job != null)
      {
         this.job.abort();
      }
      this.job = KTW.to(this,0.2,{"y":134},Quint.easeOut);
      this.cnt = 0;
      this.updateFlag = true;
   }
   
   public function updateFinish() : void
   {
      if(!this.updateFlag)
      {
         return;
      }
      if(this.job != null)
      {
         this.job.abort();
      }
      this.job = KTW.to(this,0.2,{"y":-128},Quint.easeIn);
      this.cnt = 0;
      this.updateFlag = false;
   }
   
   public function update() : void
   {
      if(!this.updateFlag)
      {
         return;
      }
      var mx:int = parent.mouseX;
      var my:int = parent.mouseY;
      if(!this.menuRect.containsPoint(new Point(mx,my)))
      {
         this.updateFinish();
      }
      drawRect(1,10,89,1,4290493371);
      drawRect(0,10,89 * this.cnt / 40,1,4280427042);
      if(this.cnt == 40)
      {
         this.updateFinish();
         KTW.to(this,0,{},null,function():void
         {
            SceneManager.newScene(new SelectScene());
         },0.2);
      }
      this.cnt++;
   }
}
