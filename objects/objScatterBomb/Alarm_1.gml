if instance_exists(objPlayer) {
	if objPlayer.grabObj == id {
		objPlayer.grabObj = noone;
	}
}

instance_destroy();