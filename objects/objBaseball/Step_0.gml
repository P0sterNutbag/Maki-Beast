if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	slightBounceOnWalls(bounceSpdChange);
	slightBounceAndHurtEnemy(bounceSpdChange);
	slowDown(false);
	spin += spd/50;
}
