package org.robotlegs.core
{
	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 8, 2011
	 * @version 1.0
	 */
	public interface ISignalMap
	{
		function createSignal(signalName:String, ...args):void
		function deleteSignal(signalName:String):void
		function hasSignal(signalName:String):Boolean
	}
}
