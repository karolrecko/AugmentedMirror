import flash.display.Sprite;
import flash.text.TextField;
import flash.geom.Rectangle;

class EmotionStatesVis extends Sprite{
	public var emotionStates:EmotionStates;
	public var drawArea:Rectangle;
	
	public var labelEngagementBoredom:TextField;
	public var labelExcitementShortTerm:TextField;
	public var labelExcitementLongTerm:TextField;
	public var labelFrustration:TextField;
	public var labelMeditation:TextField;
	
	public function new(emotionStates:EmotionStates):Void {
		super();
	
		this.emotionStates = emotionStates;
		drawArea = new Rectangle(0,0,150,100);
		
		var h = drawArea.height*0.2;
		var y = 0.0;
		labelEngagementBoredom = new TextField();
		labelEngagementBoredom.text = "Engagement/Boredom";
		labelEngagementBoredom.y = y;
		labelEngagementBoredom.width = drawArea.width;
		labelEngagementBoredom.textColor = 0xFFFFFF;
		addChild(labelEngagementBoredom);
		
		y+=h;
		
		labelExcitementShortTerm = new TextField();
		labelExcitementShortTerm.text = "Excitement Short Term";
		labelExcitementShortTerm.y = y;
		labelExcitementShortTerm.width = drawArea.width;
		labelExcitementShortTerm.textColor = 0xFFFFFF;
		addChild(labelExcitementShortTerm);
		
		y+=h;
		
		labelExcitementLongTerm = new TextField();
		labelExcitementLongTerm.text = "Excitement Long Term";
		labelExcitementLongTerm.y = y;
		labelExcitementLongTerm.width = drawArea.width;
		labelExcitementLongTerm.textColor = 0xFFFFFF;
		addChild(labelExcitementLongTerm);
		
		y+=h;
		
		labelFrustration = new TextField();
		labelFrustration.text = "Frustration";
		labelFrustration.y = y;
		labelFrustration.width = drawArea.width;
		labelFrustration.textColor = 0xFFFFFF;
		addChild(labelFrustration);
		
		y+=h;
		
		labelMeditation = new TextField();
		labelMeditation.text = "Meditation";
		labelMeditation.y = y;
		labelMeditation.width = drawArea.width;
		labelMeditation.textColor = 0xFFFFFF;
		addChild(labelMeditation);
	}
	
	public function draw():Void {
		var g = this.graphics;
		g.clear();
		
		var h = drawArea.height*0.2;
		var y = 17.0;
		
		g.beginFill(0xCCCCCC,1);
		g.drawRect(drawArea.x, y, drawArea.width*emotionStates.engagementBoredom, 2);
		g.beginFill(emotionStates.engagementBoredomIsActive?0x00CC00:0xCC0000,0.5);
		g.drawRect(drawArea.x, y, drawArea.width, 2);
		
		y+=h;
		
		g.beginFill(0xCCCCCC,1);
		g.drawRect(drawArea.x, y, drawArea.width*emotionStates.excitementShortTerm, 2);
		g.beginFill(emotionStates.excitementIsActive?0x00CC00:0xCC0000,0.5);
		g.drawRect(drawArea.x, y, drawArea.width, 2);
		
		y+=h;
		
		g.beginFill(0xCCCCCC,1);
		g.drawRect(drawArea.x, y, drawArea.width*emotionStates.excitementLongTerm, 2);
		g.beginFill(emotionStates.excitementIsActive?0x00CC00:0xCC0000,0.5);
		g.drawRect(drawArea.x, y, drawArea.width, 2);
		
		y+=h;
		
		g.beginFill(0xCCCCCC,1);
		g.drawRect(drawArea.x, y, drawArea.width*emotionStates.frustration, 2);
		g.beginFill(emotionStates.frustrationIsActive?0x00CC00:0xCC0000,0.5);
		g.drawRect(drawArea.x, y, drawArea.width, 2);
		
		y+=h;
		
		g.beginFill(0xCCCCCC,1);
		g.drawRect(drawArea.x, y, drawArea.width*emotionStates.meditation, 2);
		g.beginFill(emotionStates.meditationIsActive?0x00CC00:0xCC0000,0.5);
		g.drawRect(drawArea.x, y, drawArea.width, 2);
		
		g.endFill();
	}
}
