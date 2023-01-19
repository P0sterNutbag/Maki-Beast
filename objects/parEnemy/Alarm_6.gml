// Shoot player once in sight
if state != states.hold {
	image_index = 0;
	state = states.attack;
}