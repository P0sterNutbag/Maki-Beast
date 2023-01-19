if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	hurtEnemy();
	stopInWall();
	// rotate saw
	spin += 0.1*spd;
}