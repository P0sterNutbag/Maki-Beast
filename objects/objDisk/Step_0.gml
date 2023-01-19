if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	slowDown(false);
	spin += 0.1*spd;
}