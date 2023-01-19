// Functions for thrown objects
#region // oldies but goodies
function scrProjectileWalk() {
	if place_meeting(x,y,objWall) {
		while place_meeting(x,y,objWall)  y++;
	}
}
function scrProjectileHold() {
	if instance_exists(dad) {
		x = dad.x;
		y = dad.y-yoffset;
		image_xscale = dad.image_xscale;
	} else state = states.walk;
	spd = throwSpd;
	bounce = 0;
	canhurtDad = false;
}
function scrBounceMove(fric,sound,dust) {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);

	bounceOnWalls(sound);

	bounceAndHurtEnemy(sound);

	spd -= fric;

	if spd <= 1 {
		instance_create_layer(x,y,"projectile",objDust2);
		state = states.walk;
	} 
	if !place_meeting(x,y,dust) instance_create_layer(x,y,"projectile",dust);
	
	simpleCollision(hsp,vsp,objWall);
}
function scrBounceMoveHurt(fric,sound,dust) {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);
	
	bounceOnWalls(sound);

	// Check for collision with target
	bounceAndHurtEnemy(sound);
	
	// Check for collision with target2
	bounceAndHurtDad(sound)

	spd -= fric;

	if spd <= 1 {
		instance_create_layer(x,y,"projectile",objDust2);
		state = states.walk;
	} 
	if !place_meeting(x,y,dust) instance_create_layer(x,y,"projectile",dust);

	if instance_exists(dad) and !collision_rectangle(dad.x-6,dad.y,dad.x+6,dad.y-12,self,false,false) {
		canhurtDad = true;
	}

	collision(hsp,vsp,objWall);
}
function scrBounceExplode(fric,sound,explodeTime,dust) {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);

	if !place_meeting(x,y,objWall) and place_meeting(x+sign(hsp),y+sign(vsp),objWall) {
		if place_meeting(x+1,y,objWall) {
			var changeDir = -(dir*2)+180
		} else if place_meeting(x-1,y,objWall) {
			var changeDir = ((180-dir)*2)+180
		} else if place_meeting(x,y+1,objWall) {
			var changeDir = ((270-dir)*2)+180
		} else if place_meeting(x,y-1,objWall) {
			var changeDir = ((90-dir)*2)+180
		} else changeDir = 180;
		dir += changeDir;
		audio_play_sound(sound,1,false);
	}

	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var enemy = instance_place(x+sign(hsp)*3,y+sign(vsp)*3,target)
	if enemy and enemy.enemyPar != id {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
			var ID = id;
			if place_meeting(x+3,y,parEnemyHurtbox) or place_meeting(x-3,y,parEnemyHurtbox) {
				var changeDir = -(dir*2)+180
			} else if place_meeting(x,y+3,parEnemyHurtbox) {
				var changeDir = ((270-dir)*2)+180
			} else if place_meeting(x,y-3,parEnemyHurtbox) {
				var changeDir = ((90-dir)*2)+180
			} else changeDir = 180;
			dir += changeDir;
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg);
			enemy.hurtObject = id
			spd = 10;
		}
	} else {
		canhurt = true;
	}

	spd -= fric;

	if spd <= 1 {
		alarm[0] = 1;
		alarm[1] = explodeTime;
		instance_create_layer(x,y,"projectile",objDust2);
		state = states.walk;
	}
	if !place_meeting(x,y,dust) instance_create_layer(x,y,"projectile",dust);

	while place_meeting(x,y,objWall) and collision_rectangle(dad.x-8,dad.y,dad.x+8,dad.y-18,self,false,false) {
		y += 1;
	}

	collision(hsp,vsp,objWall);
}
function scrDontBounceMove(fric,sound) {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);
	collision(hsp,vsp,objWall);

	if place_meeting(x+sign(hsp),y+sign(vsp),objWall) {
		spd = 0;
		audio_play_sound(sound,1,false);
	}

	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var enemy = instance_place(x+sign(hsp),y+sign(vsp),target)
	if enemy and enemy.enemyPar != id {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,dmg);
			enemy.hurtObject = id
		}
		//bounce += 1;
	}  else {
		canhurt = true;
	}

	// Slow down and stop
	spd -= fric;

	if spd <= 1 {
		state = states.walk;
		instance_create_layer(x,y,"projectile",objDust2);
	}

	while place_meeting(x,y,objWall) and collision_rectangle(dad.x-8,dad.y,dad.x+8,dad.y-18,self,false,false) {
		y += 1;
	}
}
function scrMoveReturn(fric,sound,dust) {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);
	
	// Set canReturn
	if !place_meeting(x,y,objPlayer) {
		canReturn = true;
	}

	if !place_meeting(x,y,objWall) and place_meeting(x+sign(hsp),y+sign(vsp),objWall) {
		audio_play_sound(sound,1,false);
		if spd <= 1 {
			instance_create_layer(x,y,"projectile",objDust2);
			state = states.walk;
		} else {
			spd = 0;
		}
	}

	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var hurtbox = instance_place(x+sign(hsp),y+sign(vsp),target);
	if hurtbox {
		var enemy = hurtbox.enemyPar;
		if ds_list_find_index(damagedEnemies,enemy) == -1 {
			ds_list_add(damagedEnemies,enemy);
			var d = dir;
			with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy,dmg);
			enemy.hurtObject = id;
			hits += 1;
		}
	} else {
		for (var i=0; i<ds_list_size(damagedEnemies); i++) {
			if !place_meeting(x,y,ds_list_find_value(damagedEnemies,i)) {
				ds_list_delete(damagedEnemies,i);
			}
		}
	}

	spd -= fric;

	// Slow Down and return to thrower
	if spd <= 1 {
		if instance_exists(dad) {
			dir = point_direction(dad.x,dad.y,x,y);
			if place_meeting(x,y,dad) and canReturn {
				instance_create_layer(x,y,"projectile",objDust2);
				state = states.walk;
			}
		} else {
			instance_create_layer(x,y,"projectile",objDust2);
			state = states.walk;
		}
	} 

	// Get out of wall when thrown
	while place_meeting(x,y,objWall) and collision_rectangle(dad.x-8,dad.y,dad.x+8,dad.y-18,self,false,false) {
		y += 1;
	}

	collision(hsp,vsp,objWall);
	
	// Animate
	spin += 10;
}
function scrLightBounceMove(fric,sound,dust) {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);

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
		spd *= bounceSpdChange;
		audio_play_sound(sound,1,false);
	}

	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	//var checkoffset = 3;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id and enemy.enemyPar.invincible = false {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			enemy.enemyPar.bounceDir = dir;
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
			spd *= bounceSpdChange;
			dir += changeDir;
			//bounce += 1;
			
			audio_play_sound(sound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg);
		}
	} else {
		canhurt = true;
	}

	spd -= fric;

	if spd <= 1 {
		instance_create_layer(x,y,"projectile",objDust2);
		state = states.walk;
	} 
	if !place_meeting(x,y,dust) instance_create_layer(x,y,"projectile",dust);
	
	simpleCollision(hsp,vsp,objWall);
}
#endregion

function slowDown(createDust) {
	spd -= fric;

	if spd <= 1 {
		instance_create_layer(x,y,"projectile",objDust2);
		bounce = 0;
		state = states.walk;
	} 
	if createDust {
		if !place_meeting(x,y,dust) instance_create_layer(x,y,"projectile",dust);
	}
}
function slowDownExplode() {
	spd -= fric;

	if spd <= 1 {
		alarm[0] = 1;
		alarm[1] = explodeTime;
		instance_create_layer(x,y,"projectile",objDust2);
		state = states.walk;
	} 
	if !place_meeting(x,y,dust) instance_create_layer(x,y,"projectile",dust);
}
function move() {
	hsp = lengthdir_x(spd,dir);
	vsp = lengthdir_y(spd,dir);
	simpleCollision(hsp,vsp,objWall);
}
function bounceOnWalls() {
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
		//audio_sound_pitch(hitSound,1);
		audio_play_sound(hitSound,1,false);
	}
}
function bounceAndHurtEnemy() {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	//var checkoffset = 3;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id and enemy.enemyPar.invincible = false {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			enemy.enemyPar.bounceDir = dir;
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
			bounce += 1;
			//audio_sound_pitch(hitSound,bounce);
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg);
		}
	} else {
		canhurt = true;
	}
}
function stunEnemyDestroy() {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id and enemy.enemyPar.invincible = false {
		if canhurt = true {
			canhurt = false;
			enemy.enemyPar.bounceDir = dir;
			audio_play_sound(hitSound,1,false);
			var ID = id;
			scrDamage(enemy.enemyPar,ID.dmg);
			if enemy.enemyPar.state != states.stun and enemy.enemyPar.canKnockback{
				with enemy.enemyPar {
					stunTime = ID.stunTime;
					stunTimer = 0;
					state = states.stun;
				}
			}
			instance_destroy();
		}
	} else {
		canhurt = true;
	}
}
function stunEnemyBounce() {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id and enemy.enemyPar.invincible = false {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			enemy.enemyPar.bounceDir = dir;
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
			
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg);
			with enemy.enemyPar {
				if state != states.stun and canKnockback {
					stunTime = ID.stunTime;
					stunTimer = 0;
					state = states.stun;
				}
			}
		}
	} else {
		canhurt = true;
	}
}
function stunHurtEnemy(stunTimee) {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var hurtbox = instance_place(x+sign(hsp),y+sign(vsp),target);
	if hurtbox {
		var enemy = hurtbox.enemyPar;
		if ds_list_find_index(damagedEnemies,enemy) == -1 {
			ds_list_add(damagedEnemies,enemy);
			var d = dir;
			with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy,dmg);
			enemy.hurtObject = id;
			//hits += 1;
			with enemy {
				if state != states.stun and enemy.canKnockback {
					stunTime = stunTimee;
					stunTimer = 0;
					state = states.stun;
				}
			}
		}
	} else {
		for (var i=0; i<ds_list_size(damagedEnemies); i++) {
			if !place_meeting(x,y,ds_list_find_value(damagedEnemies,i)) {
				ds_list_delete(damagedEnemies,i);
			}
		}
	}
}
function bounceAndHurtDad() {
	// Don't hurt dad when thrown
	if instance_exists(dad) and !collision_rectangle(dad.x-6,dad.y,dad.x+6,dad.y-12,self,false,false) {
		canhurtDad = true;
	}
	
	// Check for collision with target
	if dad = objPlayer.id  var target = objPlayerHurtbox;
	else  target = parEnemyHurtbox;
	//var checkoffset = 3;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy  and enemy.enemyPar.invincible = false {
		if canhurtDad {
			canhurtDad = false;
			var d = dir;
			enemy.enemyPar.bounceDir = dir;
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
			//bounce += 1;
			
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg/2);
		}
	} else {
		canhurt = true;
	}
}
function hurtEnemy() {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var hurtbox = instance_place(x+sign(hsp),y+sign(vsp),target);
	if hurtbox {
		var enemy = hurtbox.enemyPar;
		if ds_list_find_index(damagedEnemies,enemy) == -1 {
			ds_list_add(damagedEnemies,enemy);
			var d = dir;
			with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy,dmg);
			enemy.hurtObject = id;
			//hits += 1;
		}
	} else {
		for (var i=0; i<ds_list_size(damagedEnemies); i++) {
			if !place_meeting(x,y,ds_list_find_value(damagedEnemies,i)) {
				ds_list_delete(damagedEnemies,i);
			}
		}
	}
}
function hurtEnemyDestroy() {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	var hurtbox = instance_place(x+sign(hsp),y+sign(vsp),target);
	if hurtbox {
		var enemy = hurtbox.enemyPar;
		var d = dir;
		with instance_create_layer(x+lengthdir_x(12,d),y+lengthdir_y(12,d),"partical",objHitPartical) image_angle = d;
		audio_play_sound(hitSound,1,false);
		scrDamage(enemy,dmg);
		enemy.hurtObject = id;
		//hits += 1;
		instance_destroy();
	}
}
function slowDownReturn() {
	spd -= fric;
	
	// Slow Down and return to thrower
	if spd <= 1 {
		if instance_exists(dad) {
			dir = point_direction(dad.x,dad.y,x,y);
			if place_meeting(x,y,dad) {//and canReturn {
				instance_create_layer(x,y,"projectile",objDust2);
				state = states.walk;
			}
		} else {
			instance_create_layer(x,y,"projectile",objDust2);
			state = states.walk;
		}
	} 
}
function stopInWall() {
	// Stop if meeting a wall 
	if !place_meeting(x,y,objWall) and place_meeting(x+sign(hsp),y+sign(vsp),objWall) {
		audio_play_sound(hitSound,1,false);
		instance_create_layer(x,y,"projectile",objDust2);
		spd = 0;
		state = states.walk;
	}
}
function destroyInWall() {
	// Stop if meeting a wall 
	if !place_meeting(x,y,objWall) and place_meeting(x+sign(hsp),y+sign(vsp),objWall) {
		audio_play_sound(hitSound,1,false);
		instance_create_layer(x,y,"projectile",objDust3);
		instance_destroy();
	}
}
function slightBounceAndHurtEnemy(bounceSpdChange) {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	//var checkoffset = 3;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id and enemy.enemyPar.invincible = false {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			enemy.enemyPar.bounceDir = dir;
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
			spd *= bounceSpdChange;
			dir += changeDir;
			//bounce += 1;
			
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg);
		}
	} else {
		canhurt = true;
	}
}
function slightBounceOnWalls(bounceSpdChange) {
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
		spd *= bounceSpdChange;
		audio_play_sound(hitSound,1,false);
	}
}	
function slightBounceAndLaunchEnemy(bounceSpdChange) {
	// Check for collision with target
	if dad = objPlayer.id  var target = parEnemyHurtbox;
	else  target = objPlayerHurtbox;
	//var checkoffset = 3;
	var enemy = instance_place(x+hsp*global.dt,y+vsp*global.dt,target)
	if enemy and enemy.enemyPar != id and enemy.enemyPar.invincible = false {
		if canhurt = true {
			canhurt = false;
			var d = dir;
			enemy.enemyPar.bounceDir = dir;
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
			spd *= bounceSpdChange;
			dir += changeDir;
			//bounce += 1;
			
			audio_play_sound(hitSound,1,false);
			scrDamage(enemy.enemyPar,ID.dmg);
			// Launch Enemy
			with enemy.enemyPar {
				if canKnockback {
					maxSpd = throwSpd;
					dir = bounceDir;
					dad = objPlayer;
					state = states.toss;
				}
			}
		}
	} else {
		canhurt = true;
	}
}
function shootBullets(bulletType,bulletSpd,bulletDmg,bulletDir,shootTime) {
	if shootTimer >= shootTime {
		//var ID = id;
		with instance_create_layer(x,y,"bullet",bulletType) {
			spd = bulletSpd;
			dir = bulletDir;
			dmg = bulletDmg;
		}
		audio_play_sound(sndShoot2,1,false);
		shootTimer = 0;
	} else {
		shootTimer++;
	}
}
function shootBulletSpread(bulletType,bulletSpd,bulletDmg,bulletDir,bulletAmount,spread,shootTime) {
	var startDir = bulletDir-((bulletAmount*spread)/2);
	if shootTimer >= shootTime {
		for (var i=0; i<bulletAmount; i++) {
			var realDir = (spread/2)+startDir+spread*i;
			with instance_create_layer(x,y,"bullet",bulletType) {
				spd = bulletSpd;
				dir = realDir;
				dmg = bulletDmg;
			}
		}
		audio_play_sound(sndShoot2,1,false);
		audio_play_sound(sndShoot2,1,false);
		shootTimer = 0;
	} else {
		shootTimer++;
	}
}
