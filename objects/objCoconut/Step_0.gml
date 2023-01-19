if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	stunEnemyBounce();
	slowDown(false);
	spin -= spd/10;
}