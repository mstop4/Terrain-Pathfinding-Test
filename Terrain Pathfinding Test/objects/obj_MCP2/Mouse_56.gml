var snap_x = (mouse_x div CELL_SIZE) * CELL_SIZE + CELL_SIZE / 2;
var snap_y = (mouse_y div CELL_SIZE) * CELL_SIZE + CELL_SIZE / 2;

with (obj_test2) {
	var success = mp_grid_path(obj_MCP2.mp_grid,my_path,x,y,snap_x,snap_y,true);

	if (success) {
		running = true;
		cur_node_index = 0;
		cur_node_x = path_get_point_x(my_path,cur_node_index);
		cur_node_y = path_get_point_y(my_path,cur_node_index);
	}
}