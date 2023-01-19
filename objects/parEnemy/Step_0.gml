event_inherited();

if hp <= 0  instance_destroy();

if instance_exists(objPlayer) {
	dis = point_distance(x,y,objPlayer.x,objPlayer.y);
	canSeePlayer = !collision_line(x,y-5,objPlayer.x,objPlayer.y-5,objWall,false,false);
} else {
	canSeePlayer = false;
}


// Destroy if outside room
if x > room_width or x < 0  instance_destroy();
if y > room_height or y < 0  instance_destroy();
