t_scene_info = [
	[cutscene_stop_audio],
	[cutscene_play_sound,sndBossTheme3,1,true],
	[cutscene_wait,1],
	[cutscene_change_camera_position,objWendigoBoss.x,objWendigoBoss.y-50],
	[cutscene_wait,3],
	[cutscene_change_camera_target,inst_301A2E19],
	[cutscene_wait,0.75],
	[cutscene_change_camera_target,inst_785FFDBD],
	[cutscene_wait,0.75],
	[cutscene_change_camera_target,inst_3D73977],
	[cutscene_wait,0.75],
	[cutscene_change_state,objWendigoBoss,states.wait],
	[cutscene_change_camera_target,objPlayer],
]