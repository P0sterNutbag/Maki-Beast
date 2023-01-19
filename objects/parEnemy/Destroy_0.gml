//if instance_exists(objPlayer) and x < objPlayer.x  var spd = -20;
//else spd = 20;
var ID = id;
if deadObject != noone {
	with instance_create_layer(x,y,"enemy",deadObject) {
		sprite_index = ID.deadSprite;
		dir = ID.bounceDir;
		throwSpd = 125;
		spd = throwSpd;
		//fric = ID.deadFric;
		//dmg = ID.deadDmg;
		dad = objPlayer.id;
		state = states.toss;
	}
}
audio_play_sound(sndDie,1,false);

/*if instance_number(parEnemy) = 1 {
	with objControl {
		alarm[1] = 60;
	}
	/*dir = random(360);
	while (place_meeting(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),objWall)) {
		dir = random(360);
	}
	instance_create_layer(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),"control",objEgg);
	
}*/

/*if objHud.alarm[0] > 0  var chance = irandom_range(4,5)
else*/  chance = choose(0,1,1,1,1,1,2,2);
repeat(chance) {
	instance_create_layer(x,y,"partical",objCoin);
}
//with objHud  alarm[0] = comboTime;

/*
with objHud {
	alarm[1] = comboTime;
	global.killCount += 1; 
}*/

// Make a health kit maybe
if irandom(100) < global.hpDropRate { //9 {
	instance_create_layer(x,y,"player",objHealthkit);
}

//repeat(5) instance_create_layer(x,y,"projectile",objCoin);

/*with objHud {
	killCount += 1;
	alarm[1] = comboTime;
}
//audio_play_sound(sndEnemyDie,1,false);