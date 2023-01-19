if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	//slightBounceOnWalls(0.1);
	hurtEnemy();
	slowDownReturn();
	stopInWall()
	spin += 10;
}