package ;
/**
 * フィールドの表示、範囲は描画範囲全体
 * なのでx,yは0になる
 * @auther k_muko
 */

import flash.events.MouseEvent;
import flash.events.Event;
import flash.net.URLRequest;
import flash.display.Loader;
import flash.Lib;
import flash.display.Sprite;
class Field
{
	//Spriteを作成
	//(getter,setter):(可,不可)
	public var field(default, null):Sprite;
	public var startButton(default, null):Sprite;
	public var stopButton(default, null):Sprite;
	public var timer : StopWatch = new StopWatch();
	
	static inline var BLACK:UInt = 0x000000;
	static inline var x:Int = 0;
	static inline var y:Int = 0;
	
	
	public function new()
	{
		//描画範囲を決定。描画する
		field = new Sprite();
		
		var graphics = field.graphics;
		var stage = Lib.current.stage; 
		
		var width = stage.stageWidth;
		var height = stage.stageHeight;
		
		graphics.beginFill(0xffffff);
		graphics.drawRect(x, y, width, height);
		graphics.endFill();
		
		field.x = x;
		field.y = y;
		stage.addChild(field);
		trace(width,height);
		
		//ボタンを作成,配置する
		//filepathはswfファイルからの相対パス
		//x,yにマジックナンバー使っちゃうけど、拡張する気もないしいいかな...
		var buttonX:Int = Math.floor((width/2)-100);
		var buttonY:Int = Math.floor(height/2);
		
		startButton = ButtonCreator(buttonX, buttonY, "../res/start.png");
		stage.addChild(startButton);
		
		stopButton = ButtonCreator(buttonX, buttonY + Math.floor(buttonY/2), "../res/stop.png");
		stage.addChild(stopButton);
		
		startButton.addEventListener(MouseEvent.CLICK, startClick);
		stopButton.addEventListener(MouseEvent.CLICK, stopClick)
		stage.addEventListener(Event.ENTER_FRAME, stage_EnterFrame);
	}
	
	private function ButtonCreator(x:Int, y:Int, filepath:String):Sprite
	{
		var sprite:Sprite = new Sprite();
		var loader:Loader = new Loader();
		var url : URLRequest = new URLRequest(filepath);
		loader.load(url);
		sprite.x = x;
		sprite.y = y;
		sprite.addChild(loader);

		return sprite;
	}
	
	private function startClick(event:MouseEvent):Void
	{
		var clickButton:Sprite = event.target;
		if(clickButton == startButton){
			var time : Int = 1000 * 3;
			timer.delaySetter(time);
		}else{
			timer.Stopper();
		}
	}
	
	private function stopClick(event:MouseEvent):Void
	{
		
	}
	
	private function stage_EnterFrame(event:Event):Void
	{
	}
}
