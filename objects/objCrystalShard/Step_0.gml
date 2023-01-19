hsp = lengthdir_x(spd,dir);
vsp = lengthdir_y(spd,dir);
collision(hsp,vsp,objWall);


if spd <= 0 {
	spd = 0;
} else {
	spd -= fric;
	rot += spd*0.17;
}

//bounceOnWalls();