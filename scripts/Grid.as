package
{
   public class Grid
   {
       
      
      public var type:int;
      
      public var x:int;
      
      public var y:int;
      
      public var gridX:int;
      
      public var gridY:int;
      
      public var block:Block;
      
      public function Grid(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         this.gridX = param1;
         this.gridY = param2;
         this.x = param3;
         this.y = param4;
      }
      
      public function setBlock(param1:Block) : void
      {
         this.block = param1;
         param1.gridX = this.gridX;
         param1.gridY = this.gridY;
         param1.x = this.x;
         param1.y = this.y;
      }
   }
}
