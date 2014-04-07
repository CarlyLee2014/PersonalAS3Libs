package carlylee.utils
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import carlylee.events.FrameEvent;
	
	/**
	 * MovieClipUtil
	 *
	 * author: Eunjeong, Lee.
	 * created: Dec 10, 2013
	 */
	
	public class MovieClipUtil
	{
		/**
		 * @param $mc:MovieClip
		 * @param $reset:Boolean 	if 'true', brings the playhead to the first frame of the movie clip and stops it there.
		 */
		public static function freezeMovieClip( $mc:MovieClip, $reset:Boolean=false ):void{
			var i:int = 0;
			var mc:MovieClip;
			if( $reset ) $mc.gotoAndStop( 1 );
			for( i; i<$mc.numChildren; ++i ){
				mc = $mc.getChildAt(i) as MovieClip;
				if( mc != null ) freezeMovieClip( mc, $reset );
			}
		}
		
		/**
		 * @param $mc::MovieClip
		 */		
		public static function unfreezeMovieClip( $mc:MovieClip ):void{
			var i:int = 0;
			var mc:MovieClip;
			$mc.stop();
			for( i; i<$mc.numChildren; ++i ){
				mc = $mc.getChildAt(i) as MovieClip;
				if( mc != null ) unfreezeMovieClip( mc );
			}
		}
		
		/**
		 * Only plays MovieClip to NextFrame.
		 * When start playing MovieClip, you'll get an 'FrameEvent.FRAME_START' Event.
		 * When playing MovieClip is done, you'll get an 'FrameEvent.FRAME_ENDED' Event.
		 * @param $mc:MovieClip
		 * 
		 */		
		public static function playNextFrame( $mc:MovieClip ):void{
			$mc.addEventListener( Event.ENTER_FRAME, onNextEnter );
			$mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_START ));
		}
		
		private static function onNextEnter( $e:Event ):void{
			var mc:MovieClip = $e.currentTarget as MovieClip;
			if( mc.currentFrame < mc.totalFrames ){
				mc.nextFrame();
			}else{
				mc.removeEventListener( Event.ENTER_FRAME, onNextEnter );
				mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_ENDED ));
			}
		}
		
		/**
		 * Only plays MovieClip to PrevFrame.
		 * When start playing MovieClip, you'll get an 'FrameEvent.FRAME_START' Event.
		 * When playing MovieClip is done, you'll get an 'FrameEvent.FRAME_ENDED' Event.
		 * @param $mc:MovieClip
		 * 
		 */		
		public static function playPrevFrame( $mc:MovieClip ):void{
			$mc.addEventListener( Event.ENTER_FRAME, onPrevEnter );
			$mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_START ));
		}
		
		private static function onPrevEnter( $e:Event ):void{
			var mc:MovieClip = $e.currentTarget as MovieClip;
			if( mc.currentFrame > 1 ){
				mc.prevFrame();
			}else{
				mc.removeEventListener( Event.ENTER_FRAME, onPrevEnter );
				mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_ENDED ));
			}
		}
	}
}