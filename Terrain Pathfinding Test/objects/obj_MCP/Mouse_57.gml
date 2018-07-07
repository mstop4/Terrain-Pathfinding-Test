var _goal_tile_x = (mouse_x div CELL_SIZE);
var _goal_tile_y = (mouse_y div CELL_SIZE);
var _goto_x, _goto_y;

var _num_units = 0;
var _selected_queue = ds_queue_create();
var _free_queue = ds_queue_create();
var _visited_grid = ds_grid_create(grid_width,grid_height);
var _cur_tile_enc, _cur_tile_dec, _cur_unit;

var _tile_info, _tile_index;

ds_grid_clear(_visited_grid,0);
ds_queue_enqueue(_free_queue,encode_coords(_goal_tile_x,_goal_tile_y));

with (obj_unit) {
	if (selected)
		ds_queue_enqueue(_selected_queue,id);
	else {
		if (my_state == unitState.idle) {
			var _grid_x = x div CELL_SIZE;
			var _grid_y = y div CELL_SIZE;
			_visited_grid[# _grid_x, _grid_y] = 1;
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
			my_state = unitState.moving;
			build_goto_path(_goto_x,_goto_y);
		}
	}
	
	enqueue_free_tile(_cur_tile_dec[0]-1,_cur_tile_dec[1],grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]-1,grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0]+1,_cur_tile_dec[1],grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]+1,grid_width,grid_height,_visited_grid,_free_queue,ter_tilemap);
}

ds_queue_destroy(_free_queue);
ds_queue_destroy(_selected_queue);
ds_grid_destroy(_visited_grid);