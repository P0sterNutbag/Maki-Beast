// Spawn egg
if instance_number(parEnemy) < 1 and objSpawner.enemyWave >= objSpawner.maxWaves and !instance_exists(objEgg) and !instance_exists(objHawk) {
	var xx = 1;
	var yy = 1;
	while instance_position(xx,yy,objWall) {
		xx = objPlayer.x+random_range(-25,25)
		yy = objPlayer.y+random_range(-25,25)
	}
	
	instance_create_layer(xx,yy,"projectile",objEgg);
}

alarm[1] = 60;