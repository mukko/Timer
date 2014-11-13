package ;
/**
 * 
 * 
 * @auther k_muko
 */
import flash.display.Sprite;
class Field
{
	//Spriteを作成
	//(getter,setter):(可,不可)
	public var field/*(default, null)*/:Sprite;

	static inline var BLACK:UInt = 0x000000;
	
	public function new(x:Int, y:Int, width:Int, height:Int)
	{
		field = new Sprite();
		var graphics = field.graphics;
		graphics.beginFill(BLACK);
		graphics.drawRect(0, 0, width, height);
		graphics.endFill();

		field.x = x;
		field.y = y;
	}
}
