import flash.display.BitmapData;
import flash.display.Graphics;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.Vector;

class VirtualProjector {
	static public function viewToTexture(textureGraphic:Graphics, textureRect:Rectangle, viewBitmap:BitmapData, o1:Point, o2:Point, o3:Point, o4:Point):Void {
		var p1 = new Point(textureRect.left,textureRect.bottom);
		var p2 = textureRect.bottomRight;
		var p3 = textureRect.topLeft;
		var p4 = new Point(textureRect.right,textureRect.top);
		
		textureGraphic.clear();
		textureGraphic.beginBitmapFill(viewBitmap, null, false, true);
		var pc:Point = getIntersection(o1, o4, o2, o3); // Central point
		if (pc == null) {
			textureGraphic.drawTriangles(
				flash.Lib.vectorOfArray([p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y]),
				flash.Lib.vectorOfArray([2,3,0,3,1,0]),
				flash.Lib.vectorOfArray([o1.x,o1.y
										,o2.x,o2.y
										,o3.x,o3.y
										,o4.x,o4.y])
				);
		} else {
			var lr1:Float = Point.distance(o1, pc);
			var lr2:Float = Point.distance(pc, o4);
			var ll1:Float = Point.distance(o2, pc);
			var ll2:Float = Point.distance(pc, o3);
			var f:Float = (ll1 + ll2) / (lr1 + lr2);
			textureGraphic.drawTriangles(
				flash.Lib.vectorOfArray([p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y]),
				flash.Lib.vectorOfArray([2,3,0,3,1,0]),
				flash.Lib.vectorOfArray([o1.x,o1.y,(1/ll2)*f
										,o2.x,o2.y,(1/lr2)
										,o3.x,o3.y,(1/lr1)
										,o4.x,o4.y,(1/ll1)*f])
				);
		}
		textureGraphic.endFill();
	}
	
	static private function getIntersection(p1:Point, p2:Point, p3:Point, p4:Point): Point {
		// Returns a point containing the intersection between two lines
		// http://keith-hair.net/blog/2008/08/04/find-intersection-point-of-two-lines-in-as3/
		// http://www.gamedev.pastebin.com/f49a054c1

		var a1:Float = p2.y - p1.y;
		var b1:Float = p1.x - p2.x;
		var a2:Float = p4.y - p3.y;
		var b2:Float = p3.x - p4.x;

		var denom:Float = a1 * b2 - a2 * b1;
		if (denom == 0) return null;

		var c1:Float = p2.x * p1.y - p1.x * p2.y;
		var c2:Float = p4.x * p3.y - p3.x * p4.y;

		var p:Point = new Point((b1 * c2 - b2 * c1)/denom, (a2 * c1 - a1 * c2)/denom);

		if (Point.distance(p, p2) > Point.distance(p1, p2)) return null;
		if (Point.distance(p, p1) > Point.distance(p1, p2)) return null;
		if (Point.distance(p, p4) > Point.distance(p3, p4)) return null;
		if (Point.distance(p, p3) > Point.distance(p3, p4)) return null;

		return p;
	}
}
