for (var i=0; i<15; i++) {
	var ID = id;
	with instance_create_layer(x,y,"projectile",objMiniBomb) {
		dir = (360/15)*i;
		spd = throwSpd*random_range(0.5,1);
		dad = ID.dad;
		state = states.toss;
	}
}

instance_create_layer(x,y,"bullet",objMiniBlast);