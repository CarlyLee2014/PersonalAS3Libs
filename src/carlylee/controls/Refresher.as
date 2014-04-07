package carlylee.controls
{
	import flash.utils.Dictionary;
	
	/**
	 * Refresher
	 * It manages several RefreshItems with key value using 'Dictionary'.
	 * The 'Dictionary' has Vectors type of <RefreshItem>.
	 * You can add RefreshItems and use 'executeRefresh', so you can update information, status.. the other things.
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 12, 2013
	 */
	public class Refresher
	{
		private static var _instance:Refresher;
		private static var _dict:Dictionary = new Dictionary;//contains of Vector.<RefreshItem>
		
		public function Refresher(){}
		
		public static function getInstance():Refresher{
			if( _instance != null ) _instance = new Refresher();
			return _instance;
		}
		
		public function addRefreshItem( $refreshItem:RefreshItem ):void{
			var v:Vector.<RefreshItem>;
			if( _dict[$refreshItem.key] == undefined ){
				v = new Vector.<RefreshItem>;
			}else{
				v = _dict[$refreshItem.key];
			}
			v.push( $refreshItem );
		}
		
		public function executeRefresh( $key:String ):void{
			if( _dict[$key] == undefined ){
				throw new Error( "There is no key called [" + $key + "] in Refresher." );
			}else{
				var v:Vector.<RefreshItem> = _dict[$key];
				var i:int = 0;
				for( i; i<v.length; ++i ){
					v[i].execute();
				}
			}
		}
		
		public function deleteRefreshWholeKeyItems( $key:String ){
			if( _dict[$key] == undefined ){
				throw new Error( "There is no key called [" + $key + "] in Refresher." );
			}else{
				delete _dict[$key];
			}
		}
		
		public function deleteRefreshItem( $refreshItem:RefreshItem ):void{
			if( _dict[$refreshItem.key] == undefined ){
				throw new Error( "There is no key called [" + $refreshItem.key + "] in Refresher." );
			}else{
				var v:Vector.<RefreshItem> = _dict[$refreshItem.key];
				var i:int = 0;
				for( i; i<v.length; ++i ){
					if( v[i] == $refreshItem ){
						v[i] == null;
						break;
					}
				}
				v = v.filter( deleteNull, this );
				if( v.length < 1 ){
					delete _dict[$refreshItem.key];
				}else{
					_dict[$refreshItem.key] = v;
				}
			}
		}
		
		public function deleteRefreshItemWithID( $key:String, $id:String ):void{
			if( _dict[$key] == undefined ){
				throw new Error( "There is no key called [" + $key + "] in Refresher." );
			}else{
				var v:Vector.<RefreshItem> = _dict[$key];
				var i:int = 0;
				for( i; i<v.length; ++i ){
					if( v[i].id == $id ){
						v[i] == null;
						break;
					}
				}
				v = v.filter( deleteNull, this );
				if( v.length < 1 ){
					delete _dict[$key];
				}else{
					_dict[$key] = v;
				}
			}
		}
		
		public function deleteNull( $item:*, $index:int, $vector:Vector.<*> ):Boolean{
			var b:Boolean = false;
			if( $item != null ) b = true;
			return b;
		}
	}
}