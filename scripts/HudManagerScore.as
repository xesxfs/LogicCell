package
{
   public class HudManagerScore extends BitmapDisplay
   {
       
      
      public function HudManagerScore()
      {
         y = 0;
         super(120,20,855638016);
         scaleX = 2;
         scaleY = 2;
      }
      
      public function update() : void
      {
         clear();
         drawBorderString("" + Status.drawScore,-1,6);
      }
   }
}
