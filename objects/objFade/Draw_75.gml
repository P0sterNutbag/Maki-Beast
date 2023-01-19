height = display_get_gui_height();
width = display_get_gui_width();

draw_sprite_ext(sprite_index,0,0,0,width,height,0,c_white,image_alpha);
/*
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt1);
draw_set_alpha(image_alpha);
if global.level < 4  var zone = 1;
else if global.level > 3 and global.level < 7  zone = 2;
else zone = 3;
if global.level = 1 or global.level = 4 or global.level = 7  var lvl = 1;
else if global.level = 2 or global.level = 5 or global.level = 8  lvl = 2;
else if global.level = 3 or global.level = 6 or global.level = 9  lvl = 3;
else lvl = 4
if (roomDestination = room1 and alpha_change <= 0) { 
	if drawText {
		draw_text(width/2,height/2,string(zone)+", "+string(lvl));
	}
} else if (roomDestination = rmBoss and alpha_change <= 0) { 
	if drawText {
		draw_text(width/2,height/2,"FINAL");
	}
}
