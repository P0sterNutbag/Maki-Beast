if instance_exists(enemyPar) {
	x = enemyPar.x;
	y = enemyPar.y;
} else  instance_destroy();

var saw = instance_place(x,y,objSaw);
if (!saw) or (saw and saw.state = states.walk)   canSlice = true;
