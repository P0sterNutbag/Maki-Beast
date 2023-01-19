// Inputs
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S")); 
keyGrab = mouse_check_button_pressed(mb_left);
keySpecial = mouse_check_button_pressed(mb_right);
// Set Depth
depth = -y;

// Die
if (hp <= 0 and state != states.dead) or (keyboard_check_pressed(ord("L"))) {
	objControl.alarm[0] = 120;
	with instance_create_layer(x,y,"enemy",objEnemyDead) {
		sprite_index = sprPlayerDead;
		hsp = 0;
	}
	instance_destroy(objPlayerHurtbox);
	global.gold = gold;
	instance_destroy();
}


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
	var grabDis = point_distance(x,y,grabObj.x,grabObj.y);
	if keyGrab and grabDis <= grabRange and cangrab = true and grabObj.object_index != objBoss {
		var ID = id;
		with grabObj {
			state = states.hold;
			dad = ID;
			instance_create_layer(x,y,"projectile",objDust1)
		}
		state = states.hold;
	}
	
	// Roll
	if keySpecial and (hsp != 0 or vsp != 0) {
		image_index = 0;
		state = states.roll;
	}

	// Animate
	if hsp != 0 or vsp != 0 {
		sprite_index = walkSprite;
		if keyRight  image_xscale = 1;
		else if keyLeft image_xscale = -1;
	} else {
		sprite_index = idleSprite;
	}
	image_speed = 1;
	
} else if state = states.hold {
	// Set Direction
	dir = point_direction(x,y,mouse_x,mouse_y);
	//if instance_exists(grabObj)  instance_destroy(grabObj);
	// Collision
	xdir = keyRight - keyLeft;
	ydir = keyDown - keyUp;
	hsp = spd*xdir;
	vsp = spd*ydir;
	collision(hsp,vsp,objWall);

	// Throw Stuff
	if keyGrab {
		with grabObj {
			dir = point_direction(x,y,mouse_x,mouse_y);
			state = states.toss;
		}
		cangrab = false;
		alarm[3] = 20;
		state = states.walk;
	}
	
	// Roll
	if keySpecial and (hsp != 0 or vsp != 0) {
		if cursor_sprite != sprCrosshair2 {
			with grabObj  state = states.walk;
			image_index = 0;
			state = states.roll;
		}
	}

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
	}

	// Animate
	sprite_index = rollSprite;
	image_speed = 1;
	
} else if state = states.dead {
	visible = false;
}