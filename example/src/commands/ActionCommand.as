package commands
{
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Peder A. Nielsen - Mediafront
	 * @date Feb 9, 2011
	 * @version 1.0
	 */
	public class ActionCommand extends SignalCommand
	{
		override public function execute():void
		{
			trace("I'm am ActionCommand. Did someone call for me?");
		}
	}
}
