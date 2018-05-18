 class Main extends egret.Sprite {

	public constructor()
	{
		super();
		var _self__:any = this;
		this.stage.scaleMode = egret.StageScaleMode.SHOW_ALL;
		this.stage["align"] = flash.StageAlign.TOP_RIGHT;
		Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		_self__.addChild(BackBitmap);
		_self__.addChild(new Game());
	}

}

flash.extendsClass("Main","egret.Sprite")
