if shots < bulletAmount {
	shotTimer = 0;
	shots += 1;
	var ID = id;
	with instance_create_layer(x,y+yoffset,"bullet",bulletType) {
		dir = ID.dir;
		spd = ID.bulletSpd;
		dmg = ID.dmg;
	}
	alarm[1] = shotTime;
}