// Smooth camera motion
//x += (xto - x)/5;
//y += (yto - y)/5;
//x = xto;
//y = yto;

// Set camera target
if (follow != noone) and instance_exists(follow) {
	if follow = objPlayer { // set offset for player
		if instance_exists(objWendigoBoss) {
			x = mean(objPlayer.x,objPlayer.x,objPlayer.x,objWendigoBoss.x,objWendigoBoss.x, mouse_x);
			y = mean(objPlayer.y,objPlayer.y,objPlayer.y,objWendigoBoss.y,objWendigoBoss.y, mouse_y);
		} else if !instance_exists(obj_cutscene) {
			x = mean(objPlayer.x,objPlayer.x,objPlayer.x,objPlayer.x,objPlayer.x, mouse_x);
			y = mean(objPlayer.y,objPlayer.y,objPlayer.y,objPlayer.y,objPlayer.y, mouse_y);
		} else {
			x = lerp(x,follow.x,0.1);
			y = lerp(y,follow.y,0.1);
		}
	} else if follow != objCamTarget {
		x = lerp(x,follow.x,0.1);
		y = lerp(y,follow.y,0.1);
	}
} else {
	x = lerp(x,xtarg,0.1);
	y = lerp(y,ytarg,0.1);
}

// Actually move the camera
x = clamp(x, global.cam_width/2, room_width-(global.cam_width/2));
y = clamp(y, global.cam_height/2, room_height-(global.cam_height/2));
var vm = matrix_build_lookat(x+screenshake_x, y+screenshake_y, -1000, x+screenshake_x, y+screenshake_y, 0, 0, 1, 0);
//var vm = matrix_build_lookat(clamp(x,0,room_width-160)+screenshake_x,y+screenshake_y,-10,clamp(x,0,room_width-160)+screenshake_x,y+screenshake_y,0,0,1,0);
camera_set_view_mat(camera,vm)

if screenshake > 0 {
	screenshake_x = random_range(-screenshake,screenshake);
	screenshake_y = random_range(-screenshake,screenshake);
	screenshake = 0;
} else {
	screenshake_x = 0;
	screenshake_y = 0;
}