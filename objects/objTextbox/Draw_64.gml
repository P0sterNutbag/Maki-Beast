draw_set_color(c_black);
//draw_rectangle(10,85,246,134,false);
draw_sprite(sprTextbox,0,10,85);

draw_set_alpha(1);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fntDialouge);

draw_text(55,95,textOutput);
draw_sprite(string(text[textPhase+1]),0,34,113);

if drawIcon {
	draw_sprite(sprTextboxIcon,0,225,128);
}
/*draw_text_typewriter(textbox, 45, 100, width, floor(t));

if t >= text_length {
	icon_flash += 1;
	if icon_flash >= flash_speed {
		icon_flash = 0;
		a = -a;
	} 
	draw_sprite_ext(sprHand,0,300,167,1,1,0,c_white,a);
}

/*draw_text_ext(45,143,message_draw,10,260);

draw_sprite(picture,0,9,142);
