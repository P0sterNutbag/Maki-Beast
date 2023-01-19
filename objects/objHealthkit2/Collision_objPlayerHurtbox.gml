if objPlayer.hp = objPlayer.maxHp {
	//exit;
} else if objPlayer.hp < objPlayer.maxHp-hpUp {
	objPlayer.hp += hpUp;
	audio_play_sound(sndHpUp,1,false);
	instance_destroy();
} else {
	objPlayer.hp = objPlayer.maxHp;
	audio_play_sound(sndHpUp,1,false);
	instance_destroy();
}
