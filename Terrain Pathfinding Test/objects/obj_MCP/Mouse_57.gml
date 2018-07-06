var _goal_tile_x = (mouse_x div CELL_SIZE);
var _goal_tile_y = (mouse_y div CELL_SIZE);
var _goto_x, _goto_y;

var _num_units = instance_number(obj_unit);
var _unit_count = 0;
var _free_queue = ds_queue_create();
var _visited_list = ds_list_create();
var _cur_tile_enc, _cur_tile_dec, _cur_unit;

var _tile_info, _tile_index;

ds_queue_enqueue(_free_queue,encode_coords(_goal_tile_x,_goal_tile_y));

while (_unit_count < _num_units) {
	
	_cur_tile_enc = ds_queue_dequeue(_free_queue);
	ds_list_add(_visited_list, _cur_tile_enc);
	_cur_tile_dec = decode_coords(_cur_tile_enc);

	_tile_info = tilemap_get(ter_tilemap,_cur_tile_dec[0],_cur_tile_dec[1]);
	_tile_index = tile_get_index(_tile_info);
	
	if (_tile_index != 1) {
		_cur_unit = instance_find(obj_unit,_unit_count);
		_goto_x = _cur_tile_dec[0] * CELL_SIZE + CELL_SIZE / 2;
		_goto_y = _cur_tile_dec[1] * CELL_SIZE + CELL_SIZE / 2;
		
		with (_cur_unit) {
			my_state = unitState.moving;
			build_goto_path(_goto_x,_goto_y);
		}
		
		_unit_count++;
	}
	
	enqueue_free_tile(_cur_tile_dec[0]-1,_cur_tile_dec[1],grid_width,grid_height,_visited_list,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]-1,grid_width,grid_height,_visited_list,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0]+1,_cur_tile_dec[1],grid_width,grid_height,_visited_list,_free_queue,ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]+1,grid_width,grid_height,_visited_list,_free_queue,ter_tilemap);
}

ds_queue_destroy(_free_queue);
ds_list_destroy(_visited_list);