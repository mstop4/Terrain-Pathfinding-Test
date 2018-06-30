var snap_x = (mouse_x div CELL_SIZE) * CELL_SIZE + CELL_SIZE / 2;
var snap_y = (mouse_y div CELL_SIZE) * CELL_SIZE + CELL_SIZE / 2;

with (obj_test2) {
	var success = mp_grid_path(obj_MCP2.mp_grid,my_path,x,y,mouse_x,mouse_y,true);

	if (success) {
		path_start(my_path,my_speed,path_action_stop,true);
	}
}