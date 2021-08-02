package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.math.Vector2;

class Entity {
	public var velocity:Vector2;
	public var position:Vector2;
	public var speed = 2;
	public var willgo_x:Float;
	public var willgo_y:Float;
	public var size:Float;

	public function new(x:Float, y:Float, size:Float) {
		this.size = size;
		this.position = new Vector2(x - size / 2, y - size / 2);
		this.velocity = new Vector2(0, 0);
	}

	public function render(gp:Graphics) {
		gp.fillCircle(this.position.x, this.position.y, this.size);
	}

	public function update() {
		var angle = Math.atan2(this.willgo_x - this.position.x, this.willgo_y - this.position.y);
		this.velocity.x = Math.cos(angle - (Math.PI / 2)) * this.speed;
		this.velocity.y = Math.sin(angle - (Math.PI / 2)) * this.speed;
		this.position.x += this.velocity.x;
		this.position.y -= this.velocity.y;
	}
}
