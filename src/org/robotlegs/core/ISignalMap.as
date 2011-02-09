package org.robotlegs.core
{
	import org.osflash.signals.Signal;
	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 8, 2011
	 * @version 1.0
	 */
	public interface ISignalMap
	{
		function createSignal(signalName:String, ...args):Signal
		function deleteSignal(signalName:String):void
		function hasSignal(signalName:String):Boolean
	}
}
