package ;
/**
 * フィールドの表示、範囲は描画範囲全体
 * なのでx,yは0になる
 * @auther k_muko
 */
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
		startButton = ButtonCreator(0, 0, "../res/start.png");
		stage.addChild(startButton);
	}
	
	private function ButtonCreator(x:Int, y:Int, filepath:String):Sprite
	{
		var sprite:Sprite = new Sprite();
		var loader:Loader = new Loader();
		var url : URLRequest = new URLRequest(filepath);
		loader.load(url);
		sprite.x = 100;
		sprite.y = 100;
		sprite.addChild(loader);
		
		return sprite;
	}
}
