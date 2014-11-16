package ;
/**
 * 肝のプログラム
 * 
 * @auther k_muko
 */
import flash.utils.Timer;
class StopWatch
{
	static private var timer:Timer;

	//コンストラクタではタイマーオブジェクトを作成するだけ

	public function new()
	{
		timer = new Timer(0);
	}

	/**
	*タイマーを実行する時間をセットする
	* @param	delay	タイマー時間(ms)
**/

	public function delaySetter(delay:Float):Void
	{
		timer.delay = delay;
	}

	public function Starter():Void
	{
		timer.start();
	}

	public function Stopper():Void
	{
		timer.stop();
	}
}
