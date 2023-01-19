if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	hurtEnemy();
	if spd < 2  instance_destroy();
	if alarm[0] = -1  alarm[0] = 15;
	if place_meeting(x+hsp*global.dt,y+vsp*global.dt,objWall) {
		instance_destroy();
	}
}