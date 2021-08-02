package;

import kha.Framebuffer;
import kha.input.Mouse;
import Player;
import Food;
import muz.Camera;

class Game {
	var _player:Player;
	var _camera:Camera;
	var _foods:Array<Food> = [];
	var mouseX:Float;
	var mouseY:Float;
	var startingRadius:Float;
	var MAP_WIDTH:Int = 6000;
	var MAP_HEIGHT:Int = 6000;

	public function new() {
		startingRadius = 32;
		_player = new Player(2500, 2500, 32);
		_camera = new Camera(2500, 2500);

		for (i in 0...1000) {
			var food = new Food(randomRangeFloat(0, MAP_WIDTH), randomRangeFloat(0, MAP_HEIGHT), randomRangeFloat(8, 20));
			_foods.push(food);
		}
		Mouse.get().notify(null, null, onMouseMove, null);
	}

	public function update():Void {
		_player.update();
		for (v in _foods) {
			v.update();
			if (_player.eats(v)) {
				_foods.remove(v);
				var sum = Math.PI * _player.size * _player.size + Math.PI * v.size * v.size;
				_player.size = Math.sqrt(sum / Math.PI);
				var newzoom = startingRadius / _player.size;
				_camera.zoom = lerp(_camera.zoom, newzoom, 0.1);
			}
		}

		_player.willgo_x = mouseX - (width / 2 - _player.position.x + 32);
		_player.willgo_y = mouseY - (height / 2 - _player.position.y + 32);

		_camera.lookAt(_player);
	}

	public function render(framebuffer:Framebuffer):Void {
		var gp = framebuffer.g2;
		gp.begin();
		_camera.set(gp);
		for (v in _foods) {
			v.render(gp);
		}
		_player.render(gp);
		gp.end();
	}

	public function onMouseMove(x:Float, y:Float, cx:Float, cy:Float) {
		mouseX = x;
		mouseY = y;
	}

	public function randomRangeFloat(min:Float, max:Float):Float {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}

	public function lerp(min:Float, max:Float, value:Float):Float {
		return min + (max - min) * value;
	}
}
