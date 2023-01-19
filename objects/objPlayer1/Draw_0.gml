//draw_sprite_ext(sprPlayerShadow, 0, x-6, y+12, 1, -.75, 0, c_white, .5);
if flash {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}

//var dir = point_direction(x,y,mouse_x,mouse_y);
//draw_line(x,y,x+lengthdir_x(grabRange,dir),y+lengthdir_y(grabRange,dir));

/*if state = states.hold {
	draw_sprite(grabSpr,0,x,y-sprite_height/2);
}
