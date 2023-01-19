if state = states.toss {
	repeat(5) {
		var ID = id;
		with instance_create_layer(x,y,"projectile",objPebble) {
			dir = random(360);
			spd = throwSpd/2;
			dad = ID.dad;
			state = states.toss;
		}
	}
}