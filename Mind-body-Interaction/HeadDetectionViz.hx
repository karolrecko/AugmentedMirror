import flash.display.Sprite;
import flash.text.TextField;
import flash.geom.Rectangle;

class HeadDetectionViz extends Sprite{
	public var cameraUpdater:CameraUpdater;
	
	public var drawArea:Rectangle;

	public function new(cameraUpdater:CameraUpdater):Void {
		super();
	
		this.cameraUpdater = cameraUpdater;
		drawArea = new Rectangle(0,0,150,100);
		
		var h = drawArea.height*0.2;
		var y = 0.0;
		var labelHeadDetection = new TextField();
		labelHeadDetection.text = "Head Detection";
		labelHeadDetection.y = y;
		labelHeadDetection.width = drawArea.width;
		labelHeadDetection.textColor = 0xFFFFFF;
		addChild(labelHeadDetection);
	}
	
	public function draw():Void {
		var g = this.graphics;
		g.clear();
		
		var h = drawArea.height*0.2;
		var y = 17.0;
		
		g.beginFill(cameraUpdater.detectionIsActive?0x00CC00:0xCC0000,0.5);
		g.drawRect(drawArea.x, y, drawArea.width, 2);
		
		g.endFill();
	}
}
