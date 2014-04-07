package carlylee.utils
{
	
	/**
	 * ExtraUtil
	 *
	 * author: Eunjeong, Lee.
	 * created: Dec 10, 2013
	 */
	
	public class ExtraUtil
	{
		/**
		 * Check Vector which has 'null' or not.
		 * How to use : 
		 * vector.filter( deleteNullFilterforVector, this ); 
		 * this: the scope which contains vector.
		 * @return:Boolean 
		 * 
		 */		
		public static function deleteNullFilterforVector( $item:*, $index:int, $vector:Vector.<*> ):Boolean{
			var b:Boolean = false;
			if( $item != null ) b = true;
			return b;
		}
		
		public static function traceObject( $obj:Object ):void{
			var str:String;
			for( str in $obj ){
				trace( "[ "+str+" ]: " + $obj[str] );
			}
		}
	}
}