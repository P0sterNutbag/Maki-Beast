// Player HUD
if !instance_exists(obj_cutscene) and instance_exists(objPlayer) {
	// Draw health
	draw_set_alpha(1);
	draw_sprite(sprHealthbar,(objPlayer.maxHp/5)-(objPlayer.hp/5),15,8);

	// Draw earned projectiles
	var size = ds_list_size(global.projectileTier2);
	if size > 0 {
		var yy = 20;
		for(var i=0; i<size; i++) {
			var drawSpr = object_get_sprite(ds_list_find_value(global.projectileTier2,i));
			var oldXoffset = sprite_get_xoffset(drawSpr);
			var oldYoffset = sprite_get_yoffset(drawSpr);
			sprite_set_offset(drawSpr,0,sprite_get_height(drawSpr));
			yy += sprite_get_height(drawSpr)+1;
			//yy += sprite_get_height(drawSpr)+((sprite_get_height(drawSpr)-sprite_get_yoffset(drawSpr))))+1 //(sprite_get_bbox_bottom(drawSpr)-sprite_get_bbox_top(drawSpr))-((sprite_get_bbox_bottom(drawSpr)-sprite_get_yoffset(drawSpr)))//-sprite_get_bbox_top(drawSpr));
			draw_sprite_ext(drawSpr,0,7,yy,1,1,0,c_grey,0.75); 
			sprite_set_offset(drawSpr,oldXoffset,oldYoffset);
		}
		/*draw_sprite_ext(sprBagTop,0,4,18,1,1,0,c_white,0.5);
		for (var j=0; j<yy; j++) {
			draw_sprite_ext(sprBagMiddle,0,4,17+j,1,1,0,c_white,0.5);
		}
		draw_sprite_ext(sprBagBottom,0,4,18+yy,1,1,0,c_white,0.5);*/
	}
}

// Draw Player Money
if instance_exists(objPlayer) {
	draw_sprite_ext(sprEmeraldCount,0,width-30,height-20,1,1,0,c_white,moneyAlpha);
	draw_set_font(fntDialouge);
	var col = make_color_rgb(34,32,52);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_color(width-22,height-21,objPlayer.gold,col,col,col,col,moneyAlpha);
	if !drawGold and moneyAlpha > 0 {
		moneyAlpha -= 0.05;
	}
	if instance_exists(obj_cutscene) {
		drawGold = false;
	} else if (room = rmArena1_Shop or room = rmArena2_Shop or room = rmArena3_Shop) {
		drawGold = true;
		moneyAlpha = 1;
	}
}



/*if alarm[0] > 0 {
	var rad = 8;
	var time = (alarm[0] / comboTime) * 100;
	scrCircularBar(width-20, height-20, time, 100, c_white, rad, 1, 2);
}*/


/* Score
if alarm[1] > 0 {
	var xx = 20;
	var yy = 25;
	var rad = 15;
	var time = (alarm[1] / comboTime) * 100;
	scrCircularBar(width-30, 30, time, 100, c_white, rad, 1, 2);
	draw_set_font(fntHud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_text(width-29,31,string(global.killCount));
} else {
	global.killCount = 0;
}