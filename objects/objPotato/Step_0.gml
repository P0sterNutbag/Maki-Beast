if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	slowDown(false);
}

// Add myself in rotation
if ds_list_find_index(objPotatoLauncher.myPotatos,id) > 10 {
	image_alpha -= 0.05;
	if image_alpha <= 0  instance_destroy();
}
