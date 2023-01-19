if state = states.walk {
	scrProjectileWalk();
} else if state = states.hold {
	scrProjectileHold();
	image_speed = 0;
	image_index = 0;
} else if state = states.toss {
	move();
	bounceOnWalls();
	slightBounceAndHurtEnemy(0.2);
	slowDown(false);
	if spd < 5 {
		image_speed = 1;
		canhurt = true;
	}
}

if image_index >= hitFrame and image_index < hitFrame+1 {
	if canhurt {
		canhurt = false;
		var bulletAmount = 8;
		var bulletOffset = 360/bulletAmount;
		var bulletDmg = 5;
		for (var i=0; i<bulletAmount; i++) {
			with instance_create_layer(x,y,"projectile",objPlayerBullet) {
				dir = i*bulletOffset;
				dmg = bulletDmg;
			}
		}
		audio_play_sound(sndShoot2,1,false);
	}
}