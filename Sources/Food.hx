package;

import kha.graphics2.Graphics;
import kha.Color;
import Entity;

class Food extends Entity {
	public var food_color:Color;

	public function new(x:Float, y:Float, size:Float) {
		super(x, y, size);
		this.size = size;
		var rand_color = [
			Color.White,
			Color.fromBytes(66, 165, 245),
			Color.fromBytes(255, 213, 79),
			Color.fromBytes(186, 104, 200),
			Color.fromBytes(121, 85, 72),
			Color.fromBytes(169, 204, 227),
			Color.fromBytes(245, 183, 177)
		];
		this.food_color = rand_color[Std.random(rand_color.length)];
	}

	override public function update() {}

	override public function render(gp:Graphics) {
		gp.color = food_color;
		super.render(gp);
	}
}
