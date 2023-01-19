function cutscene_change_state(object, new_state) {
	with object {
		state = new_state
	}
	cutscene_end_action();
}
