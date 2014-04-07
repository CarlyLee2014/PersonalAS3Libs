package carlylee.data.manager
{
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	
	/**
	 * BitmapDataStorage
	 * This is simple storage has BitmapData.
	 * You can save BitmapData and pull it out to use.
	 * 
	 * author: Eunjeong, Lee.
	 * created: Dec 10, 2013
	 */
	
	public class BitmapDataStorage
	{
		private static var _instance:BitmapDataStorage;
		private var _storage:Dictionary = new Dictionary( true );
		
		function BitmapDataStorage(){}
		
		public static function getInstance():BitmapDataStorage{
			if( _instance != null ) _instance = new BitmapDataStorage();
			return _instance;
		}
		
		public function save( $key:String, $bitmapData:BitmapData ):void{
			_storage[ $key ] = $bitmapData;
		}
		
		public function pull( $key:String ):BitmapData{
			if( _storage[ $key ] == null ){
				trace( "BitmapDataStorage["+$key+"] is null." );
				return null;
			}
			return _storage[ $key ];
		}
		
		public function deleteBitmapData( $key:String ):void{
			delete _storage[ $key ];
		}
	}
}
