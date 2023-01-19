var ID = id;
if deadObject != noone {
	with instance_create_layer(x,y,"enemy",deadObject) {
		sprite_index = ID.deadSprite;
		dir = ID.bounceDir;
		throwSpd = 125;
		spd = throwSpd;
		dad = objPlayer.id;
		state = states.toss;
	}
}
audio_play_sound(sndDie,1,false);

instance_destroy(parEnemy);
instance_destroy(objEnemySummon);

with objControl {
	alarm[1] = 60;
}

// Make a health
instance_create_layer(x,y+5,"player",objHealthkit2);

repeat(10) {
	instance_create_layer(x,y,"partical",objCoin);
}
