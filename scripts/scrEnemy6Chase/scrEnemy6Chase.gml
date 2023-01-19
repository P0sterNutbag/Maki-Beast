function scrEnemy6Chase() {
	// Find nearest projectile
	var xx = x;
	x -= 10000;
	var inst = instance_nearest(xx, y, parGrabbable);
	if inst != id {
		grabObj = inst
	}
	x += 10000;
	dir = point_direction(x,y,grabObj.x,grabObj.y);

	// Move
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);

	collision(hsp,vsp,objWall);

	if collision_line(x,y,objPlayer.x,objPlayer.y,parEnemy,false,true) {
		spd = throwSpd/2;
	} else spd = maxSpd;
	
	// Grab object
	if place_meeting(x,y,grabObj) and grabObj.state != states.toss and grabObj.state != states.hold {
		var ID = id;
		with grabObj {
			state = states.hold;
			dad = ID;
		}
		image_index = 0;
		state = states.attack;
	}
	
	// Animate
	sprite_index = walkSprite;
	if hsp != 0  image_xscale = sign(hsp);
	image_speed = 1;
}
