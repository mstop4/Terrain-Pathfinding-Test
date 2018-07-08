var _goal_tile_x = (mouse_x div CELL_SIZE);
var _goal_tile_y = (mouse_y div CELL_SIZE);
var _goto_x, _goto_y;

var _num_units = 0;
var _selected_queue = ds_queue_create();
var _free_queue = ds_queue_create();
var _visited_grid = ds_grid_create(grid_width,grid_height);
var _occupied_grid = ds_grid_create(grid_width,grid_height);
var _cur_tile_enc, _cur_tile_dec, _cur_unit;
var _settle_tile_enc, _settle_tile_dec, _existing_unit;

var _tile_info, _tile_index;

ds_grid_clear(_visited_grid,0);
ds_grid_clear(_occupied_grid,0);
ds_queue_enqueue(_free_queue,encode_coords(_goal_tile_x,_goal_tile_y));

with (obj_unit) {
	if (selected) {
		ds_queue_enqueue(_selected_queue,id);
		my_state = unitState.ready;
	}
	else 
	{
		if (my_state == unitState.idle) {
			var _x = x div CELL_SIZE;
			var _y = y div CELL_SIZE;
			_occupied_grid[# _x, _y] = id;
		}
		
		else if (my_state == unitState.moving) {
			var _x = goal_x div CELL_SIZE;
			var _y = goal_y div CELL_SIZE;
			_occupied_grid[# _x, _y] = id;		
		}
	}
}

while (!ds_queue_empty(_selected_queue)) {
	
	_cur_tile_enc = ds_queue_dequeue(_free_queue);
	_cur_tile_dec = decode_coords(_cur_tile_enc);

	_tile_info = tilemap_get(ter_tilemap,_cur_tile_dec[0],_cur_tile_dec[1]);
	_tile_index = tile_get_index(_tile_info);
	
	if (_tile_index != 1) {
		_cur_unit = ds_queue_dequeue(_selected_queue);
		_goto_x = _cur_tile_dec[0] * CELL_SIZE + CELL_SIZE / 2;
		_goto_y = _cur_tile_dec[1] * CELL_SIZE + CELL_SIZE / 2;
		_visited_grid[# _cur_tile_dec[0], _cur_tile_dec[1]] = 1;	
		
		with (_cur_unit) {
			build_goto_path(_goto_x,_goto_y);
		}
		
		var _existing_unit = _occupied_grid[# _cur_tile_dec[0], _cur_tile_dec[1]];
		if (_existing_unit != 0) {
			with (_existing_unit) {
				ds_grid_copy(my_settle_grid, _occupied_grid);
				ds_queue_enqueue(settle_process_queue,encode_coords(_cur_tile_dec[0], _cur_tile_dec[1]));
				var result = find_settle_tile(other.grid_width,other.grid_height,my_settle_grid,settle_process_queue,other.ter_tilemap);
			
				if (result[0] != -1) {
					_occupied_grid[# result[0], result[1]] = id;
					build_goto_path(result[0] * CELL_SIZE + CELL_SIZE / 2, result[1] * CELL_SIZE + CELL_SIZE / 2);
				}
			}
		}
		
		_occupied_grid[# _cur_tile_dec[0], _cur_tile_dec[1]] = _cur_unit;
	}
	
	enqueue_free_tile(_cur_tile_dec[0]-1,_cur_tile_dec[1],grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]-1,grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0]+1,_cur_tile_dec[1],grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]+1,grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
}

ds_queue_destroy(_free_queue);
ds_queue_destroy(_selected_queue);
ds_grid_destroy(_visited_grid);
ds_grid_destroy(_occupied_grid);