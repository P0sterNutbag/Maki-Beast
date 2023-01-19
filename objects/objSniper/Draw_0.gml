if instance_exists(objPlayer) and !collision_line(x,y,objPlayer.x,objPlayer.y,objWall,false,false) {
	var arrowDis = point_distance(x,y-6,objPlayer.x,objPlayer.y-6)-16;
	var arrowDir = point_direction(x,y-6,objPlayer.x,objPlayer.y-6);
	for (var i=0; i < arrowDis; i++) {
		newx = x+lengthdir_x(i,arrowDir);
		newy = y+lengthdir_y(i,arrowDir)-6;
		if state = states.wait {
			draw_sprite_ext(sprArrowRed,0,newx,newy,1,1,arrowDir,c_white,1);
		} else if state = states.attack and image_index < shootFrame{
			if alarm[3] = -1  alarm[3] = 3;
			draw_sprite_ext(sprArrowRed,0,newx,newy,1,1,arrowDir,c_white,arrowAlpha);
		}
	}
	if state = states.wait {
		draw_sprite_ext(sprArrowTipRed,0,newx,newy,1,1,arrowDir,c_white,1);
	} else if state = states.attack and image_index < shootFrame {
		if alarm[3] = -1  alarm[3] = 3;
		draw_sprite_ext(sprArrowTipRed,0,newx,newy,1,1,arrowDir,c_white,arrowAlpha);
	}
}

// Inherit the parent event
event_inherited();


/*if state = states.wait and canSeePlayer {
	draw_line_width_color(x,y-6,objPlayer.x,objPlayer.y-6,0.1,c_red,c_red);
} else if state = states.attack and image_index < shootFrame and canSeePlayer {
	if alarm[3] = -1  alarm[3] = 3;
	draw_line_width_color(x,y-6,objPlayer.x,objPlayer.y-6,lineWidth,c_red,c_red);
}
