if !instance_exists(dad) or dad.state != states.stun {
	instance_destroy();
} else {
	depth = dad.depth-1;
}

