if instance_exists(objPlayer) {
	x = objPlayer.x;
	y = objPlayer.y;
} else  instance_destroy();

var saw = instance_place(x,y,objSaw);
if (!saw) or (saw and saw.state = states.walk)   canSlice = true;