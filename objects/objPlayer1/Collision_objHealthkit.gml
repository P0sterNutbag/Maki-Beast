if hp != maxHp {
	if hp + other.hpup < maxHp  hp += other.hpup;
	else hp = maxHp;
	audio_play_sound(sndHpUp,1,false);
	instance_destroy(other);
}