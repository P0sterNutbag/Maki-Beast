if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	slightBounceAndHurtEnemy(0.01);
	slowDown(false);
	if dir > 90 and dir < 270  spin += spd/10;
	else spin -= spd/10;
}