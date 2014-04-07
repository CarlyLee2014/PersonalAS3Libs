package carlylee.utils
{
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	
	/**
	 * DisplayObjectUtil
	 *
	 * author: Eunjeong, Lee.
	 * created: Dec 10, 2013
	 */
	
	public class DisplayObjectUtil
	{
		/**
		 * You can remove a DisplayObject directly from Display List, not through several depth. 
		 * @param $displayObject What you want to remove from display.
		 * 
		 */		
		public static function removeFromDisplayList( $displayObject:DisplayObject ):void{
			if( $displayObject == null ){
				throw new Error( "Can not remove null Object. $displayObject is null." );
			}else{
				if( $displayObject.parent != null ) $displayObject.parent.removeChild( $displayObject );
			}
		}
		
		/**
		 * Set DisplayObject's color to $RGB value, using ColorTransform.
		 * @param $displayObject
		 * @param $RGBCode:uint
		 */		
		public static function setRGBColorToDisplayObject( $displayObject:DisplayObject, $RGBCode:uint ):void{
			var colorTransform:ColorTransform = new ColorTransform;
			colorTransform.color = $RGBCode;
			$displayObject.transform.colorTransform = colorTransform;
		}
		
		/**
		 * Set DisplayObject's color to GrayScale using ColorMatrixFilter.
		 * @param $displayObject
		 */		
		public static function setGrayScale( $displayObject:DisplayObject ):void{
			var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter([ 0.33, 0.33, 0.33, 0, 0,
																			  0.33, 0.33, 0.33, 0, 0,
																			  0.33, 0.33, 0.33, 0, 0,
																			  0,    0,    0,    1, 0 ]);
			$displayObject.filters = [ colorMatrixFilter ];
		}
	}
}