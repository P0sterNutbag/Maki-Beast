image_alpha += alpha_change;

if image_alpha >= 1 and alarm[1] = -1 {
	drawText = true;
	alpha_change = 0;
	image_alpha = 1;
	alarm[1] = room_change_time;
}
if image_alpha <= 0 {
	instance_destroy();
}
