// Draw Shadow
var width = sprite_get_bbox_right(sprite_index)-sprite_get_bbox_left(sprite_index);
var xoffset = sprite_get_xoffset(sprite_index);
var bboxOffset = sprite_get_bbox_left(sprite_index);
draw_sprite(sprNewShadowEnd,0,x-(xoffset-bboxOffset),y+1);
for (var i=1; i<=width-1; i++) {
	draw_sprite(sprNewShadow,0,x-(xoffset-bboxOffset)+i,y+1);
}
draw_sprite(sprNewShadowEnd,0,x+(xoffset-bboxOffset),y+1);

// Flash and shine animation
if flash {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	image_speed = 1;
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}

