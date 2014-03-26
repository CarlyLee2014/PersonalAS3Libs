package carlylee.controls
{
	
	/**
	 * RefreshItem
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 12, 2013
	 */
	
	public class RefreshItem
	{
		public var key:String;
		public var id:String;
		public var func:Function;
		public var thisObject:Object;
		public var prameters:Array;
		
		/**
		 * @param $key(String) It's sort of group name what this item will belong to.
		 * @param $id(String) In key value, the '$id' is must be unique value.
		 * @param $func(Function) The action what you want to.
		 * @param $thisObject(Object) The object to which the function is applied.
		 * @param ...$params Elements are passed to the function as parameters.
		 * 
		 */		
		public function RefreshItem( $key:String, $id:String, $func:Function, $thisObject:Object, ...$params ){
			this.key = $key;
			this.id = $id;
			this.func = $func;
			this.thisObject = $thisObject;
			this.prameters = $params;
		}
		
		public function execute():void{
			func.apply( thisObject, prameters );
		}
	}
}