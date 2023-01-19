shotTimer = 0;
var ID = id;
with instance_create_layer(x,y+yoffset,"bullet",bulletType) {
	dir = ID.dir+random_range(-10,10);
	spd = ID.bulletSpd;
	dmg = ID.dmg;
	//sprite_set_offset(sprite_index,sprite_get_xoffset(sprite_index),sprite_get_yoffset(sprite_index)+(other.y-y))
}
audio_play_sound(sndShoot,1,false);