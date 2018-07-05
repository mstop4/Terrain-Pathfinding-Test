var spiral_dir = 1;
var spiral_dist = 1;
var spiral_x = (mouse_x div CELL_SIZE);
var spiral_y = (mouse_y div CELL_SIZE);

var goal_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
var goal_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
var _settle_x = goal_x
var _settle_y = goal_y;

var num_units = instance_number(obj_unit);
var unit_count = 0;
var cur_unit, tile_info, tile_index, col_info;

// center
if (spiral_x > 0 && spiral_x < grid_width &&
	spiral_y > 0 && spiral_y < grid_height) {
				
	tile_info = tilemap_get(ter_tilemap,spiral_x,spiral_y);
	tile_index = tile_get_index(tile_info);
			
	if (tile_index != 1) {
		col_info = collision_line_tile(goal_x,goal_y,spiral_x,spiral_y,1,ter_tilemap);
		
		if (col_info[0] == -1) {
			cur_unit = instance_find(obj_unit,unit_count);
			_settle_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
			_settle_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
		
			with (cur_unit) {
				my_state = unitState.moving;
				build_path(goal_x,goal_y);
				settle_x = _settle_x;
				settle_y = _settle_y;
			}
		
			unit_count++;
			
			if (unit_count >= num_units)
				exit;
		}
	}
}

while (true) {
	// horizontal
	for (var i=0; i<spiral_dist; i++) {
		spiral_x += spiral_dir;
		
		if (spiral_x > 0 && spiral_x < grid_width &&
			spiral_y > 0 && spiral_y < grid_height) {
				
			tile_info = tilemap_get(ter_tilemap,spiral_x,spiral_y);
			tile_index = tile_get_index(tile_info);
			
			if (tile_index != 1) {
				col_info = collision_line_tile(goal_x,goal_y,spiral_x,spiral_y,1,ter_tilemap);
		
				if (col_info[0] == -1) {
					cur_unit = instance_find(obj_unit,unit_count);
					_settle_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
					_settle_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
				
					with (cur_unit) {
						my_state = unitState.moving;
						build_path(goal_x,goal_y);
						settle_x = _settle_x;
						settle_y = _settle_y;
					}
				
					unit_count++;
			
					if (unit_count >= num_units)
						exit;
				}
			}
		}
	}

	// vertical
	for (var i=0; i<spiral_dist; i++) {
		spiral_y += spiral_dir;
		
		if (spiral_x > 0 && spiral_x < grid_width &&
			spiral_y > 0 && spiral_y < grid_height) {
				
			tile_info = tilemap_get(ter_tilemap,spiral_x,spiral_y);
			tile_index = tile_get_index(tile_info);
			
			if (tile_index != 1) {
				col_info = collision_line_tile(goal_x,goal_y,spiral_x,spiral_y,1,ter_tilemap);
		
				if (col_info[0] == -1) {
					cur_unit = instance_find(obj_unit,unit_count);
					_settle_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
					_settle_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
				
					with (cur_unit) {
						my_state = unitState.moving;
						build_path(goal_x,goal_y);
						settle_x = _settle_x;
						settle_y = _settle_y;
					}
				
					unit_count++;
			
					if (unit_count >= num_units)
						exit;
				}
			}
		}
	}
	
	// incr
	spiral_dir *= -1;
	spiral_dist++;
}