if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	shootBullets(objPlayerBullet,250,3.5,spin,2.5) 
	slowDown(false);
	if dir > 90 and dir < 270  spin += spd/5;
	else spin -= spd/5;
	image_xscale = 1;
}
