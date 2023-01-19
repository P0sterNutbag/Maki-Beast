if random(100) > 70 {
	instance_create_layer(x,y,"partical",objBlast);
	repeat(5) {
		instance_create_layer(x+random_range(-30,30),y+random_range(-30,30),"partical",objMiniBlast);
	}
}