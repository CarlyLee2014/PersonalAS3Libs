package carlylee.view.object
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class RollOverFrameButton extends Sprite	
	{
		public var id:int;
		public var isOn:Boolean = false;
		
		private var _clip:MovieClip;
		private var _labelMode:Boolean = false;
		
		public function RollOverFrameButton( $clip:MovieClip, $id:int=0, $isLabelMode:Boolean=false, $addChild:Boolean=false )
		{
			_clip = $clip;
			if( $addChild ) this.addChild( _clip );
			this.id = $id;
			_labelMode = $isLabelMode;
			this.setEnable();
		}
		
		public function setDisable():void{
			if( _labelMode ){
				_clip.gotoAndStop( "disable" );
			}else{
				_clip.gotoAndStop( 4 );
			}
			_clip.buttonMode = false;
			_clip.removeEventListener( MouseEvent.MOUSE_DOWN, onDown );
			_clip.removeEventListener( MouseEvent.ROLL_OVER, onOver );
			_clip.removeEventListener( MouseEvent.ROLL_OUT, onOut );
		}
		
		public function setEnable():void{
			this.onOut();
			_clip.buttonMode = true;
			_clip.addEventListener( MouseEvent.ROLL_OVER, onOver );
			_clip.addEventListener( MouseEvent.ROLL_OUT, onOut );
			_clip.addEventListener( MouseEvent.MOUSE_DOWN, onDown );
		}
		
		public function setOn():void{
			this.isOn = true;
			this.onOver();
		}
		
		public function setOff():void{
			this.isOn = false;
			this.onOut();
		}
		
		private function onOver( $e:MouseEvent=null ):void{
			if( _labelMode ){
				_clip.gotoAndStop( "over" );
			}else{
				_clip.gotoAndStop( 2 );
			}
		}
		
		private function onOut( $e:MouseEvent=null ):void{
			if( isOn ) return;
			if( _labelMode ){
				_clip.gotoAndStop( "out" );
			}else{
				_clip.gotoAndStop( 1 );
			}
		}
		
		private function onDown( $e:MouseEvent ):void{
			if( _labelMode ){
				_clip.gotoAndStop( "click" );
			}else{
				_clip.gotoAndStop( 3 );
			}
			_clip.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
		}
		
		private function onMouseUp( $e:MouseEvent ):void{
			this.onOut();
			this.dispatchEvent( new MouseEvent( MouseEvent.CLICK ));
		}
	}
}