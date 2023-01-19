draw_set_alpha(1)

if room != menu {
	//draw_sprite_ext(spr_fade,0,0,0,width,height,0,c_white,1);
	for (var i=0; i<20; i++) {
		for (var j=0; j<20; j++) {
			draw_sprite_ext(sprPauseTile,0,0+j*16,0+i*16,1,1,0,c_gray,1);
		}
	}
} 

if title = textmax {
	if room != menu {
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fntDialouge);
		draw_set_color(c_white);
		var m;
		for (m = 0; m < array_length_2d(menus,menu_number); m += 1) {
			draw_text(x,y+(m*space)+y_offset,string(menus[menu_number,m]));
		}
		draw_sprite(sprMenuIcon, 0, x-14,y+mpos*space+y_offset-3);
	}
	else {
		draw_sprite(sprMenu3,image_index,0,0);
	}
} else {
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fnt2);
	//draw_sprite(picture[title],0,0,0);
	draw_set_alpha(a);
	draw_text_typewriter(text[title],25,height/2-10,width-50,t);
	//draw_sprite_ext(spr_logo,0,160,90,1,1,0,c_white,image_alpha);
}

/* Draw Controls
if menu_number = 2  and mpos = 2 {
	draw_sprite(spr_controls,0,160,100);
}
