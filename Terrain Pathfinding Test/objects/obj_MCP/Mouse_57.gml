var goal_tile_x = (mouse_x div CELL_SIZE);
var goal_tile_y = (mouse_y div CELL_SIZE);
var goal_x = goal_tile_x * CELL_SIZE + CELL_SIZE / 2;
var goal_y = goal_tile_y * CELL_SIZE + CELL_SIZE / 2;
var goto_x, goto_y;

var num_units = instance_number(obj_unit);
var unit_count = 0;
var temp_path = path_add();
var free_queue = ds_queue_create();
var visited_list = ds_list_create();
var cur_tile_enc, cur_tile_dec, cur_unit

var tile_info, tile_index;

ds_queue_enqueue(free_queue,encode_coords(goal_tile_x,goal_tile_y));

while (unit_count < num_units) {
	
	cur_tile_enc = ds_queue_dequeue(free_queue);
	ds_list_add(visited_list, cur_tile_enc);
	cur_tile_dec = decode_coords(cur_tile_enc);

	tile_info = tilemap_get(ter_tilemap,cur_tile_dec[0],cur_tile_dec[1]);
	tile_index = tile_get_index(tile_info);
	
	if (tile_index != 1) {
		cur_unit = instance_find(obj_unit,unit_count);
		goto_x = cur_tile_dec[0] * CELL_SIZE + CELL_SIZE / 2;
		goto_y = cur_tile_dec[1] * CELL_SIZE + CELL_SIZE / 2;
		
		with (cur_unit) {
			my_state = unitState.moving;
			build_goto_path(goto_x,goto_y);
		}
		
		unit_count++;
	}
	
	enqueue_free_tile(cur_tile_dec[0]-1,cur_tile_dec[1],grid_width,grid_height,visited_list,free_queue,ter_tilemap);
	enqueue_free_tile(cur_tile_dec[0],cur_tile_dec[1]-1,grid_width,grid_height,visited_list,free_queue,ter_tilemap);
	enqueue_free_tile(cur_tile_dec[0]+1,cur_tile_dec[1],grid_width,grid_height,visited_list,free_queue,ter_tilemap);
	enqueue_free_tile(cur_tile_dec[0],cur_tile_dec[1]+1,grid_width,grid_height,visited_list,free_queue,ter_tilemap);
}


path_delete(temp_path);
ds_queue_destroy(free_queue);
ds_list_destroy(visited_list);