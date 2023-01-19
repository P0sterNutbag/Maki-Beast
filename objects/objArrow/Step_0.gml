if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	image_xscale = 1;
} else if state = states.toss {
	move();
	stopInWall();
	slightBounceAndHurtEnemy(0.01);
	slowDown(false);
	// rotate saw
	image_angle = point_direction(xprevious,yprevious,x,y);
}