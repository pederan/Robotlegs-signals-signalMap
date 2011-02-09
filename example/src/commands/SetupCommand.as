package commands
{
	import org.osflash.signals.Signal;
	import views.BillMediator;
	import views.Bill;
	import views.JohnMediator;
	import views.John;
	import org.robotlegs.core.ISignalMap;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 9, 2011
	 * @version 1.0
	 */
	public class SetupCommand extends SignalCommand
	{
		[Inject]
		public var signalMap:ISignalMap;
		
		override public function execute():void
		{
			signalMap.createSignal("punched", String, Boolean);
			signalMap.createSignal("punchedBack", String);
			
			//create and map command signal
			var actionSignal:Signal = signalMap.createSignal("actionSignal");
			signalCommandMap.mapSignal(actionSignal, ActionCommand);
			
			//injector.mapValue(ISignalMap, signalMap); //map signalMap instance if you need to inject it in other app tiers for new creations
//			trace(signalMap.hasSignal("punchedBack")); //check if signal is ceated and mapped
//			signalMap.deleteSignal("punchedBack"); //delete and unmap signal
//			trace(signalMap.hasSignal("punchedBack")); //signal is now deleted and unmapped

			mediatorMap.mapView(John, JohnMediator);
			mediatorMap.mapView(Bill, BillMediator);
			
			var john:John = new John();
			contextView.addChild(john);
			
			var bill:Bill = new Bill();
			contextView.addChild(bill);
		}
	}
}
