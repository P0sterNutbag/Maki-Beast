t_scene_info = [
	[cutscene_change_camera_target,objPlayer],
	[cutscene_move_character,objPlayer,0,-50,true,1,sprPlayerWalk,sprPlayerWalk],
	[cutscene_move_character,objPlayer,objShopkeep.x-objPlayer.x,0,true,1,sprPlayerWalk,sprPlayerIdle],
	[cutscene_wait,0.5],
	[cutscene_change_camera_target,objShopkeep],
	[cutscene_talk,[scrShopkeeperScript(),sprVillager1Bust]],
	[cutscene_change_camera_target,objPlayer],
	[cutscene_wait,0.5]
]
