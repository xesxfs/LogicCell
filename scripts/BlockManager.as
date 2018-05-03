package
{
   public var BlockManager:BlockManagerClass = new BlockManagerClass();
}

import flash.display.Sprite;
import flash.utils.getTimer;

class BlockManagerClass extends Sprite
{
    
   
   public var vecBlock:Vector.<Block>;
   
   public var vecInventoryBlock:Vector.<Block>;
   
   public var field:Field;
   
   public var mouseDownBlock:Block;
   
   public var vec2UndoString:Vector.<Vector.<String>>;
   
   public var inventoryPadding:int = 0;
   
   function BlockManagerClass()
   {
      super();
   }
   
   public function reset(param1:Field) : void
   {
      removeChildren();
      this.vecBlock = new Vector.<Block>();
      this.vecInventoryBlock = Vector.<Block>([null,null,null,null,null]);
      this.vec2UndoString = new Vector.<Vector.<String>>();
      this.field = param1;
      this.inventoryPadding = 0;
   }
   
   public function update() : void
   {
      var _loc1_:int = 0;
      var _loc2_:int = this.vecBlock.length;
      _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         this.vecBlock[_loc1_].update();
         _loc1_++;
      }
      if(this.mouseDownBlock != null)
      {
         this.mouseDownBlock.x = BlockManager.mouseX - 22;
         this.mouseDownBlock.y = BlockManager.mouseY - 22;
      }
   }
   
   public function addBlock(param1:Block) : void
   {
      this.vecBlock.push(param1);
      addChild(param1);
   }
   
   public function addInventoryBlock(param1:Block, param2:int) : void
   {
      while(this.vecInventoryBlock.length < param2)
      {
         this.vecInventoryBlock.push(null);
      }
      this.vecInventoryBlock[param2] = param1;
      param1.x = param2 * 48 + 2 + this.inventoryPadding;
      param1.y = 240;
      param1.inventoryNumber = param2;
      addChild(param1);
   }
   
   public function addRandomInventoryBlock(param1:int) : void
   {
      var _loc2_:Block = new Block();
      _loc2_.inventoryNumber = param1;
      this.addInventoryBlock(_loc2_,param1);
      if(Status.mode == 1)
      {
         _loc2_.vecLayer.push(Math.random() * 5,Math.random() * 5,Math.random() * 5,Math.random() * 5);
      }
      else if(Status.mode == 2)
      {
         _loc2_.vecLayer.push(Math.random() * 4,Math.random() * 4,Math.random() * 4,Math.random() * 4);
      }
      else if(Status.mode == 3)
      {
         _loc2_.vecLayer.push(Math.random() * 3,Math.random() * 3,Math.random() * 3,Math.random() * 3);
      }
      else if(Status.mode == 4)
      {
         _loc2_.vecLayer.push(Math.random() * 5,Math.random() * 5,Math.random() * 5,Math.random() * 5);
      }
      _loc2_.draw();
   }
   
   public function removeBlock(param1:Block) : void
   {
      var _loc2_:int = 0;
      var _loc3_:int = this.vecBlock.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(param1 == this.vecBlock[_loc2_])
         {
            this.vecBlock.splice(_loc2_,1);
            removeChild(param1);
            this.field.getGrid(param1.gridX,param1.gridY).block = null;
            break;
         }
         _loc2_++;
      }
   }
   
   public function removeInventoryBlock(param1:Block) : void
   {
      var _loc2_:int = 0;
      var _loc3_:int = this.vecInventoryBlock.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(param1 == this.vecInventoryBlock[_loc2_])
         {
            this.vecInventoryBlock.splice(_loc2_,1);
            removeChild(param1);
            break;
         }
         _loc2_++;
      }
   }
   
   public function mouseDownInventory(param1:int) : void
   {
      if(this.vecInventoryBlock.length <= param1)
      {
         return;
      }
      var _loc2_:Block = this.vecInventoryBlock[param1];
      if(_loc2_ != null)
      {
         this.mouseDownBlock = _loc2_;
         setChildIndex(_loc2_,numChildren - 1);
      }
   }
   
   public function mouseUp() : void
   {
      if(this.mouseDownBlock != null)
      {
         KTW.to(this.mouseDownBlock,0.1,{
            "x":this.mouseDownBlock.inventoryNumber * 48 + 2 + this.inventoryPadding,
            "y":240
         });
         this.mouseDownBlock = null;
      }
   }
   
   public function undo() : void
   {
      if(this.field.matchingJob != null)
      {
         return;
      }
      if(this.vec2UndoString.length <= 1)
      {
         return;
      }
      removeChildren();
      this.vecBlock = new Vector.<Block>();
      this.vecInventoryBlock = new Vector.<Block>();
      this.field.resetGridBlock();
      this.AddAllBlock(this.vec2UndoString[this.vec2UndoString.length - 2]);
      this.vec2UndoString.pop();
      if(SceneManager.scene is SetPuzzleScene)
      {
         if(this.vec2UndoString.length == 1)
         {
            SetPuzzleScene(SceneManager.scene).undoBmd.alpha = 0.2;
         }
         else
         {
            SetPuzzleScene(SceneManager.scene).undoBmd.alpha = 0.8;
         }
      }
   }
   
   public function addUndoString() : void
   {
      var _loc1_:int = 0;
      var _loc2_:int = 0;
      var _loc4_:String = null;
      var _loc5_:Block = null;
      var _loc3_:Vector.<String> = new Vector.<String>();
      _loc1_ = 0;
      while(_loc1_ < this.vecBlock.length)
      {
         _loc5_ = this.vecBlock[_loc1_];
         _loc4_ = "" + _loc5_.gridX + _loc5_.gridY;
         _loc2_ = 0;
         while(_loc2_ < _loc5_.vecLayer.length)
         {
            _loc4_ = _loc4_ + _loc5_.vecLayer[_loc2_];
            _loc2_++;
         }
         _loc3_.push(_loc4_);
         _loc1_++;
      }
      _loc1_ = 0;
      while(_loc1_ < this.vecInventoryBlock.length)
      {
         _loc5_ = this.vecInventoryBlock[_loc1_];
         if(_loc5_ != null)
         {
            _loc4_ = "" + 9 + _loc5_.inventoryNumber;
            _loc2_ = 0;
            while(_loc2_ < _loc5_.vecLayer.length)
            {
               _loc4_ = _loc4_ + _loc5_.vecLayer[_loc2_];
               _loc2_++;
            }
            _loc3_.push(_loc4_);
         }
         _loc1_++;
      }
      if(this.vec2UndoString.length != 0)
      {
         _loc3_.push("" + Status.score);
      }
      else
      {
         _loc3_.push("0");
      }
      this.vec2UndoString.push(_loc3_);
      if(SceneManager.scene is SetPuzzleScene)
      {
         if(this.vec2UndoString.length == 1)
         {
            SetPuzzleScene(SceneManager.scene).undoBmd.alpha = 0.2;
         }
         else
         {
            SetPuzzleScene(SceneManager.scene).undoBmd.alpha = 0.8;
         }
      }
   }
   
   public function AddAllBlock(param1:Vector.<String>, param2:Boolean = true) : void
   {
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      var _loc6_:String = null;
      var _loc7_:Block = null;
      var _loc8_:int = 0;
      var _loc9_:int = 0;
      var _loc5_:int = param1.length;
      if(param2)
      {
         _loc5_--;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc6_ = param1[_loc3_];
         _loc8_ = int(_loc6_.charAt(0));
         _loc9_ = int(_loc6_.charAt(1));
         _loc7_ = new Block();
         _loc4_ = 2;
         while(_loc4_ < _loc6_.length)
         {
            _loc7_.vecLayer.push(int(_loc6_.charAt(_loc4_)));
            _loc4_++;
         }
         if(_loc8_ == 9)
         {
            this.addInventoryBlock(_loc7_,_loc9_);
         }
         else
         {
            this.field.getGrid(_loc8_,_loc9_).setBlock(_loc7_);
            this.addBlock(_loc7_);
         }
         _loc7_.draw();
         _loc3_++;
      }
      while(this.vecInventoryBlock.length < 5)
      {
         this.vecInventoryBlock.push(null);
      }
      if(param2)
      {
         Status.score = int(param1[_loc3_]);
         Status.drawScore = Status.score;
      }
   }
   
   public function clearCheck() : Boolean
   {
      var i:int = 0;
      var length:int = this.vecInventoryBlock.length;
      if(this.vecBlock.length != 0)
      {
         return false;
      }
      i = 0;
      while(i < length)
      {
         if(this.vecInventoryBlock[i] != null)
         {
            return false;
         }
         i++;
      }
      InputManager.newInput(null);
      KTW.to(this,1,{},null,function():void
      {
         InputManager.newInput(InputClear);
      });
      if(this.field.stageData.star3 <= Status.score)
      {
         parent.addChild(new ClearSprite(true));
         SharedManager.vecPuzzleClear[this.field.stageData.stageNo - 1] = 2;
      }
      else
      {
         parent.addChild(new ClearSprite(false));
         if(SharedManager.vecPuzzleClear[this.field.stageData.stageNo - 1] != 2)
         {
            SharedManager.vecPuzzleClear[this.field.stageData.stageNo - 1] = 1;
         }
      }
      SharedManager.saveVecPuzzleClear();
      return true;
   }
   
   public function finishCheck(param1:Class) : Boolean
   {
      var _loc3_:int = this.vecInventoryBlock.length;
      if(this.vecBlock.length != 9)
      {
         return false;
      }
      this.finish(param1);
      return true;
   }
   
   public function finish(param1:Class) : void
   {
      var retryScene:Class = param1;
      InputManager.newInput(null);
      InputFinish.retryScene = retryScene;
      Status.finishTime = getTimer();
      var score:int = Status.score;
      switch(Status.mode)
      {
         case 1:
            SharedManager.saveScore(score);
            break;
         case 2:
            SharedManager.saveScore30(score);
            SetScore30Scene.isFinish = true;
            break;
         case 3:
            SharedManager.saveScore1min(score);
            SetScore1minScene.isFinish = true;
            break;
         case 4:
            SharedManager.saveScore1combo(score);
            SetScore1minScene.isFinish = true;
      }
      DbManager.sendScore(Status.mode);
      KTW.to(this,1,{},null,function():void
      {
         InputManager.newInput(InputFinish);
      });
      parent.addChild(new FinishSprite());
   }
   
   public function adjustInventoryPosition() : void
   {
      var _loc1_:int = 0;
      var _loc3_:Block = null;
      var _loc2_:int = this.vecInventoryBlock.length;
      _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         _loc3_ = this.vecInventoryBlock[_loc1_];
         if(_loc3_ != null)
         {
            _loc3_.x = _loc3_.x + this.inventoryPadding;
         }
         _loc1_++;
      }
   }
}
