package carlylee.util
{
	/**
	 * NumberFormatter
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: July 10, 2014
	 */
	public class NumberFormatter
	{
		/**
		 * 1234567.85256 -> 1,234,567.85256
		 * @param $num
		 * @param $digit(default=0) 1234567.85256 -> 1,234,567
		 * @param $round(true)
		 * @return 
		 */		
		public static function withCommas( $num:Number, $digit:int=0, $round:Boolean=true ):String{
			var largeNumber:String = String( $num );
			var front:Array = largeNumber.split(".");
			var reg:RegExp=/\d{1,3}(?=(\d{3})+(?!\d))/;
			while( reg.test(front[0]) )
				front[0] = front[0].replace( reg,"$&," );
			if( $digit > 0 ){
				if( $round ){
					var pow:int = Math.pow( 10, $digit );
					var str:String = String( Math.round($num*pow)/pow );
					front[1] = str.split( "." )[1];
				}else{
					front[1] = front[1].substr( 0, $digit );
				}
				if( front[1] == undefined ) front[1] = "0";
				while( front[1].length<$digit ) front[1] += "0";
			}else front.splice( 1, 1 );
			return front.join(".");
		}
		
		/**
		 * 1000 -> 1k
		 * 1000000 -> 1m
		 * 1000000000 -> 1b
		 * 1000000000000 -> 1t
		 * 
		 * @param $num
		 * @param $capital(false)	
		 * @param $digit(default=2)		1.82k
		 * @param $round(true)			1.76k -> 1.8k
		 * @param $iteration			This is used inside method, don't set the value.
		 * @return 
		 */		
		public static function withChar( $num:Number, $capital:Boolean=false, 
														 $digit:int=2, $round:Boolean=true, $iteration:int=0 ):String{
			if( $num < 1000 ) return String( $num );
			var char:String = "kmbt";
			if( $capital ) char = "KMBT";
			$num = $num/1000;
			while( $num>=1000 && $iteration<char.length ){
				$num = $num/1000;
				$iteration ++;
			}
			var pow:int = Math.pow( 10, $digit );
			if( $round ) $num = Math.round( $num*pow )/pow;
			else $num = int( $num*pow )/pow;
			return $num + char.charAt( $iteration );
		}
		
		public static function addOrdinal( $order:int ):String{
			if (( $order % 100 < 20 ) && ( $order % 100 > 10 )) {
				return "th";
			}else{
				switch (int($order%10)) {
					case 1:
						return "st";
					case 2:
						return "nd";
					case 3:
						return "rd";
				}
			}
			return "th";
		}
	}
}