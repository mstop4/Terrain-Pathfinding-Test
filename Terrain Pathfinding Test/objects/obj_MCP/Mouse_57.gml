var _goal_tile_x = (mouse_x div CELL_SIZE);
var _goal_tile_y = (mouse_y div CELL_SIZE);

var _num_units = 0;
var _selected_queue = ds_queue_create();
var _free_queue = ds_queue_create();
var _visited_grid = ds_grid_create(grid_width,grid_height);
var _occupied_grid = ds_grid_create(grid_width,grid_height);

ds_queue_enqueue(_free_queue,encode_coords(_goal_tile_x,_goal_tile_y));

with (obj_unit) {
	if (selected) {
		ds_queue_enqueue(_selected_queue,id);
		my_state = unitState.ready;
		alarm[1] = -1;
		alarm[2] = -1;
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

if (hover_unit && hover_unit.my_team != player_team) {
	units_attack(_selected_queue, hover_unit);
}

else {
	units_move(_selected_queue, _free_queue, _visited_grid, _occupied_grid, player_team);
}

ds_queue_destroy(_free_queue);
ds_queue_destroy(_selected_queue);
ds_grid_destroy(_visited_grid);
ds_grid_destroy(_occupied_grid);