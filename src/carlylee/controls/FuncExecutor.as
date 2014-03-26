package carlylee.controls
{
	
	/**
	 * FuncExecutor
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 27, 2013
	 */
	
	public class FuncExecutor
	{
		public var func:Function;
		public var thisObject:Object;
		public var prameters:Array;
		/**
		 * 
		 * @param $func(Function) The action what you want to.
		 * @param $thisObject(Object) The object to which the function is applied.
		 * @param ...$params Elements are passed to the function as parameters.
		 * 
		 */		
		public function FuncExecutor( $func:Function, $thisObject:Object, ...$params ){
			this.func = $func;
			this.thisObject = $thisObject;
			this.prameters = $params;
		}
		
		public function execute():void{
			func.apply( thisObject, prameters );
		}
	}
}