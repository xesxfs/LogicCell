package
{
   import net.kawa.tween.KTJob;
   import flash.geom.Point;
   import flash.media.Sound;
   
   public class Field extends BitmapDisplay
   {
      
      public static var fieldX:int;
      
      public static var fieldY:int;
       
      
      public var vec2Grid:Vector.<Vector.<Grid>>;
      
      public var fieldW:int;
      
      public var fieldH:int;
      
      public var matchingJob:KTJob;
      
      private var exScore:int;
      
      public var stageData:StageData;
      
      private var vecSound:Vector.<Sound>;
      
      public function Field(param1:StageData)
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Grid = null;
         this.vecSound = Vector.<Sound>([Resource.soundC,Resource.soundD,Resource.soundE,Resource.soundF,Resource.soundG,Resource.soundA,Resource.soundB,Resource.soundCC]);
         this.stageData = param1;
         this.fieldW = param1.fieldW;
         this.fieldH = param1.fieldH;
         super(this.fieldW * 45,this.fieldH * 45);
         x = int(120 - width / 2);
         y = int(110 - height / 2) + 30;
         fieldX = x;
         fieldY = y;
         this.vec2Grid = new Vector.<Vector.<Grid>>();
         _loc2_ = 0;
         while(_loc2_ < this.fieldW)
         {
            this.vec2Grid.push(new Vector.<Grid>());
            _loc3_ = 0;
            while(_loc3_ < this.fieldH)
            {
               _loc4_ = new Grid(_loc2_,_loc3_,x + 45 * _loc2_,y + 45 * _loc3_);
               _loc4_.type = int(param1.fieldData.charAt(_loc2_ * this.fieldH + _loc3_));
               this.vec2Grid[_loc2_].push(_loc4_);
               if(_loc4_.type == 1)
               {
                  drawBorderRect(45 * _loc2_ + 2,45 * _loc3_ + 2,40,40,4,587202559,0);
               }
               _loc3_++;
            }
            _loc2_++;
         }
         BlockManager.reset(this);
         BlockManager.AddAllBlock(param1.vecBlockData,false);
         BlockManager.addUndoString();
      }
      
      public function getGrid(param1:int, param2:int) : Grid
      {
         var gridX:int = param1;
         var gridY:int = param2;
         try
         {
            return this.vec2Grid[gridX][gridY];
         }
         catch(e:Error)
         {
            return null;
         }
         return null;
      }
      
      public function matchCheck() : void
      {
         var i:int = 0;
         var j:int = 0;
         var gridX:int = 0;
         var gridY:int = 0;
         var blockColor:int = 0;
         var point:Point = null;
         var grid:Grid = null;
         var block:Block = null;
         var grid1:Grid = null;
         var grid2:Grid = null;
         var checkBlock1:Block = null;
         var checkBlock2:Block = null;
         var addScore:int = 0;
         var combo:int = 0;
         var mode:int = 0;
         Status.combo++;
         this.matchingJob = null;
         var nestFlag:Boolean = false;
         i = 0;
         while(i < this.fieldW)
         {
            j = 0;
            while(j < this.fieldH)
            {
               grid = this.vec2Grid[i][j];
               if(grid.block != null)
               {
                  block = grid.block;
                  blockColor = block.vecLayer[0];
                  grid1 = this.getGrid(i + 1,j);
                  grid2 = this.getGrid(i,j + 1);
                  if(grid1 != null)
                  {
                     checkBlock1 = grid1.block;
                  }
                  else
                  {
                     checkBlock1 = null;
                  }
                  if(grid2 != null)
                  {
                     checkBlock2 = grid2.block;
                  }
                  else
                  {
                     checkBlock2 = null;
                  }
                  if(checkBlock1 != null && checkBlock1.vecLayer[0] == blockColor)
                  {
                     checkBlock1.removeFlag = true;
                     block.removeFlag = true;
                     nestFlag = true;
                  }
                  if(checkBlock2 != null && checkBlock2.vecLayer[0] == blockColor)
                  {
                     checkBlock2.removeFlag = true;
                     block.removeFlag = true;
                     nestFlag = true;
                  }
               }
               j++;
            }
            i++;
         }
         var length:int = BlockManager.vecBlock.length;
         i = 0;
         while(i < length)
         {
            block = BlockManager.vecBlock[i];
            if(block.removeFlag && block.removeLayer())
            {
               i--;
               length--;
            }
            i++;
         }
         if(nestFlag)
         {
            if(Status.combo < 8)
            {
               this.vecSound[Status.combo - 1].play(0,0,SoundManager.soundTransform);
            }
            else
            {
               this.vecSound[7].play(0,0,SoundManager.soundTransform);
            }
            this.matchingJob = KTW.to(this,0.5,{},null,function():void
            {
               matchCheck();
            });
         }
         else
         {
            addScore = Status.score - this.exScore;
            combo = Status.combo - 1;
            if(Status.maxCombo < combo)
            {
               Status.maxCombo = combo;
            }
            mode = Status.mode;
            if(mode > 0 && mode != 4 && BlockManager.vecBlock.length == 0)
            {
               Status.combo = Status.combo - 1;
               i = 0;
               while(i < 9)
               {
                  if(i != 4)
                  {
                     EffectManager.addEffect(new EffectScore("" + Status.addScore(),i / 3,i % 3));
                  }
                  else
                  {
                     EffectManager.addEffect(new EffectScore("Bonus!",i / 3,i % 3));
                  }
                  i++;
               }
            }
            Status.combo = 0;
            if(mode == 0 && !BlockManager.clearCheck())
            {
               BlockManager.addUndoString();
            }
            else if(mode == 1)
            {
               BlockManager.finishCheck(SetScoreScene);
            }
            else if(mode == 2)
            {
               if(SetScore30Scene.cnt == 0)
               {
                  BlockManager.finish(SetScore30Scene);
               }
               BlockManager.finishCheck(SetScore30Scene);
            }
            else if(Status.mode == 3)
            {
               BlockManager.finishCheck(SetScore1minScene);
            }
            else if(Status.mode == 4 && (Status.score != 0 || BlockManager.vecBlock.length == 20))
            {
               BlockManager.finish(SetScore1comboScene);
            }
         }
      }
      
      public function mouseUpField(param1:int, param2:int) : void
      {
         var gridX:int = param1;
         var gridY:int = param2;
         var grid:Grid = this.getGrid(gridX,gridY);
         var mouseDownBlock:Block = BlockManager.mouseDownBlock;
         if(grid != null && grid.block == null && grid.type == 1)
         {
            grid.setBlock(mouseDownBlock);
            BlockManager.vecInventoryBlock[mouseDownBlock.inventoryNumber] = null;
            BlockManager.vecBlock.push(mouseDownBlock);
            if(Status.mode > 0)
            {
               BlockManager.addRandomInventoryBlock(BlockManager.mouseDownBlock.inventoryNumber);
            }
            if(Status.mode == 2)
            {
               SetScore30Scene.cnt--;
            }
            BlockManager.mouseDownBlock = null;
            this.exScore = Status.score;
            this.matchingJob = KTW.to(this,0.2,{},null,function():void
            {
               matchCheck();
            });
         }
         else
         {
            BlockManager.mouseUp();
         }
      }
      
      public function resetGridBlock() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.fieldW)
         {
            _loc2_ = 0;
            while(_loc2_ < this.fieldH)
            {
               this.vec2Grid[_loc1_][_loc2_].block = null;
               _loc2_++;
            }
            _loc1_++;
         }
      }
   }
}
