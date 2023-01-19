///@description create_cutscene
function create_cutscene(argument0) {
	//@arg scene_info

	var inst = instance_create_layer(0,0,"control",obj_cutscene);

	with(inst) {
		scene_info = argument0;
		event_perform(ev_other,ev_user0);
	}


}
