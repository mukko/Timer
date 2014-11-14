package ;
/**
 * 
 * 
 * @auther k_muko
 */
import flash.net.URLRequest;
import flash.display.Loader;
class Button
{
	public function new(x:Int, y:Int, filepath:String)
	{
		var loader:Loader = new Loader();
		loader.x = x;
		loader.y = y;
		
		loader.load(new URLRequest(filepath));
	}
}
