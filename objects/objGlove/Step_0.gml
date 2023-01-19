if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	dir = 90;
} else if state = states.toss {
	move();
	bounceOnWalls();
	slightBounceAndLaunchEnemy(0.65);
	slowDown(false);
}
