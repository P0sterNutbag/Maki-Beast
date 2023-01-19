draw_set_alpha(1)

for (var i=0; i<20; i++) {
	for (var j=0; j<20; j++) {
		draw_sprite_ext(sprPauseTile,0,0+j*16,0+i*16,1,1,0,c_gray,1);
	}
} 

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(fntMenu);
draw_set_color(c_white);
var m;
for (m = 0; m < array_length_2d(menus,menu_number); m += 1) {
	draw_text(20,20+(m*space)+y_offset,string(menus[menu_number,m]));
}
draw_sprite(sprMenuIcon, 0, 20-14,20+mpos*space+y_offset-3);



/* Draw Controls
if menu_number = 2  and mpos = 2 {
	draw_sprite(spr_controls,0,160,100);
}
