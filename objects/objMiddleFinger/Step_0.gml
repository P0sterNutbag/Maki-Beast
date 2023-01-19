if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	dir = point_direction(x,y,mouse_x,mouse_y);
	image_xscale = 1;
} else if state = states.toss {
	move();
	stunHurtEnemy(180);
	stopInWall();
	slowDown(false);
}