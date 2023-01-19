///@description cutscene_change_camera_target
///@arg  target
function cutscene_stop_camera() {
	with objCamera {
		follow = noone;
		xtarg = x;
		ytarg = y;
	}
	cutscene_end_action();

}
