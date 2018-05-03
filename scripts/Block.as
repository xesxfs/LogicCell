package
{
   import flash.display.BitmapData;
   
   public class Block extends BitmapDisplay
   {
      
      private static var CHIP:BitmapData = Resource.chip;
      
      public static var COLOR:Vector.<uint> = Vector.<uint>([4282664191,4294919236,4282711876,4294967074,4294919423]);
       
      
      public var vecLayer:Vector.<int>;
      
      public var drawPhase:int = 8;
      
      public var gridX:int;
      
      public var gridY:int;
      
      public var inventoryNumber:int;
      
      public var removeFlag:Boolean = false;
      
      public function Block()
      {
         this.vecLayer = new Vector.<int>();
         super(44,44);
      }
      
      public function setLayer(... rest) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = rest.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.vecLayer.push(rest[_loc2_]);
            _loc2_++;
         }
      }
      
      public function removeLayer() : Boolean
      {
         EffectManager.addEffect(new EffectScore("" + Status.addScore(),this.gridX,this.gridY));
         this.removeFlag = false;
         this.drawPhase = 3;
         EffectManager.addEffect(new EffectLayerErase(this.gridX,this.gridY,COLOR[this.vecLayer[0]]));
         this.vecLayer.shift();
         if(this.vecLayer.length != 0)
         {
            this.draw();
            return false;
         }
         this.destroy();
         return true;
      }
      
      public function destroy() : void
      {
         BlockManager.removeBlock(this);
      }
      
      public function draw() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.vecLayer.length;
         if(this.drawPhase == 9)
         {
            return;
         }
         this.drawPhase++;
         clear();
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            copy(CHIP,((2 - _loc1_) * 5 + this.drawPhase) * 44,this.vecLayer[_loc1_] * 44,44,44);
            _loc1_++;
         }
      }
      
      public function update() : void
      {
         this.draw();
      }
   }
}
