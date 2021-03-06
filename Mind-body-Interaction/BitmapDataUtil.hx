import flash.display.BitmapData;
import flash.display.Shader;
import flash.display.ShaderJob;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

class BitmapDataUtil {
	inline static public var unwrapFile:ByteArray = haxe.Resource.getBytes("unwrap.pbj").getData();

	inline static public function sample(src:BitmapData, x:Float, y:Float):Float {
		return src.getPixel32(Math.round(x),Math.round(y));
	}
	
	static public function unwrap(src:BitmapData,tl:Point,tr:Point,bl:Point,br:Point,?dest:BitmapData):BitmapData {
		var pt0:Point, pt1:Point, pt:Point;
		var t:Float;
		if (dest == null) dest = src;
		if (src == dest) src = src.clone();
		for (x in 0...dest.width) {
			t = 1-x/dest.width;
			pt0 = Point.interpolate(tl,tr,t);
			dest.setPixel32(x,0,cast sample(src,pt0.x,pt0.y));
			pt1 = Point.interpolate(bl,br,t);
			dest.setPixel32(x,dest.height-1,cast sample(src,pt1.x,pt1.y));
			
			for (y in 1...dest.height-1) {
				t = 1-y/dest.height;
				pt = Point.interpolate(pt0,pt1,t);
				dest.setPixel32(x,y,cast sample(src,pt.x,pt.y));
			}
		}
		return dest;
	}
	
	static public function unwrapPB(src:BitmapData,tl:Point,tr:Point,bl:Point,br:Point,?dest:BitmapData):BitmapData {
		if (dest == null) dest = src;
		var shader = new Shader(unwrapFile);
		shader.data.src.input = src;
		shader.data.tl.value = [tl.x,tl.y];
		shader.data.tr.value = [tr.x,tr.y];
		shader.data.bl.value = [bl.x,bl.y];
		shader.data.br.value = [br.x,br.y];
		shader.data.size.value = [dest.width,dest.height];
		new ShaderJob(shader,dest).start(true);
		return src;
	}
}
