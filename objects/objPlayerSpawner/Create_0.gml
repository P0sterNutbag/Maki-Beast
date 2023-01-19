if !instance_exists(objPlayer) {
	instance_create_layer(x,y,"player",objPlayer);
} else {
	with objPlayer {
		if hp <= 0  hp = maxHp;
		x = objPlayerSpawner.x;
		y = objPlayerSpawner.y;
		state = states.walk;
	}
}

instance_destroy();