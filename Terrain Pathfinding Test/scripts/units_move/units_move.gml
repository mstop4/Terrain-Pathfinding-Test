/// @arg selected_queue
/// @arg free_queue
/// @arg visited_grid
/// @arg occupied_grid

var _selected_queue = argument[0];
var _free_queue = argument[1];
var _visited_grid = argument[2];
var _occupied_grid = argument[3];

var _goto_x, _goto_y;
var _cur_tile_enc, _cur_tile_dec, _cur_unit;
var _settle_tile_enc, _settle_tile_dec, _existing_unit;
var _tile_index;

var _ter_tilemap = obj_MCP.ter_tilemap;
var _grid_width = obj_MCP.grid_width;
var _grid_height = obj_MCP.grid_height;

while (!ds_queue_empty(_selected_queue) && !ds_queue_empty(_free_queue)) {
	
	_cur_tile_enc = ds_queue_dequeue(_free_queue);
	_cur_tile_dec = decode_coords(_cur_tile_enc);

	_tile_index = get_tile_index(_ter_tilemap,_cur_tile_dec[0],_cur_tile_dec[1]);
	
	if (_tile_index != 1) {
		_cur_unit = ds_queue_dequeue(_selected_queue);
		_cur_unit.is_attacking = false;
		
		if (instance_exists(_cur_unit.target_unit)) {
			var _my_index = ds_list_find_index(_cur_unit.target_unit.attacker_list, _cur_unit);
			if (_my_index != -1)
				ds_list_delete(_cur_unit.target_unit.attacker_list, _my_index);
		}
		
		_goto_x = _cur_tile_dec[0] * CELL_SIZE + CELL_SIZE / 2;
		_goto_y = _cur_tile_dec[1] * CELL_SIZE + CELL_SIZE / 2;
		
		var _result;
		
		with (_cur_unit) {
			_result = build_goto_path(_goto_x,_goto_y);
		}
		
		if (_result) {
			if (_result == 2) {
				_cur_unit.my_state = unitState.idle;
			}
			
			else {
				with (_cur_unit) {
					is_attacking = false;
					is_watching = false;
					alarm[3] = -1;
					target_unit = noone;
				}
				var _x = (_cur_unit.x - CELL_SIZE / 2) div CELL_SIZE;
				var _y = (_cur_unit.y - CELL_SIZE / 2) div CELL_SIZE;
				_visited_grid[# _cur_tile_dec[0], _cur_tile_dec[1]] = 1;
			
				var _existing_unit = _occupied_grid[# _cur_tile_dec[0], _cur_tile_dec[1]];
			
				if (_existing_unit != 0 && _existing_unit.my_team == _cur_unit.my_team) {
					with (_existing_unit) {
						ds_grid_copy(my_settle_grid,obj_MCP.mp_grid_ds);
						ds_queue_enqueue(settle_process_queue,encode_coords(_cur_tile_dec[0], _cur_tile_dec[1]));
						_result = find_settle_tile(_grid_width,_grid_height,my_settle_grid,_occupied_grid,settle_process_queue,_cur_tile_dec,_ter_tilemap);
			
						if (_result[0] != -1) {
							var _original_state = my_state;
							var _result2 = build_goto_path(_result[0] * CELL_SIZE + CELL_SIZE / 2, _result[1] * CELL_SIZE + CELL_SIZE / 2);
							if (_result2) {
							
								var _x, _y;
							
								if (_original_state == unitState.idle) {
									_x = (x - CELL_SIZE / 2) div CELL_SIZE;
									_y = (y - CELL_SIZE / 2) div CELL_SIZE;
								}
							
								else if (_original_state == unitState.moving) {
									_x = goal_x div CELL_SIZE;
									_y = goal_y div CELL_SIZE;
								}
							
								_occupied_grid[# _x, _y] = 0;
								_occupied_grid[# _result[0], _result[1]] = id;
								is_watching = false;
								alarm[3] = -1;
							}
						}
					}
				}
			}
			
			_occupied_grid[# _cur_tile_dec[0], _cur_tile_dec[1]] = _cur_unit;
		}
	}
	
	enqueue_free_tile(_cur_tile_dec[0]-1,_cur_tile_dec[1],_grid_width,_grid_height,_visited_grid,_free_queue,_ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]-1,_grid_width,_grid_height,_visited_grid,_free_queue,_ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0]+1,_cur_tile_dec[1],_grid_width,_grid_height,_visited_grid,_free_queue,_ter_tilemap);
	enqueue_free_tile(_cur_tile_dec[0],_cur_tile_dec[1]+1,_grid_width,_grid_height,_visited_grid,_free_queue,_ter_tilemap);
}