dmg = 5;

daddy = instance_nearest(x,y,objEnemyHurtbox);

while place_meeting(x,y,objWall) {
	y++;
}
