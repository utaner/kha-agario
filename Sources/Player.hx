package;

import kha.graphics2.Graphics;
import kha.Color;
import Entity;

class Player extends Entity {
	public function new(x:Float, y:Float, size:Float) {
		super(x, y, size);
		this.size = size;
	}

	override public function update() {
		super.update();
	}

	public function eats(food:Food):Bool {
		var distanceX:Float = this.position.x - food.position.x;
		var distanceY:Float = this.position.y - food.position.y;

		var total = Math.sqrt(distanceX * distanceX + distanceY * distanceY);

		var res = total + food.size <= this.size ? true : false;
		return res;
	}

	override public function render(gp:Graphics) {
		gp.color = Color.fromBytes(239, 83, 80);
		super.render(gp);
	}
}
