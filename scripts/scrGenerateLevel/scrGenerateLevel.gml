function scrGenerateLevel() {
	randomize();
	scrLevelData();

	// Create the surface for the shadows
	shadow_surface_ = noone;

	// Get the tile layer map id
	var _wall_map_id = layer_tilemap_create("wallTiles",0,0,wallTile,room_width,room_height);

	// Set up the grid
	width_ = room_width div CELL_WIDTH;
	height_ = room_height div CELL_HEIGHT;
	grid_ = ds_grid_create(width_, height_);
	ds_grid_set_region(grid_, 0, 0, width_ - 1, height_ - 1, VOID);

	// Create the controller
	var _controller_x = width_ div 2;
	var _controller_y = height_ div 2;
	var _controller_direction = irandom(3);

	// Create Player
	var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
	var _player_start_y = _controller_y * CELL_HEIGHT+12;
	if !instance_exists(objPlayer) {
		instance_create_layer(_player_start_x, _player_start_y, "player", objPlayer);
	} else {
		with objPlayer {
			if global.level = 1  hp = maxHp;
			visible = true;
			state = states.walk;
			x = _player_start_x;
			y = _player_start_y;
		}
	}

	//mroom[1,0] = 6;//room width
	//mroom[1,1] = 6;//room height

	var currentSteps = 0;
	// Generate the level
	while currentSteps < _steps {
		if grid_[# _controller_x, _controller_y] != FLOOR {
			currentSteps++;
			grid_[# _controller_x, _controller_y] = FLOOR;
		}
	
		// Rnadomize the direction
		var odds = _direction_change_odds*100;
		if (irandom(100) < odds) {
			_controller_direction = irandom(3);	
		}
	
		// Move the controller
		var _x_direction = lengthdir_x(1, _controller_direction * 90);
		var _y_direction = lengthdir_y(1, _controller_direction * 90);
		_controller_x += _x_direction;
		_controller_y += _y_direction;
	
		// Make sure we don't move outside the room
		if (_controller_x < 16 || _controller_x >= width_ - 16) {
			_controller_x += -_x_direction * 2;
		}
		if (_controller_y < 16 || _controller_y >= height_ - 16) {
			_controller_y += -_y_direction * 2;
		}
	
		// Create Mini-Rooms
		odds = mroomChance*100;
		
		if irandom(100) < odds {
			//var rt = irandom(array_height_2d(mroom)-1);
			for (var yy=0; yy < mroom[0,1]; yy++) {
				for (var xx=0; xx < mroom[0,0]; xx++) {
					if grid_[# _controller_x+xx, _controller_y+yy] != FLOOR {
						currentSteps++;
						grid_[# _controller_x+xx, _controller_y+yy] = FLOOR;
					}
				}
			}
		}
	}

	// Create the walls tiles
	for (var _y = 1; _y < height_-1; _y++) {
		for (var _x = 1; _x < width_-1; _x++) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
			if (grid_[# _x, _y] != FLOOR) {
				var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
				// add walls
				tilemap_set(_wall_map_id, _tile_index, _x, _y);
			} else {
				tilemap_set(_wall_map_id, 17, _x, _y);
			}
		}
	}

	// Add objects
	hpmax = 1;
	hpcount = 0;

	for (var yy = 1; yy < height_-1; yy++) {
		for (var xx = 1; xx < width_-1; xx++) {
			// walls
			if grid_[# xx, yy] != FLOOR and (grid_[# xx+1, yy] = FLOOR or grid_[# xx-1, yy] = FLOOR or grid_[# xx, yy+1] = FLOOR or grid_[# xx, yy-1] = FLOOR) {
				instance_create_layer(xx*CELL_WIDTH,yy*CELL_HEIGHT,"terrain",objWall);
			}
			// healthkits
			if (grid_[# xx, yy] == FLOOR) {
				var chance = 0;
				if grid_[# xx, yy-1] != FLOOR  chance += 1;
				if grid_[# xx, yy+1] != FLOOR  chance += 1;
				if grid_[# xx-1, yy] != FLOOR  chance += 1;
				if grid_[# xx+1, yy] != FLOOR  chance += 1;
				if chance = 0  var odds = 1000;
				else if chance = 1  var odds = 60;
				else if chance = 2  var odds = 20;
				else if chance = 3  var odds = 1;
				var xx2 = xx*CELL_WIDTH+CELL_WIDTH/2;
				var yy2 = yy*CELL_HEIGHT+12
				if irandom(odds) = odds and hpcount < hpmax and point_distance(xx2,yy2,objPlayer.x,objPlayer.y) > 15 {
					instance_create_layer(xx2,yy2,"player",objHpUp);
					hpcount += 1;
				}
			}
		}
	}


	// Place things

	// spawn enemies
	enemyCount = 0;
	abort = 0;
	b = false;
	while enemyCount < enemyMax {
		xx = irandom(width_);
		yy = irandom(height_);
		var ex = xx* CELL_WIDTH + CELL_WIDTH/2;
		var ey = yy* CELL_HEIGHT+12;
		if (grid_[# xx, yy] == FLOOR) and (b or collision_line(ex,ey,objPlayer.x,objPlayer.y,objWall,false,true)) {
			if instance_exists(parEnemy) {
				var en = instance_nearest(ex,ey,parEnemy);
				var distanceToNearestEnemy = point_distance(ex,ey,en.x,en.y);
			} else distanceToNearestEnemy = 1;
			if (distanceToNearestEnemy > 0) {
				var et = irandom(array_length_1d(enemy)-1)
				with instance_create_layer(ex,ey,"enemy",enemy[et]) {
					var w = weight;
				}
				enemyCount += w;
			}
		} else abort++;
		if abort > 1000  b = true;
		/*if enemyCount > enemyMin {
			odds = 0;
			if irandom(odds) = odds  break;
		}*/
	} 

	/* First Rock Spawn Code (less rocks, set by player)
	if global.level = 1 {
		ex = _player_start_x+(CELL_WIDTH*choose(1,-1));
		ey = _player_start_y+(CELL_HEIGHT*choose(1,-1));
		while place_meeting(ex,ey,objWall) {
			ex = _player_start_x+(CELL_WIDTH*choose(1,-1));
			ey = _player_start_y+(CELL_HEIGHT*choose(1,-1));
		}
		if (grid_[# xx, yy] == FLOOR) {
			var et = irandom(array_length_1d(projectile)-1);
			if et = objSaw ey = yy*(CELL_HEIGHT)+(8);
			with instance_create_layer(ex,ey,"projectile",projectile[et]) {
				var change = weight;
			}
		}	
	}*/
	// spawn more rocks
	projectileCount = 0;
	while projectileCount < projectileMax {
		xx = irandom(width_);
		yy = irandom(height_);
		var ex = xx*(CELL_WIDTH)+(CELL_WIDTH/2);
		var ey = yy*(CELL_HEIGHT)+(12);
		if instance_exists(parGrabbable)  var pn = instance_nearest(ex,ey,parGrabbable);  else pn = 0;
		if (point_distance(ex,ey,pn.x,pn.y) > 15) {
			if (grid_[# xx, yy] == FLOOR) {
				var et = irandom(array_length_1d(projectile)-1);
				if et = objSaw ey = yy*(CELL_HEIGHT)+(8);
				with instance_create_layer(ex,ey,"projectile",projectile[et]) {
					var change = weight;
				}
				projectileCount += change;
			}	
		}
	}



}
