// Set Movement
hsp = lengthdir_x(spd, dir);
vsp = lengthdir_y(spd, dir);
collision(hsp, vsp, objWall);

// Move towards target or slow down
if target != noone and instance_exists(target) {
	dir = point_direction(x,y,target.x,target.y);
	if spd < 200  spd += 2;
} else {
	// Set target
	if spd <= 0 {
		target = objPlayer
	} else spd -= 6;
}

// Destory
if instance_exists(objPlayer) {
	if collision_rectangle(objPlayer.x-2,objPlayer.y-2,objPlayer.x+2,objPlayer.y-2,self,false,false) { 
		with objPlayer  gold += 1;
		with objHud  {
			drawGold = true;
			moneyAlpha = 1;
			alarm[2] = 120;
		}
		//audio_play_sound(sndCoin,1,false);
		instance_destroy();
	}
}

ang += spd*.17;