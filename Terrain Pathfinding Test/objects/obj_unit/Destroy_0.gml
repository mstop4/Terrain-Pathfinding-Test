var _goal_tile_x = (x div CELL_SIZE);
var _goal_tile_y = (y div CELL_SIZE);

var _num_units = 0;
var _selected_queue = ds_queue_create();
var _free_queue = ds_queue_create();
var _visited_grid = ds_grid_create(obj_MCP.grid_width,obj_MCP.grid_height);
var _occupied_grid = ds_grid_create(obj_MCP.grid_width,obj_MCP.grid_height);

ds_queue_enqueue(_free_queue,encode_coords(_goal_tile_x,_goal_tile_y));

with (obj_unit) {
	if (ds_list_find_index(other.attacker_list,id) != -1) {
		ds_queue_enqueue(_selected_queue,id);
		my_state = unitState.ready;
	}
	
	else {
		if (my_state == unitState.idle) {
			var _x = (x - CELL_SIZE / 2) div CELL_SIZE;
			var _y = (y - CELL_SIZE / 2) div CELL_SIZE;
			_occupied_grid[# _x, _y] = id;
		}
		
		else if (my_state == unitState.moving) {
			var _x = goal_x div CELL_SIZE;
			var _y = goal_y div CELL_SIZE;
			_occupied_grid[# _x, _y] = id;
		}
	}
}

units_move(_selected_queue, _free_queue, _visited_grid, _occupied_grid);

ds_queue_destroy(_free_queue);
ds_queue_destroy(_selected_queue);
ds_grid_destroy(_visited_grid);
ds_grid_destroy(_occupied_grid);