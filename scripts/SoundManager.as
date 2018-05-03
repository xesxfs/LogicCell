package
{
   public var SoundManager:SoundManagerClass = new SoundManagerClass();
}

import flash.media.SoundTransform;

class SoundManagerClass
{
    
   
   public var soundTransform:SoundTransform;
   
   function SoundManagerClass()
   {
      this.soundTransform = new SoundTransform();
      super();
      this.volumeReset();
   }
   
   public function volumeReset() : void
   {
      if(SharedManager.sound)
      {
         this.soundTransform.volume = 0.8;
      }
      else
      {
         this.soundTransform.volume = 0;
      }
   }
}
