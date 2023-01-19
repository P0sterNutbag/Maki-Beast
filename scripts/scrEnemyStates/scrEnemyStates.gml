function scrEnemyAttack() {
	dir = point_direction(x,y,objPlayer.x,objPlayer.y);
	vsp = 0; hsp = 0;
	collision(hsp,vsp,objWall);

	if image_index >= shootFrame and canshoot {
		shots = 0;
		canshoot = false;
		attackTimer = 0;
		if shootType = 1  alarm[1] = 1;
		if shootType = 2  scrShootCircle(bulletAmount,bulletSpd,dmg);
		if shootType = 3  scrShootBurst(bulletAmount,bulletSpread,bulletSpd,dmg);
		if shootType = 4  alarm[1] = 1;
		if shootType = 5 {
			canshoot = true;
			targX = x+lengthdir_x(meleeRange,dir);
			targY = y+lengthdir_y(meleeRange,dir);
			image_index = 0;
			state = states.melee;
		}
		if shootType = 6 {
			maxSpd = throwSpd;
			dad = id;
			state = states.toss;
		}
		if shootType = 7 {
			repeat(bulletAmount) {
				var ID = id;
				var xx = objPlayer.x+random_range(-bulletOffset,bulletOffset);
				var yy = objPlayer.y+random_range(-bulletOffset,bulletOffset);
				while position_meeting(xx,yy,objWall) {
					var xx = objPlayer.x+random_range(-bulletOffset,bulletOffset);
					var yy = objPlayer.y+random_range(-bulletOffset,bulletOffset);
				}
				with instance_create_layer(xx,yy,"bullet",objPillarBullet) {
					dmg = ID.dmg;
				}
			}
		}
		audio_play_sound(sndShoot,1,false);
	} else if image_index >= image_number-1 {
		canshoot = true;
		if shootType != 5 and strafeOdds >= 0 {
			var odds = strafeOdds;
			if irandom(odds) = odds {
				scrInitiateStrafe();
			} else {
				state = states.wait;
			}
		} else {
			state = states.wait;
		}
	}
	
	// Animate
	sprite_index = attackSprite;
	image_speed = 1;
	if x < objPlayer.x  image_xscale = 1;
	else  image_xscale = -1;
}
function scrEnemyChase() {
	dir = point_direction(x,y,objPlayer.x,objPlayer.y);

	// Move
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);

	collision(hsp,vsp,objWall);

	/*if collision_line(x,y,objPlayer.x,objPlayer.y,parEnemy,false,true) {
		spd = maxSpd/2;
	} else spd = maxSpd;*/
	
	// Shoot
	if dis <= range {
		state = states.wait
	}
	if attackTimer >= attackTime*global.attackTimeModifier*1.5 and canSeePlayer{
		image_index = 0;
		state = states.attack
	} else {
		attackTimer++;
	}
	
	// Animate
	sprite_index = walkSprite;
	if hsp != 0  image_xscale = sign(hsp);
	image_speed = 1;
}
function scrEnemyMeleeChase() {
	dir = point_direction(x,y,objPlayer.x,objPlayer.y);

	// Move
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);

	collision(hsp,vsp,objWall);

	/*if collision_line(x,y,objPlayer.x,objPlayer.y,parEnemy,false,true) {
		spd = maxSpd/2;
	} else spd = maxSpd;*/
	
	// Shoot
	if dis <= range {
		state = states.wait
	}
	
	// Animate
	sprite_index = walkSprite;
	if hsp != 0  image_xscale = sign(hsp);
	image_speed = 1;
}
function scrEnemyWait() {
	hsp = 0;
	vsp = 0;
	collision(hsp,vsp,objWall);
	// Wait to attack the player
	if attackTimer >= attackTime*global.attackTimeModifier and canSeePlayer {
		image_index = 0;
		state = states.attack
	} else {
		attackTimer++
	}
	// Return to chase if out of range
	if dis > range {
		state = states.chase;
	}
	// Animate
	sprite_index = idleSprite;
	image_speed = 1;
	if x < objPlayer.x  image_xscale = 1;
	else  image_xscale = -1;
}
function scrEnemyHold() {
	hsp = 0; vsp = 0;
	if instance_exists(dad) {
		x = dad.x;
		y = dad.y-dad.sprite_height/2;;
	} else state = states.wait;
	maxSpd = throwSpd;
	bounce = 0;

	attackTimer = 0;
	
	// Escape from player
	if dad = objPlayer.id {
		if alarm[5] = -1  alarm[5] = 90;
	}

	// Animate
	sprite_index = throwSprite;
	image_xscale = dad.image_xscale;
	image_speed = 1;
}
function scrInitiateStrafe() {
	// Go into strafe
	randomize();
	if strafeDirMin = 0 and strafeDirMax = 0 { // Run strait away from player
		dir = point_direction(objPlayer.x,objPlayer.y,x,y);
		strafeDis = random_range(strafeRangeMin,strafeRangeMax);
		while position_meeting(x+lengthdir_x(strafeDis,dir),y+lengthdir_y(strafeDis,dir),objWall) {
			strafeDis--;
		}
	} else { // Move in a different direction
		if instance_exists(objPlayer) {
			var dirToPlayer = point_direction(x,y-1,objPlayer.x,objPlayer.y);
		} else dirToPlayer = 0;
		dir = dirToPlayer + random_range(strafeDirMin,strafeDirMax) * choose(1,-1);
		strafeDis = random_range(strafeRangeMin,strafeRangeMax);
		// Make sure its a reachable spot
		var laps = 0;
		while collision_line(x,y-1,x+lengthdir_x(strafeDis,dir),y+lengthdir_y(strafeDis,dir),objWall,false,false) {
			dir = dirToPlayer + random_range(strafeDirMin,strafeDirMax) * choose(1,-1);
			strafeDis = random_range(strafeRangeMin,strafeRangeMax);
			laps++;
			if laps > 100 {
				state = states.wait;
				break;
			}
		}
	}
	xorg = x;
	yorg = y;
	
	state = states.strafe;
}
function scrEnemyStrafe() {
	canshoot = true;
	// Move
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);
	
	// Don't move out of range
	if dis+1 >= range {
		state = states.wait;
	}

	collision(hsp,vsp,objWall);
	
	// Leave strafe
	if point_distance(x,y,xorg,yorg) >= strafeDis {
		state = states.wait;
	}
	if place_meeting(x+lengthdir_x(8,dir),y+lengthdir_y(8,dir),objWall) {
		state = states.wait;
	}
	
	// Shoot
	if attackTimer >= attackTime*global.attackTimeModifier and canSeePlayer {
		image_index = 0;
		state = states.attack;
	} else {
		attackTimer++;
	}
	
	// Animate
	sprite_index = walkSprite;
	if hsp != 0  image_xscale = sign(hsp);
	image_speed = 1;
}
function scrEnemyThrow() {
	canshoot = true;

	hsp = lengthdir_x(maxSpd,dir);
	vsp = lengthdir_y(maxSpd,dir);

	if !place_meeting(x,y,objWall) and place_meeting(x+hsp*global.dt,y+vsp*global.dt,objWall) {
		if place_meeting(x+hsp*global.dt,y,objWall) {
			var changeDir = -(dir*2)+180
		} else if place_meeting(x-hsp*global.dt,y,objWall) {
			var changeDir = ((180-dir)*2)+180
		} else if place_meeting(x,y+vsp*global.dt,objWall) {
			var changeDir = ((270-dir)*2)+180
		} else if place_meeting(x,y-vsp*global.dt,objWall) {
			var changeDir = ((90-dir)*2)+180
		} else changeDir = 180;
		dir += changeDir;
		audio_play_sound(sndImpact,1,false);
	}

	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
			var ID = id;
			if place_meeting(x+hsp*global.dt,y,enemy) {
				var changeDir = -(dir*2)+180
			} else if place_meeting(x-hsp*global.dt,y,enemy) {
				var changeDir = ((180-dir)*2)+180
			} else if place_meeting(x,y+vsp*global.dt,enemy) {
				var changeDir = ((270-dir)*2)+180
			} else if place_meeting(x,y-vsp*global.dt,enemy) {
				var changeDir = ((90-dir)*2)+180
			} else changeDir = 180;
			dir += changeDir;
			////bounce += 1;
			
			audio_play_sound(sndImpact,1,false);
			scrDamage(enemy.enemyPar,ID.throwDmg);
		}
	} else {
		canhurt = true;
	}

	maxSpd -= fric;

	if object_index = objTurtle {
		var stopSpd = 30;
		if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objShield) {
			state = states.wait;
		}
	} else  stopSpd = 1;
	
	if maxSpd <= stopSpd {
		image_index = 0;
		instance_create_layer(x,y,"projectile",objDust2);
		// Resert birdy so its flying
		if object_index == objBirdy {
			y += 5;
		} 
		if object_index == objMole {
			state = states.dig;
		} else {
			var odds = strafeOdds;
			if irandom(odds) = odds {
				scrInitiateStrafe();
			}
			state = states.wait;
		} 
	} 
	if !place_meeting(x,y,objDust1) instance_create_layer(x,y,"projectile",objDust1);

	simpleCollision(hsp,vsp,objWall);

	attackTimer = 0;
	
	// Animate
	sprite_index = throwSprite;
	image_speed = 1;
}
function scrEnemyKnockback() {
	hsp = lengthdir_x(knockBackSpd,bounceDir);
	vsp = lengthdir_y(knockBackSpd,bounceDir);
	collision(hsp,vsp,objWall);
	
	knockBackSpd--;
	
	if knockBackSpd <= 0 {
		if object_index != objMole {
			if lastState = states.knockBack or lastState = states.melee or lastState = states.hold {
				state = states.walk;
			} else {
				maxSpd = 0;
				state = lastState;	
			}
		} else {
			image_index = 0;
			state = states.dig;
		}
	}
	
	image_speed = 1;
	sprite_index = throwSprite;
}
function scrEnemyStun() {
	hsp = lengthdir_x(knockBackSpd,bounceDir);
	vsp = lengthdir_y(knockBackSpd,bounceDir);
	collision(hsp,vsp,objWall);
	
	if knockBackSpd > 0 {
		knockBackSpd--;
	}
	
	if stunTimer >= stunTime {
		if object_index != objMole {
			if lastState == states.knockBack or lastState == states.stun {
				state = states.walk;
			} else {
				state = lastState;	
			}
		} else {
			image_index = 0;
			state = states.dig;
		}
	} else  stunTimer++;
	
	image_speed = 1;
	sprite_index = throwSprite;
	if !place_meeting(x,y,objStunStars) {
		var ID = id;
		with instance_create_layer(x,y,"partical",objStunStars) {
			dad = ID;
		}
	}
}
function scrEnemyMelee() {
	// Move
	hsp = lengthdir_x(meleeSpd,dir);
	vsp = lengthdir_y(meleeSpd,dir);
	collision(hsp,vsp,objWall);
	
	// Create Hurtbox
	var myBox = instance_create_depth(x,y,depth-1,hitbox);
	var ID = id;
	with myBox {
		if place_meeting(x,y,objPlayer) and !objPlayer.invincible {
			with ID {
				scrDamage(objPlayer,dmg);
				// Return to wait
				alarm[4] = 4;
				// Initiate strafe
				var odds = strafeOdds;
				if irandom(odds) = odds {
					alarm[3] = 30;
				}
			}
		}
	}
	
	// Leave melee
	if distance_to_point(targX,targY) < 5 {
		state = states.wait;
		// Initiate strafe
		var odds = strafeOdds;
		if irandom(odds) = odds {
			alarm[3] = 30;
		}
	} else if place_meeting(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),objWall) {
		state = states.wait;
	}
	// Don't run into shielf
	if place_meeting(x,y,objShield) {
		state = states.wait;
	}
	
	// Animate
	sprite_index = meleeSprite;
	image_speed = 1;
}
function scrEnemyDig() {
	// Change State
	if (image_index = image_number-1) {
		//instance_destroy();
		scrInitiateStrafe();
	}
	// Animate
	sprite_index = digSprite;
	image_speed = 1;
}
function scrEnemyWalk() {
	// Move
	var cantsee = collision_line(x,y-6,objPlayer.x,objPlayer.y-6,objWall,false,true);
	if !cantsee {
		if shootFirst {
			if alarm[6] = -1  alarm[6] = 30;
		} else {
			state = states.chase;
		}	
	} 
	canshoot = true;
	// Get outa wallz
	if place_meeting(x,y,objWall) {
		while place_meeting(x,y,objWall)  y++;
	}
	// Animate
	sprite_index = idleSprite;
	image_xscale = 1;
	image_speed = 1;
}
function scrEnemyOnlyChase() {
	dir = point_direction(x,y,objPlayer.x,objPlayer.y);

	// Move
	if dir > 2 {
		hsp = lengthdir_x(spd,dir);
		vsp = lengthdir_y(spd,dir);
	} else {
		hsp = 0; vsp = 0;
	}
	
	collision(hsp,vsp,objWall);
	
	// Create Hurtbox
	var myBox = instance_create_depth(x,y,depth-1,hitbox);
	var ID = id;
	with myBox {
		if place_meeting(x,y,objPlayer) and !objPlayer.invincible {
			with ID {
				scrDamage(objPlayer,dmg);
				// Initiate strafe
				var odds = strafeOdds;
				if irandom(odds) = odds {
					alarm[3] = 30;
				}
			}
		}
	}
	
	// Animate
	sprite_index = walkSprite;
	if hsp != 0  image_xscale = sign(hsp);
	image_speed = 1;
}
function scrEnemyFlee() {
	canshoot = true;
	// Move
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);
	
	// Don't move out of range
	if dis+1 >= range {
		state = states.wait;
	}
	collision(hsp,vsp,objWall);
	
	// Leave strafe
	if point_distance(x,y,xorg,yorg) >= strafeDis {
		state = states.wait;
	}
	if place_meeting(x+lengthdir_x(8,dir),y+lengthdir_y(8,dir),objWall) {
		fleeTime++;
		if fleeTime >= fleeMaxTime {
			fleeTime = 0;
			state = states.walk;
		}
	}
	
	// Animate
	sprite_index = walkSprite;
	if hsp != 0  image_xscale = sign(hsp);
	image_speed = 1;
}
function scrEnemyExplode() {
	if alarm[3] = -1  alarm[3] = blastTime;
	if alarm[4] = -1  alarm[4] = 5;
	
	image_speed = 1;
	sprite_index = attackSprite;
}