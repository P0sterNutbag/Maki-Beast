event_inherited();

if instance_exists(objPlayer) {
	switch(state) {
		case states.chase: scrEnemyChase(); break;
		case states.attack: #region
			// Set Direction and Movement
			dir = point_direction(x,y,objPlayer.x,objPlayer.y);
			vsp = 0; hsp = 0;
			collision(hsp,vsp,objWall);

			// Shoot
			if (image_index >= shootFrameFirst and image_index <= shootFrameLast) 
			or image_index >= shootFrameFirst2 and image_index <= shootFrameLast2 {
				shots = 0;
				if alarm[1] = -1  alarm[1] = shotDelay;
			} else if image_index >= image_number-1 {
				attackTimer = 0;
				scrInitiateStrafe();
			}
	
			// Animate
			sprite_index = attackSprite;
			image_speed = 1;
			if x < objPlayer.x  image_xscale = 1;
			else  image_xscale = -1;
		break; #endregion
		case states.hold: scrEnemyHold(); break;
		case states.toss: scrEnemyThrow(); break;
		case states.walk: scrEnemyWalk(); break;
		case states.strafe: scrEnemyStrafe(); break;
		case states.wait: scrEnemyWait(); break;
		//case states.dig: scrEnemyDig(); break;
		case states.knockBack: scrEnemyKnockback(); break;
		case states.stun: scrEnemyStun(); break;
	}
}

// Handle Hurtbox
if state != states.attack {
	visible = false;
	if instance_exists(myHurtbox) {
		instance_destroy(myHurtbox);
	}
} else if !instance_exists(myHurtbox) {
	visible = true;
	var ID = id;
	myHurtbox = instance_create_layer(x,y,"enemy",objMoleBossHurtbox);
	with myHurtbox {
		enemyPar = ID;
	}
}