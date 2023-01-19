if visible == true {
	draw_sprite_ext(shadowSprite, image_index, x,y, image_xscale, image_yscale, 0, c_black, 0.5);
}

if flash {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}