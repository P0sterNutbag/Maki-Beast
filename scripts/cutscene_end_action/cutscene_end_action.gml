///@description cutscene_end_action
///@arg return player
function cutscene_end_action() {

	scene++;
	if(scene > array_length_1d(scene_info)-1) {
		instance_exists(objPlayer)  with objPlayer state = states.walk;
		instance_destroy();
		exit;
	}

	event_perform(ev_other, ev_user0);

}
