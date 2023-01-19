event_inherited();

//var state_current = state

if instance_exists(objPlayer) {
	switch(state) {
		case states.attack: #region
			// Initiate attack
			if state_is_new {
				state_is_new = !state_is_new
				attackType = irandom(1);
				execute after 6 seconds
					image_index = 0;
					state_is_new = true;
					state = states.wait;
				done
			}
			// Animate
			sprite_index = attackSprite;
			// Shoot bullets
			if image_index >= shootFrame {
				image_speed = 0;
				// Spiral pattern
				if attackType = 0 {
					shotTimer++
					if shotTimer % attack1ShotDelay == 0 {
						dir += 15;
						var ID = id;
						with instance_create_layer(x,y+yoffset,"bullet",objBullet) {
							dir = ID.dir;
							spd = 100;
							dmg = ID.dmg;
						}
						with instance_create_layer(x,y+yoffset,"bullet",objBullet) {
							dir = ID.dir-180;
							spd = 100;
							dmg = ID.dmg;
						}
					} 
					/*if shotTimer % 30 == 0 {
						var ID = id;
						with instance_create_layer(x,y+yoffset,"bullet",objBullet) {
							dir = point_direction(x,y,objPlayer.x,objPlayer.y)+random_range(10,-10);
							spd = 100;
							dmg = ID.dmg;
						}
					}*/
				}
				// Rapid fire
				if attackType = 1 {
					if shotTimer >= attack2ShotDelay {
						shotTimer = 0;
						dir = point_direction(x,y,objPlayer.x,objPlayer.y);
						var ID = id;
						with instance_create_layer(x,y+yoffset,"bullet",objBullet) {
							dir = ID.dir+random_range(50,-50);
							spd = 100;
							dmg = ID.dmg;
						}
						with instance_create_layer(x,y+yoffset,"bullet",objBullet) {
							dir = ID.dir+random_range(200,-200);
							spd = 100;
							dmg = ID.dmg;
						}
					} else {
						shotTimer++
					}
				}
			} else {
				dir = 270;
				shotTimer = 0;
				xx = 0;
				image_speed = 1;
			}
		break; #endregion
		case states.wait: #region
			if state_is_new {
				state_is_new = !state_is_new
				execute after 2*global.attackTimeModifier seconds
					image_index = 0;
					state_is_new = true;
					state = states.attack;
				done
			}
			sprite_index = idleSprite;
			image_speed = 0;
		break; #endregion
	}
}

// Health 
var crystalCount = instance_number(objCrystal);
if crystalCount > 0 {
	flash = false;
	for (var i=0; i<crystalCount; i++) {
		var c = instance_find(objCrystal,i);
		if c.flash  flash = true;
	}
} else {
	instance_create_depth(x,y,depth,objWendigoBossDead);
	instance_destroy();
}

// Check if state has been changed
//state_is_new = state != state_current
