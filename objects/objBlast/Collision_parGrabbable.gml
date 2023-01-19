/*if image_index = 0 {
	with other {
		dir = point_direction(other.x,other.y,x,y);
		//explosionDis = point_distance(other.x,other.y,x,y);
		var parent = object_get_parent(object_index);
		if parent == parEnemy {
			exit;
		} else {
			spd = throwSpd;
		}
		bounce = 0;
		dad = objPlayer.id;
		state = states.toss;
	}
}