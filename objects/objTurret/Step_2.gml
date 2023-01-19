event_inherited();

if hp != hpLast {//and state != states.attack {
	// Go into strafe
	randomize();
	if instance_exists(objPlayer) {
		var dirToPlayer = point_direction(objPlayer.x,objPlayer.y,x,y);
	} else dirToPlayer = 0;
	dir = dirToPlayer + random_range(strafeDirMin,strafeDirMax);
	strafeDis = random_range(strafeRangeMin,strafeRangeMax);
	if !position_meeting(x+lengthdir_x(strafeDis,dir),y+lengthdir_y(strafeDis,dir),objWall) {
		xorg = x;
		yorg = y;
		state = states.strafe;
	}
}

hpLast = hp;