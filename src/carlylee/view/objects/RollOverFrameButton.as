package carlylee.view.objects
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class RollOverFrameButton extends Sprite	
	{
		private var _clip:MovieClip;
		private var _labelMode:Boolean = false;
		
		public function RollOverFrameButton( $clip:MovieClip, $isLabelMode:Boolean=false )
		{
			_clip = $clip;
			_labelMode = $isLabelMode;
			this.setEnable();
		}
		
		private function onOver( $e:MouseEvent=null ):void{
			if( _labelMode ){
				_clip.gotoAndStop( "over" );
			}else{
				_clip.gotoAndStop( 2 );
			}
		}
		
		private function onOut( $e:MouseEvent=null ):void{
			if( _labelMode ){
				_clip.gotoAndStop( "out" );
			}else{
				_clip.gotoAndStop( 1 );
			}
		}
		
		private function onClick( $e:MouseEvent ):void{
			this.dispatchEvent( $e.clone() );
		}
		
		public function setDisable():void{
			if( _labelMode ){
				_clip.gotoAndStop( "disable" );
			}else{
				_clip.gotoAndStop( 3 );
			}
			_clip.buttonMode = false;
			_clip.removeEventListener( MouseEvent.CLICK, onClick );
			_clip.removeEventListener( MouseEvent.ROLL_OVER, onOver );
			_clip.removeEventListener( MouseEvent.ROLL_OUT, onOut );
		}
		
		public function setEnable():void{
			this.onOut();
			_clip.buttonMode = true;
			_clip.addEventListener( MouseEvent.ROLL_OVER, onOver );
			_clip.addEventListener( MouseEvent.ROLL_OUT, onOut );
			_clip.addEventListener( MouseEvent.CLICK, onClick );
		}
	}
}