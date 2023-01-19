if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	dir = point_direction(x,y,mouse_x,mouse_y);
	image_xscale = 1;
	canshoot = false;
} else if state = states.toss {
	canshoot = true;
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	slowDown(false);
}

if canshoot = true {
	shootBullets(objPotato,250,3.5,dir+random_range(-3,3),45); 
}