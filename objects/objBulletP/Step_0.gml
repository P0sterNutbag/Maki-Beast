event_inherited();


hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);

if place_meeting(x+sign(hsp),y+sign(vsp),objWall) or place_meeting(x,y,objWall) {
	instance_destroy();
}

collision(hsp,vsp,objWall);
