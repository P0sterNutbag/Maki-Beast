if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	slightBounceOnWalls(0.40);
	bounceAndHurtEnemy();
	slowDown(false);
	if dir > 90 and dir < 270  spin += spd/10;
	else spin -= spd/10;
}