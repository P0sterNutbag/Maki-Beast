if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	spin = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	// shoot
	if irandom(10) = 0 {
		bulletType = objPlayerBullet2;
		bulletDmg = 50;
	} else {
		bulletType = objPlayerBullet;
		bulletDmg = 5;
	}
	shootBullets(bulletType,250,bulletDmg,spin,7) 
	slowDown(false);
	if dir > 90 and dir < 270  spin += spd/5;
	else spin -= spd/5;
	image_xscale = 1;
}
