//draw_sprite_ext(shadowSprite, image_index, x,y, image_xscale, image_yscale, 0, c_white, 1);
// Draw Shadow
var width = sprite_get_bbox_right(idleSprite)-sprite_get_bbox_left(idleSprite);
var xoffset = sprite_get_xoffset(idleSprite);
var bboxOffset = sprite_get_bbox_left(idleSprite);
draw_sprite(sprNewShadowEnd,0,x-(xoffset-bboxOffset),y+1);
for (var i=1; i<=width; i++) {
	draw_sprite(sprNewShadow,0,x-(xoffset-bboxOffset)+i,y+1);
}
draw_sprite(sprNewShadowEnd,0,x+(xoffset-bboxOffset),y+1);

// Flash when hit
if flash {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}

/* Draw Health Bar
if hp < maxHp {
	var hp2 = (hp / maxHp) * 100;
	// white bar
	if changeHp  hpw -= 1;
	hpw = max(hp2,hpw);
	if hpw = hp2  changeHp = false;

	var col = make_color_rgb(178,53,94);
	draw_healthbar(x-8,y-20,x+8,y-23,hpw,c_black,c_white,c_white,0,true,false);
	draw_healthbar(x-8,y-20,x+8,y-23,hp2,c_black,col,col,0,false,false);
}