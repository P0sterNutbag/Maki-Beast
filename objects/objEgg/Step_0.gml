if state = states.walk {
	
} else if state = states.hold {
	with objPlayer state = states.hold;
	image_index = image_number-1;
	//if image_index >= image_number - 1 {
		x = dad.x;
		y = dad.y-yoffset;
		spd = throwSpd;
		image_xscale = objPlayer.image_xscale;
		//if !instance_exists(objFade)  instance_create_layer(0,0,"control",objFade);
		if alarm[0] = -1 and !instance_exists(objHawk)  alarm[0] = 30;
	//} else state = states.walk;
} else if state = states.toss {
	x = dad.x;
	y = dad.y-yoffset;
}