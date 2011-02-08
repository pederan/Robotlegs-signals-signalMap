package views
{
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 8, 2011
	 * @version 1.0
	 */
	public class BillMediator extends Mediator
	{
		[Inject(name="punched")]
		public var punched:Signal;
		
		[Inject(name="punchedBack")]
		public var punchedBack:Signal;
		
		override public function onRegister():void
		{
			punchedBack.add(onPunchedBack);
			punched.dispatch("John punched", true);
		}

		private function onPunchedBack(value:String):void
		{
			trace("BillMediator.onPunchedBack() says:", value);
		}
	}
}
