if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	slightBounceAndLaunchEnemy(0.65);
	slowDown(false);
	if dir > 90 and dir < 270  spin += spd/10;
	else spin -= spd/10;
}
