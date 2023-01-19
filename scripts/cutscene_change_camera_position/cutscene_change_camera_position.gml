///@description cutscene_change_camera_target
///@arg  target
function cutscene_change_camera_position(xx,yy) {
	with objCamera {
		follow = noone;
		xtarg = xx;
		ytarg = yy;
	}
	cutscene_end_action();

}
