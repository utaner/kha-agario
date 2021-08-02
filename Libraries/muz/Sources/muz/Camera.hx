package muz;

import kha.graphics2.Graphics;
import kha.math.FastMatrix3;

class Camera {
	public var camera_x:Float;
	public var camera_y:Float;
	public var trans:FastMatrix3;
	public var zoom:Float = 1;

	public function new(x:Float, y:Float) {
		camera_x = x;
		camera_y = y;
	}

	public function set(graphics:Graphics) {
		var trans = FastMatrix3.identity();
		trans.setFrom(FastMatrix3.scale(zoom, zoom).multmat(trans));
		trans.setFrom(FastMatrix3.translation(1024 / 2 - camera_x, 768 / 2 - camera_y).multmat(trans));
		graphics.transformation = trans;
	}

	public function lookAt(obj:Entity) {
		camera_x = (obj.position.x + obj.size * 0.5) * zoom;
		camera_y = (obj.position.y + obj.size * 0.5) * zoom;
	}

	public function unset(graphics:Graphics) {
		graphics.popTransformation();
	}
}
