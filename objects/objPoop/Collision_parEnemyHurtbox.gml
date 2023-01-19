/*if state = states.toss {
	if random(100) > 50 {
		instance_create_layer(x,y,"partical",objBlast);
		repeat(10) {
			instance_create_layer(x+random_range(-30,30),y+random_range(-30,30),"partical",objMiniBlast)
		}
	}
}