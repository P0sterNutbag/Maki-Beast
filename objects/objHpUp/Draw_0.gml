draw_set_alpha(1);
draw_self();

if state = states.hold {
	var barHp = (hp / maxHp) * 100;
	// Healthbar
	var col = make_color_rgb(60,184,120);
	draw_healthbar(x-8,y-20,x+8,y-23,barHp,c_black,col,col,0,false,false);
}