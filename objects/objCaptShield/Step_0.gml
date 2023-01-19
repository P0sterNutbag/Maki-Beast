if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	if spd > 0  bounceOnWalls();
	else  stopInWall();
	bounceAndHurtEnemy();
	slowDownReturn();
	// rotate 
	spin += 10;
}