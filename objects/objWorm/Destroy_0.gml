event_inherited();

// Duplicate when hit
if babyNumber > 0 {
	for (var i=0; i<babyNumber; i++) {
		instance_create_layer(x-(16/babyNumber)*i,y,"enemy",babyObject);
	}
}