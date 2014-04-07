package carlylee.utils
{
	import flash.utils.ByteArray;
	/**
	 * StringUtil
	 *
	 * author: Eunjeong, Lee.
	 * modified: Dec 10, 2013
	 */
	public class StringUtil
	{
		
		/**
		 * 
		 * @param $n:Number
		 * @param $digit:int 남길 소수 자리 
		 * @return:String 
		 * 
		 */		
		public static function formatNumberWithDot( $n:Number, $digit:int=2 ):String{
			var str:String = "";
			var arr:Array = String( $n ).split( "." );
			if( arr.length < 2 ) return str = String( $n );
			var s:String = arr[1];
			str = arr[0] + ".";
			var i:int = 0;
			for( i; i<$digit; i++ ){
				str += s.slice( i,i+1 );
			}
			return str;
		}
		/**
		 * Number -> Hexadecmial
		 * @param value:int
		 * @param length:int
		 * @param header:String
		 * @return:String 
		 * 
		 */		
		
		public static function numberToHex( $value:int, $length:int=6, $header:String="0x" ):String{
			var str: String = $value.toString( 16 ).toUpperCase();
			// 앞에 붙일 0의 개수 
			var len: int = $length - str.length;
			
			for( var i: int=0; i<len; i++ ){
				str = "0" + str;
			}
			return $header + str;
		}
		
		/**
		 * value값에 원하는 만큼의 0을 추가한다.
		 * num은 value값과 추가될 0의 길이를 합한 문자열 길이 
		 *  
		 * @param value:int
		 * @param num:int=2 value.length+(value.length-num);
		 * @return:String
		 * 
		 */		
		
		public static function addZeros( $value:int, $num:int=2 ):String{
			var str: String = String( $value );			
			var len: int = $num - str.length;
			var i:int = 0;
			for( i; i<len; i++ ){
				str = "0" + str;	
			}
			return str;
		}
		
		/**
		 * Get rid of space frome $string and returns.
		 * @param $string:String
		 * @return String:String 
		 * 
		 */		
		public static function trimString( $string:String ):String{
			var str:String = "";
			var i:int = 0;
			for( i; i<$string.length; ++i ){
				if( $string.charAt(i) != " " ){
					str += $string.charAt(i);
				}
			}
			return str;
		}
		
		/**
		 * Check texts spelling without space. 
		 * @param $string1:String
		 * @param $string2:String
		 * @return:Boolean
		 */		
		public static function compareStringTrimSpace( $string1:String, $string2:String ):Boolean{
			var i:int = 0;
			var s1:String = "";
			var s2:String = "";
			for( i; i<$string1.length; ++i ){
				if( $string1.charAt(i) != " " && $string1.charAt(i) != "." ){
					s1 += $string1.charAt(i);
				}
			}
			for( i=0; i<$string2.length; ++i ){
				if( $string2.charAt(i) != " " && $string2.charAt(i) != "." ){
					s2 += $string2.charAt(i);
				}
			}
			return ( s1 == s2 );
		}
		
		/**
		 * compare two Strings, return number of same chracters.
		 * 두개의 문자열을 비교하여 같은 문자열의 갯수를 반환합니다. 
		 * @param string1:String
		 * @param string2:String
		 * @return:int 
		 * 
		 */		
		public static function strcmp( $string1:String, $string2:String ):int{
			var count:int = 0;
			var i:int = 0;
			for( i; i < $string1.length ; ++i ){
				if( $string1.charAt(i) == $string2.charAt(i) ){ count ++; };
			}
			return count;
		}
		/**
		 * 두개의 문자열을 비교하여 같은 정도를 1을 기준으로 반환합니다. 
		 * @param string1:String
		 * @param string2:String
		 * @return:String 
		 * 
		 */		
		public static function strcmpPercent( $string1:String, $string2:String ):Number{
			var count:int = 0;
			var len:int;
			var max:int;
			
			if( $string1.length < $string2.length ){
				len = $string1.length;
				max = $string2.length;
			}else{
				max = $string1.length;
				len = $string2.length;
			}
			
			var i:int = 0;
			for( i; i < len ; ++i ){
				if( $string1.charAt(i) == $string2.charAt(i) ){ count ++; };
			}
			return (count/max);
		}
		
		/**
		 * return String's byte size.
		 * 문자열의 바이트 크기를 반환 
		 * @param str:String
		 * @param encode:String
		 * @return:String 
		 * 
		 */		
		public static function getByteSize( $str:String, $encode:String="UTF-8" ):int{
			var tmp: ByteArray = new ByteArray();
			tmp.writeMultiByte( $str, $encode );
			var result:int = tmp.length;
			return result;
		}
		
		/**
		 * 
		 * @param $num 		1000000 -> 1,000,000
		 * @return:String 
		 * 
		 */		
		public static function formatNumberWithCommas( $num:String ):String{
			var strNum:String = $num;
			if( strNum.length<4 )
				return strNum;
			return formatNumberWithCommas(strNum.slice(0, -3))+","+strNum.slice(-3);
		}
		
		public static function datetimeFormat( $time:Number ):String {
			var date:Date = new Date();
			date.time = $time*1000;
			return date.fullYear+"-"+addZeros(date.month+1)+"-"+addZeros(date.date)+" "+addZeros(date.hours)+":"+addZeros(date.minutes)+":"+addZeros(date.seconds);
		}
		
		/**
		 * 
		 * @param $seconds:int 	3600
		 * @return:String 		1. only returns Hour.
		 * 
		 */		
		public static function timeFormatHour( $seconds:int ):String{
			return int(( $seconds/3600 )+1);
		}
		
		/**
		 * 
		 * @param $ms:int 	millisecond 3600000
		 * @return:String 	1. only returns Hour.
		 * 
		 */		
		public static function timeFormatHourUsingMS( $ms:int ):String{
			return int(( $ms/3600000 )+1);
		}
		
		/**
		 * 
		 * @param $seconds:int 	9925
		 * @return:String 		02:45:25
		 * 
		 */		
		public static function timeFormatColonHourMinSec( $seconds:int ):String {
			var hour:int = $seconds/3600;
			var min:int = ($seconds/60)%60;
			var sec:int = $seconds%60;
			return addZeros( hour )+":"+addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * 
		 * @param $ms:int 	9925000
		 * @return:String 	02:45:25
		 * 
		 */		
		public static function timeFormatColonHourMinSecUsingMS( $ms:int ):String {
			var hour:int = $ms/3600000;
			var min:int = ($ms/60000)%60;
			var sec:int = ($ms/1000)%60;
			return addZeros( hour )+":"+addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * @param $seconds:int 		9900
		 * @return:String			45:00 not 02:45:00
		 */		
		public static function timeFormatColonMinSec( $seconds:int ):String{
			var min:int = ($seconds/60)%60;
			var sec:int = $seconds%60;
			return addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * @param $ms:int 	9900000
		 * @return:String 	45:00 not 02:45:00
		 */		
		public static function timeFormatColonMinSecUsingMS( $ms:int ):String{
			var min:int = ($ms/60000)%60;
			var sec:int = ($ms/1000)%60;
			return addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * @param $seconds:int 				9900
		 * @param $isMillisecond:Boolean 	Is '$seconds' millisecond? 
		 * @return:String					165 only returns minutes.
		 */		
		public static function timeFormatMin( $seconds:int, $isMillisecond:Boolean=false ):String{
			if( $isMillisecond ){
				return String( $seconds/60000 );
			}else{
				return String( $seconds/60 ;
			}
		}
		
		public static function timeFormatPast( $seconds:int ):String {
			$seconds = -$seconds;
			if( $seconds<60 ) 		return $seconds+"second";
			if( $seconds<3600 ) 	return int( $seconds/60 )+"minutes";
			if( $seconds<86400 ) 	return int( $seconds/3600 )+"hours";
			if( $seconds<604800 ) 	return int( $seconds/86400 )+"day";
			if( $seconds<18144000 ) return int( $seconds/604800 )+"weeks";
			if( $seconds<31536000 ) return int( $seconds/18144000 )+"month";
			return int($seconds/31536000)+"years";
		}
		
		public static function parsingText( $text:String="", $valObject:Object=null ):String{
			var str:String = $text;
			try {
				if ( $valObject != null ) {
					var i:String;
					for ( i in $valObject ) {
						str = str.replace( "|" + i + "|", $valObject[i] );
					}
				}
				
			}catch ( e:Error ) {
				trace( "StringUtil Error!! - " + e.name + " : " + e.message );
			}
			return str;
		}
	}
}