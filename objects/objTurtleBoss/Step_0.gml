event_inherited();

if instance_exists(objPlayer) {
	switch(state) {
		case states.chase: scrEnemyChase(); break;
		case states.attack: #region
			// Movement
			dir = point_direction(x,y,objPlayer.x,objPlayer.y);
			vsp = 0; hsp = 0;
			collision(hsp,vsp,objWall);

			// Shoot bullets
			if image_index >= shootFrame and image_index < shootFrame+1 and canshoot {
				shots++;
				canshoot = false;
				if shootType = 1  alarm[1] = 1;
				scrShootCircle(bulletAmount,bulletSpd,dmg);
				if shots = 3 and global.difficulty == "hard" {
					var ID = id;
					with instance_create_layer(x,y+yoffset,"bullet",objHomingBullet) {
						dir = ID.dir;
						spd = 40;
						dmg = 5;
					}
				}
				audio_play_sound(sndShoot,1,false);
			} else if image_index >= image_number-1 {
				attackTimer = 0;
				canshoot = true;
				if shots > 2 {
					var odds = strafeOdds;
					shots = 0;
					if irandom(odds) = odds {
						scrInitiateStrafe();
					} else {
						state = states.wait;
					}
				}
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
		case states.knockBack: scrEnemyKnockback(); break;
		case states.stun: scrEnemyStun(); break;
	}
}