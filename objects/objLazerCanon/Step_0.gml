if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	dir = point_direction(x,y,mouse_x,mouse_y);
} else if state = states.toss {
	move();
	bounceOnWalls();
	bounceAndHurtEnemy();
	slowDown(false);
	if spd < 5 {
		image_speed = 1;
		canhurt = true;
	}
}

// Shoot lazer beam
if image_index >= hitFrame and image_index < hitFrame+1 {
	if canhurt {
		canhurt = false;
		var xx = x+lengthdir_x(8,dir);
		var yy = y+lengthdir_y(8,dir);
		for (var i=0; i<1000; i++) {
			xx += lengthdir_x(1,dir);
			yy += lengthdir_y(1,dir);
			var ID = id;
			with instance_create_layer(xx,yy,"partical",objLazer) {
				image_angle = ID.dir;
			}
			if instance_place(xx,yy,objWall) {
				break;
			}
			// Damage Enemy
			if i mod 5 == 0 {
				var enemyHurtbox = instance_place(xx,yy,parEnemyHurtbox);
				if enemyHurtbox {
					var enemy = enemyHurtbox.enemyPar;
					if ds_list_find_index(damagedEnemies,enemy) == -1 {
						scrDamage(enemy,10);
						enemy.bounceDir = point_direction(x,y,xx,yy);
						ds_list_add(damagedEnemies,enemy);
					}
				}
			}
		}
		audio_play_sound(sndLazer,1,false);
		ds_list_clear(damagedEnemies);
		/*var enemyHurtbox = collision_line(x,y,xx,yy,parEnemyHurtbox,false,false);
		if enemyHurtbox {
			var enemy = enemyHurtbox.enemyPar;
			scrDamage(enemy,10);
			enemy.bounceDir = point_direction(x,y,xx,yy);
		}*/
	}
	image_speed = 0;
	image_index = 0;
}

