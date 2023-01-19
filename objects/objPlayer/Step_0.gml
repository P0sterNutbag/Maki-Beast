// Inputs
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S")); 
keyGrab = mouse_check_button_pressed(mb_left);
keySpecial = mouse_check_button_pressed(mb_right);
keyBag = keyboard_check_pressed(vk_space);
// Set Depth
depth = -y;

// Die
if (hp <= 0 and state != states.dead) or (keyboard_check_pressed(ord("L"))) {
	objControl.alarm[0] = 60;
	state = states.dead;
}

// Devline
//hp = maxHp

// States
if state = states.walk {
	// Set Direction
	dir = point_direction(x,y,mouse_x,mouse_y);
	
	// Collision
	xdir = keyRight - keyLeft;
	ydir = keyDown - keyUp;
	hsp = spd*xdir;
	vsp = spd*ydir;
	collision(hsp,vsp,objWall);

	//if keyUp image_blend += 1;

	// Grab Stuff
	grabObj = instance_nearest(x,y,parGrabbable);
	if instance_exists(grabObj) and grabObj.visible = true {
		var grabDis = point_distance(x,y,grabObj.x,grabObj.y);
		if keyGrab and grabDis <= grabRange and cangrab = true and grabObj.object_index != objMoleBoss and grabObj.object_index != objTurtleBoss and grabObj.object_index != objWendigoBoss {
			var ID = id;
			with grabObj {
				state = states.hold;
				dad = ID;
				instance_create_layer(x,y,"projectile",objDust1)
			}
			state = states.hold;
		}
	}
	
	// Roll
	if keySpecial and (hsp != 0 or vsp != 0) {
		image_index = 0;
		state = states.roll;
		grabObj = noone;
		instance_create_layer(x,y,"partical",objDust5);
	}
	
	/*Grab from bag
	if (keyBag) {//or (keyGrab and !place_meeting(x,y,grabObj)) {
		if bagObj != noone {
			grabObj = instance_create_layer(x,y,"projectile",bagObj);
			var ID = id;
			with grabObj {
				state = states.hold;
				dad = ID;
				if object_index = objHpUp {
					hp = ID.bagHp;
				}
			}
			bagObj = noone;
			state = states.hold;
		}
	} */

	// Animate
	if hsp != 0 or vsp != 0 {
		sprite_index = walkSprite;
		if keyRight  image_xscale = 1;
		else if keyLeft image_xscale = -1;
	} else {
		sprite_index = idleSprite;
	}
	image_speed = 1;
	
	if (doDust = true) and ((keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("S")) or keyboard_check_pressed(ord("D")))) {
		doDust = false;
		instance_create_layer(x,y,"player",objDust5)
	}
	if x = xprevious and y = yprevious  doDust = true;
	
} else if state = states.hold {
	// Set Direction
	dir = point_direction(x,y,mouse_x,mouse_y);
	// Collision
	xdir = keyRight - keyLeft;
	ydir = keyDown - keyUp;
	hsp = spd*xdir;
	vsp = spd*ydir;
	collision(hsp,vsp,objWall);

	// Throw Stuff
	if keyGrab {
		if grabObj.state = states.hold {
			with grabObj {
				dir = point_direction(x,y,mouse_x,mouse_y);
				hsp = lengthdir_x(spd,dir);
				vsp = lengthdir_y(spd,dir);
				bounce = 0;
				// Get out of wall
				while place_meeting(x,y,objWall) {
					y += 1;
				}
				state = states.toss;
			}
			cangrab = false;
			alarm[3] = 20;
			state = states.walk;
		}
	}
	// Leave Throw
	if !instance_exists(grabObj) {
		grabObj = noone;
		state = states.walk;
	} else if grabObj.state != states.hold {
		state = states.walk;
	}

	
	// Roll
	if keySpecial and (hsp != 0 or vsp != 0) {
		if cursor_sprite != sprCrosshair2 {
			with grabObj  state = states.walk;
			grabObj = noone;
			image_index = 0;
			state = states.roll;
		}
	}
	
	/* Put projectile in bag
	if keyBag and object_get_parent(grabObj.object_index) != parEnemy {
		if bagObj != noone {
			with instance_create_layer(x,y,"projectile",bagObj) {
				state = states.walk;
			}
		}
		bagObj = grabObj.object_index;
		bagObjSprite = grabObj.sprite_index;
		if grabObj.object_index = objHpUp {
			bagHp = grabObj.hp;
		}
		instance_destroy(grabObj);
		state = states.walk;
	}*/

	// Animate
	if hsp != 0 or vsp != 0 {
		sprite_index = holdWalkSprite;
		if keyRight  image_xscale = 1;
		else if keyLeft image_xscale = -1;
	} else {
		sprite_index = holdSprite;
	}
	image_speed = 1;
	
} else if state = states.roll {
	invincible = true;
	if (image_index+image_speed <= 6) {
		hsp = rollspd*xdir;
		vsp = rollspd*ydir;
	} else {
		hsp = rollspd/2*xdir;
		vsp = rollspd/2*ydir;
	}
	// Collision
	collision(hsp,vsp,objWall);
	
	// End
	if (image_index+image_speed >= image_number) {
		invincible = false;
	    state = states.walk;
		instance_create_layer(x,y,"partical",objDust2);
	}

	// Animate
	sprite_index = rollSprite;
	image_speed = 1;
	
} else if state = states.dead {
	sprite_index = sprPlayerDead;
} else if state = states.cutscene {
	sprite_index = idleSprite
	image_speed = 1;
	
	if grabObj != noone  with grabObj  state = states.walk;
} else if state = states.stun {
	if grabObj != noone {
		with grabObj  state = states.walk;
	}
	if stunTimer >= stunTime {
		state = states.walk;
	} else  stunTimer++;
	
	sprite_index = sprPlayerStun
	image_speed = 1;
	if stunTimer = 1 {
		var ID = id;
		with instance_create_layer(x,y,"partical",objStunStars) {
			dad = ID;
		}
	}
}