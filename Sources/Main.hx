package;

import kha.System;
import kha.Scheduler;
import kha.Assets;

class Main {
	public static var WIDTH = 1024;
	public static var HEIGHT = 768;
	public static var SPP = 3;

	public static function main() {
		System.init({
			title: 'Agario_Clone',
			width: WIDTH,
			height: HEIGHT,
			samplesPerPixel: SPP
		}, function() {
			Assets.loadEverything(function() {
				var Game = new Game();
				Scheduler.addTimeTask(Game.update, 0, 1 / 60);
				System.notifyOnRender(Game.render);
			});
		});
	}
}
