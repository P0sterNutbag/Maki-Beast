if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	dir = 90;
	image_xscale = 1;
} else if state = states.toss {
	move();
	bounceOnWalls();
	hurtEnemyDestroy();
	slowDown(false);
}
