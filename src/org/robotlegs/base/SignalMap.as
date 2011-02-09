package org.robotlegs.base
{
	import org.osflash.signals.Signal;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.ISignalMap;

	import flash.utils.Dictionary;
	
	/**
	 * SignalMap for creating and mapping new signals on the fly
	 * @author Peder A. Nielsen - Mediafront
	 * @version 1.0
	 */
	
	public class SignalMap implements ISignalMap
	{
		private var injector:IInjector;
		protected var signals:Dictionary;

		public function SignalMap(injector:IInjector) 
		{
			this.injector = injector;
			signals = new Dictionary();
		}
		
		public function createSignal(signalName:String, ...args):Signal
		{
			trace("SignalMap.createSignal", signalName, args);
			var signal:Signal = new Signal(args);
			injector.mapValue(Signal, signal, signalName);
			if(!signals[signalName])
				signals[signalName] = signal;
			
			return signals[signalName];
		}

		public function deleteSignal(signalName:String):void
		{
			if(signals[signalName])
			{
				delete signals[signalName];
				injector.unmap(Signal, signalName);
			}
		}
		
		public function hasSignal(signalName:String):Boolean
		{
			return signals[signalName] ? true : false;
		}

	}
}
