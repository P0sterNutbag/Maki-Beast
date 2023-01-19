depth = -999;

if x < objPlayer.x {
	speed = 5;
	direction = point_direction(x,y,objPlayer.x,objPlayer.y-15);
} else {
	speed = 5;
	direction = point_direction(x,y,objCamera.x+300,objCamera.y-175);
	var ID = id;
	if !instance_exists(objCamTarget) {
		instance_create_layer(objPlayer.x,objPlayer.y,"control",objCamTarget);
	}
	with objCamera {
		if follow != objCamTarget {
			follow = objCamTarget;
			x = mean(objPlayer.x,objPlayer.x,objPlayer.x,objPlayer.x,objPlayer.x, mouse_x);
			y = mean(objPlayer.y,objPlayer.y,objPlayer.y,objPlayer.y,objPlayer.y, mouse_y);
		}
	}
	with objPlayer {
		x = ID.x;
		y = ID.y+15;
		hsp = 0;
		vsp = 0;
		state = states.cutscene;
	}
	instance_destroy(objEgg)
	if point_distance(x,y,playerXorg,playerYorg) > 100 {
		if !instance_exists(objFade) {
			var levelSize,list,rd;
			if global.level < 4 {
				list = global.area1Levels;
				if global.level = 3 {
					rd = rmArena1_Shop;
				} else {
					levelSize = ds_list_size(list)-1;
					rd = ds_list_find_value(list,irandom(levelSize));
				}
			} else if global.level < 8 {
				list = global.area2Levels;
				if global.level = 7 {
					rd = rmArena2_Shop;
				} else {
					levelSize = ds_list_size(list)-1;
					rd = ds_list_find_value(list,irandom(levelSize));
				}
			} else if global.level < 12 {
				list = global.area3Levels;
				if global.level = 11 {
					rd = rmArena3_Shop;
				} else {
					levelSize = ds_list_size(list)-1;
					rd = ds_list_find_value(list,irandom(levelSize));
				}
			}
			scrTransition(rd,false);
		}
	}
}
