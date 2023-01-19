if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	slowDown(false);
	
	if instance_exists(parEnemy) {
		var targetId = instance_nearest(x,y,parEnemy);
		var targetDir = point_direction(x,y,targetId.x,targetId.y);
	} else  targetDir = dir;
	var dd = angle_difference(dir, targetDir);
	dir -= (abs(dd)*0.10*sign(dd));

}