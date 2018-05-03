package
{
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class HudManagerScore30 extends Sprite
   {
       
      
      private var scoreBmd:BitmapDisplay;
      
      private var timeBmd:BitmapDisplay;
      
      private var matrix:Matrix;
      
      public function HudManagerScore30()
      {
         super();
         y = 0;
         this.scoreBmd = new BitmapDisplay(120,20,855638016);
         this.scoreBmd.scaleX = 2;
         this.scoreBmd.scaleY = 2;
         addChild(this.scoreBmd);
         this.timeBmd = new BitmapDisplay(60,20);
         this.timeBmd.y = 40;
         this.timeBmd.x = 90;
         addChild(this.timeBmd);
      }
      
      public function update() : void
      {
         this.scoreBmd.clear();
         this.timeBmd.clear();
         this.scoreBmd.drawBorderString("" + Status.drawScore,-1,6);
         this.timeBmd.drawBorderString("" + SetScore30Scene.cnt,-1,6);
      }
   }
}
