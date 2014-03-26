package carlylee.events
{
	import flash.events.Event;
	
	public class XMLLoaderEvent extends Event
	{
		public static const DATA_COMPLETE: String = "dataComplete";
		public static const COMPLETE_ERROR:String = "completeError";
		
		public var xml: XML;
		public var error:String;
		
		public function XMLLoaderEvent( type:String, xml:XML, error:String="", bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super(type, bubbles, cancelable);
			this.xml = xml;
			this.error = error;
		}
		
		public override function clone():Event{
			return new XMLLoaderEvent( type, xml, error, bubbles, cancelable );
		}
		
		public override function toString():String{
			return formatToString( "XMLLoaderEvent", "type", "xml", "error", "bubbles", "cancelable", "eventPhase" );
		}
		
	}
}
