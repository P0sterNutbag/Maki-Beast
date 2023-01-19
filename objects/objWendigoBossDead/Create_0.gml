instance_destroy(objBullet);

yorg = y;

// Create Cutscene
with instance_create_layer(objPlayer.x,objPlayer.y,"control",obj_cutscene_trigger) {
	t_scene_info = [
	[cutscene_change_camera_position,objWendigoBossDead.x,objWendigoBossDead.y-50],
	[cutscene_wait,1],
	[cutscene_move_character,objWendigoBossDead,0,130,true,0.25,sprWendigo,sprWendigo],
	[cutscene_wait,1],
	[cutscene_change_room,rmEnd,false],
	]
}



alarm[0] = 60;