package ;
/**
 * 肝のプログラム
 * 
 * @auther k_muko
 */
import flash.net.URLRequest;
import flash.media.Sound;
import flash.events.TimerEvent;
import flash.utils.Timer;
class StopWatch
{
	static private var timer:Timer;
	private var loop:Int = 20000000;
	private var number:Int = 1;
	private var sound1:Sound = new Sound(new URLRequest("../res/button02a.mp3"));
	private var sound2:Sound = new Sound(new URLRequest("../res/button01a.mp3"));
	
	/**
	*コンストラクタは1つのみ
	* timerのインスタンスを作成し、それをイベントに登録する
	**/
	public function new()
	{
		timer = new Timer(0);
		timer.addEventListener(TimerEvent.TIMER,function(e:TimerEvent):Void
	{
		if((number % 5) == 0){
			sound2.play();
		}else{
			sound1.play();
		}
		number++;
	});
		timer.addEventListener(TimerEvent.TIMER_COMPLETE ,function (e:TimerEvent):Void
	{
		trace("done!");
	});
	}

	/**
	*タイマーを実行する時間をセットする
	* @param	delay	タイマー時間(ms)
**/

	public function delaySetter(delay:Int):Void
	{
		timer.delay = delay;
		timer.repeatCount = loop;
	}
	
	public function Starter():Void
	{
		timer.start();
	}
	
	public function Stopper():Void
	{
		timer.stop();
	}
	
	public function update():Void
	{
	
	}
}
