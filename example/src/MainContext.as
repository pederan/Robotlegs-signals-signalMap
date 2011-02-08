package
{
	import views.Bill;
	import views.BillMediator;
	import views.John;
	import views.JohnMediator;

	import org.robotlegs.base.SignalMap;
	import org.robotlegs.core.ISignalMap;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 8, 2011
	 * @version 1.0
	 */
	public class MainContext extends Context
	{
		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
			var signalMap:ISignalMap = new SignalMap(injector);
			injector.mapValue(ISignalMap, signalMap); //map if needed injected later
			signalMap.createSignal("punched", String, Boolean);
			signalMap.createSignal("punchedBack", String);
			
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
