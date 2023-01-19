if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	slightBounceAndHurtEnemy(0.17);
	slowDownExplode();
	spin += spd*0.17;
}