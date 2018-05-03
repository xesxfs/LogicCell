package
{
   public class StageData
   {
       
      
      public var stageString:String;
      
      public var packNo:int;
      
      public var stageNo:int;
      
      public var stageName:String;
      
      public var star3:int;
      
      public var star2:int;
      
      public var fieldW:int;
      
      public var fieldH:int;
      
      public var fieldData:String;
      
      public var vecBlockData:Vector.<String>;
      
      public var backGroundColor:uint;
      
      public function StageData(param1:String)
      {
         super();
         this.stageString = param1;
         this.convert();
      }
      
      private function convert() : void
      {
         var _loc1_:Array = null;
         _loc1_ = this.stageString.split(",");
         this.star3 = int(_loc1_[0]);
         this.stageNo = int(_loc1_[1]);
         this.stageName = _loc1_[2];
         this.fieldW = int(_loc1_[3]);
         this.fieldH = int(_loc1_[4]);
         this.fieldData = _loc1_[5];
         this.vecBlockData = new Vector.<String>();
         var _loc2_:int = 6;
         while(_loc2_ < _loc1_.length)
         {
            this.vecBlockData.push(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
   }
}
