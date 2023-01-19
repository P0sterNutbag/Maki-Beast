hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);

var wall = instance_place(x+sign(hsp),y+sign(vsp),objWall)
if wall and wall.object_index = objWall {
	instance_destroy();
}

collision(hsp,vsp,objControl);
