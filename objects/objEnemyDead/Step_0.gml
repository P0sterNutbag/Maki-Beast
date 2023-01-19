if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	throwSpd = 200;
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	slowDown(false);
}