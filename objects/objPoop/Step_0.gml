if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	slightBounceAndHurtEnemy(bounceSpdChange);
	slowDown(false);
	if spd < 2 {
		instance_create_layer(x,y,"partical",objPoopstain);
		instance_destroy();
	}
}