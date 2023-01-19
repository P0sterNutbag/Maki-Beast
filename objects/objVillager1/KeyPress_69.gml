if place_meeting(x,y,objPlayer) and !instance_exists(obj_cutscene){
	with objPlayer {
		hsp = 0; vsp = 0;
		state = states.cutscene;
	}
	create_cutscene(cutsceneInfo);
}
