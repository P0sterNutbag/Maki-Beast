draw_set_alpha(1)

// Background
if gameComplete  index = 1;
else index = 0;
draw_sprite(sprMenu3,index,0,0);

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fntMenu);
draw_set_color(c_white);
var m;
for (m = 0; m < array_length(menus[menuNumber]); m += 1) {
	draw_text(width/2,height/2+(m*space)+y_offset,string(menus[menuNumber,m]));
}
draw_sprite(sprMenuIcon, 0, width/2-string_width(menus[menuNumber,mpos])/2-16,height/2+mpos*space+y_offset);



/* Draw Controls
if menu_number = 2  and mpos = 2 {
	draw_sprite(spr_controls,0,160,100);
}
