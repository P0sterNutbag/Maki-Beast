function scrEnemy6Attack() {
	dir = point_direction(x,y-10,objPlayer.x,objPlayer.y);

	vsp = 0; hsp = 0;
	collision(hsp,vsp,objWall);

	if image_index >= shootFrame and canshoot {
		shots = 0;
		canshoot = false;
		var ID = id;
		with grabObj {
			dir = ID.dir;
			state = states.toss;
		} 
	} else if image_index >= image_number-1 {
		canshoot = true;
		state = states.chase;
	}

	// Animate
	sprite_index = attackSprite;
	if x < objPlayer.x  image_xscale = 1;
	else  image_xscale = -1;
	image_speed = 1;
}

