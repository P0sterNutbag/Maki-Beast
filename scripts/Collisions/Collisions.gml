///collision1(x_spd, y_spd, obj)
/// @arg x_speed
/// @arg y_speed
/// @arg collision_obj
function collision(argument0, argument1, argument2) {
	var xmove = argument0*global.dt;
	var ymove = argument1*global.dt;
	var sol = argument2;

	//I think this is better calculation for single mask
	var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
	var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
	//Horizontal collisions
	x = lerp(x, x + xmove, 1);
	if place_meeting(x+sign(xmove),y,sol) {
	    var wall = instance_place(x+sign(xmove),y,sol);
	    if xmove > 0 { //right
	        x = (wall.bbox_left-1)-sprite_bbox_right;
	    } else if xmove < 0 { //left
	        x = (wall.bbox_right+1)-sprite_bbox_left;
	    }
	    xmove = 0;
	}

	//Vertical collisions
	y += ymove;
	if place_meeting(x, y+sign(ymove), sol) {
		//if !place_meeting(x,y,sol) {
		    var wall = instance_place(x, y+sign(ymove), sol);
		    if (ymove > 0) { //down
		        y = (wall.bbox_top-1) - sprite_bbox_bottom;
		    } else if (ymove < 0) { //up
		        y = (wall.bbox_bottom+1) - sprite_bbox_top;
		    }
		//}
		ymove = 0;
	}
}
function justMove(xmove,ymove) {
	xmove = xmove*global.dt;
	ymove = ymove*global.dt;
	x += xmove;
	y += ymove;
}
function simpleCollision(argument0, argument1, argument2) {
	var xmove = argument0*global.dt;
	var ymove = argument1*global.dt;
	var sol = argument2;
	
	if place_meeting(x+xmove, y, sol) {
		while(!place_meeting(x+sign(xmove), y, sol)) {
			x += sign(xmove);
		}
		xmove = 0;
	}
	x += xmove
	
	if place_meeting(x, y+ymove, sol) {
		while(!place_meeting(x, y+sign(ymove), sol)) {
			y += sign(ymove);
		}
		ymove = 0;
	}
	y += ymove
}

