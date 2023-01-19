// Inherit the parent event
event_inherited();

if state == states.toss {
	if place_meeting(x+hsp*global.dt,y+vsp*global.dt,parEnemyHurtbox) {
		instance_destroy();
	}
}
