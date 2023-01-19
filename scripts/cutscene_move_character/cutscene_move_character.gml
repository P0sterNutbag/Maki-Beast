function cutscene_move_character(obj, xto, yto, relative, spd, walkSpr, idleSpr) {
	
	if x_dest == -1 {
		if (!relative) {
			x_dest = xto;
			y_dest = yto;
		} else {
			x_dest =obj.x + xto;
			y_dest =obj.y + yto;
		}
	}

	var xx = x_dest;
	var yy = y_dest;

	with obj {
		image_speed = 1;
		sprite_index = walkSpr;
		if point_distance(x,y,xx,yy) >= spd {
			var dir = point_direction(x,y,xx,yy);
			var ldirx = lengthdir_x(spd,dir);
			var ldiry = lengthdir_y(spd,dir);
		
			if (ldirx != 0) { image_xscale = sign(ldirx); }
		
			x += ldirx;
			y += ldiry;
		} else {
			image_speed = 1;
			sprite_index = idleSpr;
			x = xx;
			y = yy;
			with other {
				x_dest = -1;
				y_dest = -1;
				cutscene_end_action();
			}
		}
	}

}
