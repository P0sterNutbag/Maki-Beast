// Draw shadow
draw_sprite_ext(sprShadow, image_index, x,y, image_xscale, image_yscale, 0, c_white, 1);

// Draw arrow when holding projectile
if state = states.hold and (grabObj != noone and grabObj.object_index != objEgg) {
	// Calculate projectile trajectory
	var testSpd = grabObj.throwSpd;
	var testX = grabObj.x;
	var testY = grabObj.y;
	var testDir = point_direction(grabObj.x,grabObj.y,mouse_x,mouse_y);
	while testSpd > 0 {
		testX += lengthdir_x(testSpd*global.dt,testDir);
		testY += lengthdir_y(testSpd*global.dt,testDir);
		testSpd -= grabObj.fric;
		// Stop if meeting a wall
		if position_meeting(testX,testY,objWall)  break;
	}
	var arrowLength = point_distance(grabObj.x,grabObj.y,testX,testY)//+(grabObj.sprite_width/2);
	

	for (var i=0; i<arrowLength; i++) {
		// Set first position if in a wall
		if i=0 {
			var addY = 0;
			with grabObj {
				while place_meeting(x,y+addY-1,objWall) {
					addY++;
				}
			}
		} 
		var arrowDir = point_direction(grabObj.x,grabObj.y,mouse_x,mouse_y);
		var newx = grabObj.x+lengthdir_x(i,arrowDir);
		var newy = grabObj.y+lengthdir_y(i,arrowDir)+addY;
		var isMeetingEnemy = instance_place(newx,newy,parEnemy);
		if grabObj.object_index == objSaw or object_get_parent(grabObj.object_index) == objSaw {
			isMeetingEnemy = false;
		}
		var isMeetingWall = instance_place(newx,newy,objWall);
		if (isMeetingEnemy and isMeetingEnemy != grabObj) or isMeetingWall {
			#region //oldstuff
			//if isMeetingEnemy  var reflectObj = isMeetingEnemy;
			//else if isMeetingWall  reflectObj = isMeetingWall;
			//var reflect = true;
			//var arrowLen = i;
			//var maxj = arrowLength-i;
			#endregion
			var offset = 0;
			break;
		} else {
			offset = 1;
		}
		draw_sprite_ext(sprArrow,0,newx,newy,1,1,arrowDir,c_white,1);
	}
	draw_sprite_ext(sprArrowTip,0,newx+lengthdir_x(offset,arrowDir),newy+lengthdir_y(offset,arrowDir),1,1,arrowDir,c_white,1);
	#region
	//if (isMeetingEnemy and isMeetingEnemy != grabObj) or isMeetingWall  var offset = 0;
	//else  offset = 1;
	//	reflect = false;
	/*
	if reflect {
		var reflectX = grabObj.x+lengthdir_x(arrowLen,arrowDir);
		var reflectY = grabObj.y+lengthdir_y(arrowLen,arrowDir);
		if reflectObj.object_index == objWall {
			if place_meeting(newx+1,newy,reflectObj) {
				var changeDir = -(arrowDir*2)+180;
			} else if place_meeting(newx-1,newy,reflectObj) {
				var changeDir = ((180-arrowDir)*2)+180;
			} else if place_meeting(newx,newy+1,reflectObj) {
				var changeDir = ((270-arrowDir)*2)+180;
			} else if place_meeting(newx,newy-1,reflectObj) {
				var changeDir = ((90-arrowDir)*2)+180;
			} else changeDir = 180;
		} else {
			if place_meeting(newx,newy+1,reflectObj) {
				var changeDir = -(arrowDir*2)+180;
			} else if place_meeting(newx,newy-1,reflectObj) {
				var changeDir = ((180-arrowDir)*2)+180;
			} else if place_meeting(newx+1,newy,reflectObj) {
				var changeDir = ((270-arrowDir)*2)+180;
			} else if place_meeting(newx-1,newy,reflectObj) {
				var changeDir = ((90-arrowDir)*2)+180;
			} else changeDir = 180;
		} 
		arrowDir += changeDir;
		
		for (var j=0; j<maxj; j++) {
			newx = reflectX+lengthdir_x(j,arrowDir);
			newy = reflectY+lengthdir_y(j,arrowDir);
			if isMeetingEnemy or isMeetingWall {
				if isMeetingEnemy  reflectObj = isMeetingEnemy;
				else if isMeetingWall  reflectObj = isMeetingWall;
				var reflect = true;
				var arrowLen = i;
				var maxj = arrowLength-i;
				break;
			} else {
				reflect = false;
			}
			draw_sprite_ext(sprArrow,0,newx,newy,1,1,arrowDir,c_white,1);	
		}
	}
	
	if reflect {
		var reflectX = newx;
		var reflectY = newy;
		if place_meeting(newx+1,newy,objWall) {
			var changeDir = -(arrowDir*2)+180
		} else if place_meeting(newx-1,newy,objWall) {
			var changeDir = ((180-arrowDir)*2)+180
		} else if place_meeting(newx,newy+1,objWall) {
			var changeDir = ((270-arrowDir)*2)+180
		} else if place_meeting(newx,newy-1,objWall) {
			var changeDir = ((90-arrowDir)*2)+180
		} else changeDir = 180;
		arrowDir += changeDir;
		
		for (var j=0; j<maxj; j++) {
			newx = reflectX+lengthdir_x(j,arrowDir);
			newy = reflectY+lengthdir_y(j,arrowDir);
			if place_meeting(newx+lengthdir_x(1,arrowDir),newy+lengthdir_y(1,arrowDir),objWall) {
				var reflect = true;
				var arrowLen = i;
				var maxj = maxj-j;
				break;
			} else {
				reflect = false;
			}
			draw_sprite_ext(sprArrow,0,newx,newy,1,1,arrowDir,c_white,1);	
		}
	}
	
		if reflect {
		var reflectX = newx;
		var reflectY = newy;
		if place_meeting(newx+1,newy,objWall) {
			var changeDir = -(arrowDir*2)+180
		} else if place_meeting(newx-1,newy,objWall) {
			var changeDir = ((180-arrowDir)*2)+180
		} else if place_meeting(newx,newy+1,objWall) {
			var changeDir = ((270-arrowDir)*2)+180
		} else if place_meeting(newx,newy-1,objWall) {
			var changeDir = ((90-arrowDir)*2)+180
		} else changeDir = 180;
		arrowDir += changeDir;
		
		for (var j=0; j<maxj; j++) {
			newx = reflectX+lengthdir_x(j,arrowDir);
			newy = reflectY+lengthdir_y(j,arrowDir);
			if place_meeting(newx+lengthdir_x(1,arrowDir),newy+lengthdir_y(1,arrowDir),objWall) {
				var reflect = true;
				var arrowLen = i;
				var maxj = maxj-j;
				break;
			} else {
				reflect = false;
			}
			draw_sprite_ext(sprArrow,0,newx,newy,1,1,arrowDir,c_white,1);	
		}
	}
	
		if reflect {
		var reflectX = newx;
		var reflectY = newy;
		if place_meeting(newx+1,newy,objWall) {
			var changeDir = -(arrowDir*2)+180
		} else if place_meeting(newx-1,newy,objWall) {
			var changeDir = ((180-arrowDir)*2)+180
		} else if place_meeting(newx,newy+1,objWall) {
			var changeDir = ((270-arrowDir)*2)+180
		} else if place_meeting(newx,newy-1,objWall) {
			var changeDir = ((90-arrowDir)*2)+180
		} else changeDir = 180;
		arrowDir += changeDir;
		
		for (var j=0; j<maxj; j++) {
			newx = reflectX+lengthdir_x(j,arrowDir);
			newy = reflectY+lengthdir_y(j,arrowDir);
			if place_meeting(newx+lengthdir_x(1,arrowDir),newy+lengthdir_y(1,arrowDir),objWall) {
				var reflect = true;
				var arrowLen = i;
				var maxj = maxj-j;
				break;
			} else {
				reflect = false;
			}
			draw_sprite_ext(sprArrow,0,newx,newy,1,1,arrowDir,c_white,1);	
		}
	}
		if reflect {
		var reflectX = newx;
		var reflectY = newy;
		if place_meeting(newx+1,newy,objWall) {
			var changeDir = -(arrowDir*2)+180
		} else if place_meeting(newx-1,newy,objWall) {
			var changeDir = ((180-arrowDir)*2)+180
		} else if place_meeting(newx,newy+1,objWall) {
			var changeDir = ((270-arrowDir)*2)+180
		} else if place_meeting(newx,newy-1,objWall) {
			var changeDir = ((90-arrowDir)*2)+180
		} else changeDir = 180;
		arrowDir += changeDir;
		
		for (var j=0; j<maxj; j++) {
			newx = reflectX+lengthdir_x(j,arrowDir);
			newy = reflectY+lengthdir_y(j,arrowDir);
			if place_meeting(newx+lengthdir_x(1,arrowDir),newy+lengthdir_y(1,arrowDir),objWall) {
				var reflect = true;
				var arrowLen = i;
				var maxj = maxj-j;
				break;
			} else {
				reflect = false;
			}
			draw_sprite_ext(sprArrow,0,newx,newy,1,1,arrowDir,c_white,1);	
		}
	}
	
	mask_index = sprite_index; */
	#endregion
}

if flash {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
} else {
	draw_self();
}



//var dir = point_direction(x,y,mouse_x,mouse_y);
//draw_line(x,y,x+lengthdir_x(grabRange,dir),y+lengthdir_y(grabRange,dir));

/*if state = states.hold {
	draw_sprite(grabSpr,0,x,y-sprite_height/2);
}
