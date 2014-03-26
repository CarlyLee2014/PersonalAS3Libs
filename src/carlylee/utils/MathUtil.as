package carlylee.utils
{
	/**
	 * MathUtil
	 *
	 * author: Eunjeong, Lee.
	 * modified: Dec 10, 2013
	 */
	public class MathUtil
	{
		/**
		 * x,y좌표 사이의 거리를 구한 값을 구한다.
		 *  
		 * @param $x1 : 첫번째 무비클립의 x좌표
		 * @param $x2 : 두번째 무비클립의 x좌표
		 * @param $y1 : 첫번째 무비클립의 y좌표
		 * @param $y2 : 두번째 무비클립의 y좌표
		 * @return Number
		 */			

		public static function getDistance( $x1:Number, $x2:Number, $y1:Number, $y2:Number ):Number{
			var diffX:Number = $x2 - $x1;
			var diffY:Number = $y2 - $y1;
			var d:Number = Math.sqrt( diffX*diffX + diffY*diffY );
			return d;
		};
		
		/**
		 * x,y좌표 사이의 거리가 distance보다 작은지 검사하여 반환 
		 * @param $x1
		 * @param $x2
		 * @param $y1
		 * @param $y2
		 * @param $distance
		 * @return Boolean
		 * 
		 */		
		public static function compareDistance( $x1:Number, $x2:Number, $y1:Number, $y2:Number, $distance:Number ):Boolean{
			var diffX:Number = $x2 - $x1;
			var diffY:Number = $y2 - $y1;
			return diffX*diffX + diffY*diffY < $distance*$distance;
		};
		
		/**
		 * 목표지점까지의 각도를 Radian으로 반환 
		 * @param $x   현재 X좌표
		 * @param $y   현재 Y좌표
		 * @param $toX 목표 X좌표
		 * @param $toY 목표 Y좌표 
		 * @return Number
		 * 
		 */		
		public static function takeAngleToRadian( $x:Number, $y:Number, $toX:Number, $toY:Number ):Number{
			var dx:Number = $toX - $x;
			var dy:Number = $toY - $y;
			var r:Number = Math.atan2( dy, dx );
			return r;
		}
		
		/**
		 * 목표지점까지의 각도를 Degree로 반환 
		 * @param $x   현재 X좌표
		 * @param $y   현재 Y좌표
		 * @param $toX 목표 X좌표
		 * @param $toY 목표 Y좌표 
		 * @return Number
		 * 
		 */			
		public static function takeAngleToDegree( $x:Number, $y:Number, $toX:Number, $toY:Number ):Number{
			var dx:Number = $toX - $x;
			var dy:Number = $toY - $y;
			var r:Number = Math.atan2( dy, dx );
			return RadiansToDegrees( r );
		}
		
		public static function pointToPixel( $point:Number, $dpi:int=96 ):Number{
			return $point*$dpi/72.27;
		}
		
		public static function pixelToPoint( $pixel:Number, $dpi:int=96 ):Number{
			return $pixel*72.27/$dpi;
		}
		
		public static function RadiansToDegrees( $radians:Number ):Number{
			return $radians*57.29577951308232;
		}
		
		public static function DegreesToRadiands( $degrees:Number ):Number{
			return $degrees*0.017453292519943295;
		}
	}
}
