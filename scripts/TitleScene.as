package
{
   import flash.display.Bitmap;
   import net.kawa.tween.easing.Linear;
   
   public class TitleScene extends Scene
   {
       
      
      private var bitmap:Bitmap;
      
      private var bitmap2:Bitmap;
      
      public function TitleScene()
      {
         super();
         this.bitmap = new Bitmap(Resource.logicalCell);
         this.bitmap.scaleX = 4;
         this.bitmap.scaleY = 4;
         this.bitmap.x = 120 - this.bitmap.width / 2;
         this.bitmap.y = 162 - this.bitmap.height / 2;
         addChild(this.bitmap);
         this.bitmap.alpha = 0;
         this.bitmap2 = new Bitmap(new BitmapString("Logical Cell",16777215));
         this.bitmap2.scaleX = 2;
         this.bitmap2.scaleY = 2;
         this.bitmap2.x = 120 - this.bitmap2.width / 2;
         this.bitmap2.y = 222;
         addChild(this.bitmap2);
         this.bitmap2.alpha = 0;
         KTW.to(this.bitmap,3,{"alpha":0.5},Linear.easeIn);
         KTW.to(this.bitmap,1,{"alpha":0},Linear.easeIn,this.next2,3);
         KTW.to(this.bitmap2,3,{"alpha":0.5},Linear.easeIn);
         KTW.to(this.bitmap2,1,{"alpha":0},Linear.easeIn,null,3);
      }
      
      private function next2() : void
      {
         if(SharedManager.userName != "")
         {
            SceneManager.newScene(new SelectScene());
         }
         else
         {
            SceneManager.newScene(new NameScene());
         }
      }
      
      override public function update() : void
      {
      }
   }
}
