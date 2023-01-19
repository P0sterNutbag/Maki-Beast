draw_self();

if collision_rectangle(x-1,y,x+2,y+18,objPlayer,false,false) {
	draw_set_font(fntSmall);
	//draw_set_halign(fa_center);
	//draw_text_color(x,y-22,string(price),c_white,c_white,c_white,c_white,1);
	draw_set_halign(fa_left);
	var col = make_color_rgb(34,32,52);
	var xx = objShopkeep.x+20;
	var yy = objShopkeep.y-10;
	draw_sprite(sprSpeachbubbleEdge1,0,xx,yy);
	var text = string(name)+": "+string(price);
	var len = string_width(text);
	for (var i=0; i<len; i++) {
		draw_sprite(sprSpeachbubbleInsidee,0,xx+i,yy);
	}
	draw_sprite(sprSpeachbubbleEdge2,0,xx+i,yy);
	draw_set_valign(fa_center);
	draw_text_color(xx,yy-sprite_get_height(sprSpeachbubbleInsidee)/2,string(text),col,col,col,col,1);
}
