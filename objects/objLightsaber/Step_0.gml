if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	hurtEnemy();
	slowDown(false);
	spin += 0.1*spd;
}