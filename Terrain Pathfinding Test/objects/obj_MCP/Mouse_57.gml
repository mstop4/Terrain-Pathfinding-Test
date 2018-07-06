var spiral_dir = 1;
var spiral_dist = 1;
var spiral_x = (mouse_x div CELL_SIZE);
var spiral_y = (mouse_y div CELL_SIZE);
var goal_tile_x = spiral_x;
var goal_tile_y = spiral_y;

var goal_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
var goal_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
var _settle_x = goal_x
var _settle_y = goal_y;

var num_units = instance_number(obj_unit);
var unit_count = 0;
var cur_unit, tile_info, tile_index, dist_to_settle, path_length;

var temp_path = path_add();

// center
if (spiral_x > 0 && spiral_x < grid_width &&
	spiral_y > 0 && spiral_y < grid_height) {
				
	tile_info = tilemap_get(ter_tilemap,spiral_x,spiral_y);
	tile_index = tile_get_index(tile_info);
			
	if (tile_index != 1) {		
		cur_unit = instance_find(obj_unit,unit_count);
		
		with (cur_unit) {
			my_state = unitState.moving;
			build_goto_path(goal_x,goal_y);
			path_clear_points(my_settle_path);
		}
		
		unit_count++;
			
		if (unit_count >= num_units)
			exit;
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
				_settle_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
				_settle_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
				temp_path = mp_grid_path(mp_grid,temp_path,goal_x,goal_y,_settle_x,_settle_y,true);
				dist_to_settle = point_distance(_settle_x,_settle_y,goal_x,goal_y);
				path_length = path_get_length(temp_path);
				
				show_debug_message(string(path_length) + " - " + string(dist_to_settle*4));
		
				if (path_length < dist_to_settle * 4) {
					cur_unit = instance_find(obj_unit,unit_count);
				
					with (cur_unit) {
						my_state = unitState.moving;
						build_goto_path(goal_x,goal_y);
						path_assign(my_settle_path,temp_path);
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
				_settle_x = spiral_x * CELL_SIZE + CELL_SIZE / 2;
				_settle_y = spiral_y * CELL_SIZE + CELL_SIZE / 2;
				temp_path = mp_grid_path(mp_grid,temp_path,goal_x,goal_y,_settle_x,_settle_y,true);
				dist_to_settle = point_distance(_settle_x,_settle_y,goal_x,goal_y);
				path_length = path_get_length(temp_path);
				
				show_debug_message(string(path_length) + " - " + string(dist_to_settle*4));
		
				if (path_length < dist_to_settle * 4) {
					cur_unit = instance_find(obj_unit,unit_count);
				
					with (cur_unit) {
						my_state = unitState.moving;
						build_goto_path(goal_x,goal_y);
						path_assign(my_settle_path,temp_path);
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

path_delete(temp_path);