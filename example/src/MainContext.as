package
{
	import commands.SetupCommand;

	import signals.ApplicationStartedSignal;

	import org.robotlegs.base.SignalMap;
	import org.robotlegs.core.ISignalMap;
	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 8, 2011
	 * @version 1.0
	 */
	public class MainContext extends SignalContext
	{
		public function MainContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
			var signalMap:ISignalMap = new SignalMap(injector);
			injector.mapValue(ISignalMap, signalMap); //map for injection in SetupCommand
			
			ApplicationStartedSignal(signalCommandMap.mapSignalClass(ApplicationStartedSignal, SetupCommand, true)).dispatch();
			
		}
	}
}
