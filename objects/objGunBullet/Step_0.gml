if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	image_xscale = 1;
	dir = point_direction(x,y,mouse_x,mouse_y);
} else if state = states.toss {
	move();
	hurtEnemy();
	destroyInWall();
}