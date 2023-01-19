if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	stunEnemyDestroy();
	slowDown(false);
	spin += 10;
}