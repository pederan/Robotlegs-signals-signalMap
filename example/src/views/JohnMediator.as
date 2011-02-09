package views
{
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 8, 2011
	 * @version 1.0
	 */
	public class JohnMediator extends Mediator
	{
		[Inject(name="punched")]
		public var punched:Signal;
		
		[Inject(name="punchedBack")]
		public var punchedBack:Signal;
		
		[Inject(name="actionSignal")]
		public var actionSignal:Signal;
		
		override public function onRegister():void
		{
			punched.add(onPunched);
		}

		private function onPunched(value:String, hardPunch:Boolean):void
		{
			trace("JohnMediator.onPunched() says:", value, hardPunch);
			punchedBack.dispatch("Don't ever punch me agaign! It hurst.");
			actionSignal.dispatch(); //call signal that creates a new action command instance
		}
	}
}
