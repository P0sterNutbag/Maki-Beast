// Skin the level

// Get the tile layer map id
if global.area == 1 {
	var _wall_map_id = layer_tilemap_create("wallTile",0,0,tileWall2Caps,room_width,room_height);
	var _ground_map_id = layer_tilemap_create("groundTile",0,0,tileWall2,room_width,room_height);
} else if global.area == 2 {
	_wall_map_id = layer_tilemap_create("wallTile",0,0,tileWallCaps,room_width,room_height);
	_ground_map_id = layer_tilemap_create("groundTile",0,0,tileWall,room_width,room_height);
}  else if global.area == 3 {
	_wall_map_id = layer_tilemap_create("wallTile",0,0,tileWall3Caps,room_width,room_height);
	_ground_map_id = layer_tilemap_create("groundTile",0,0,tileWall3,room_width,room_height);
}

// Set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
ds_grid_set_region(grid_, 0, 0, width_ - 1, height_ - 1, VOID);
	
// Set Walls and Floor
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		var xx = _x*CELL_WIDTH+CELL_WIDTH/2;
		var yy = _y*CELL_HEIGHT+CELL_HEIGHT/2;
		if position_meeting(xx,yy,objWall) and !position_meeting(xx,yy,objBarrier) {
			grid_[# _x, _y] = WALL;
		} else {
			grid_[# _x, _y] = FLOOR;
		}
	}
}

// Create the walls tiles
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		var _north_tile = grid_[# _x, _y-1] == WALL;
		var _west_tile = grid_[# _x-1, _y] == WALL;
		var _east_tile = grid_[# _x+1, _y] == WALL;
		var _south_tile = grid_[# _x, _y+1] == WALL;
		if (grid_[# _x, _y] != FLOOR) {
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			// add extra wall for depth
			if grid_[# _x, _y-1] != WALL {
				tilemap_set(_wall_map_id, _tile_index, _x, _y);
			}
			// add normal wall
			tilemap_set(_ground_map_id, _tile_index, _x, _y);
		} else {
			if grid_[# _x, _y-1] == WALL { // Shadow
				tilemap_set(_ground_map_id, 18, _x, _y);
			} else { // Ground
				tilemap_set(_ground_map_id, 17, _x, _y);
			}
		}
	}
}