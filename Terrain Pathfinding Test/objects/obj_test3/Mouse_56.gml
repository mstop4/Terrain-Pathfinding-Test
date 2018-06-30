var success = mp_grid_path(obj_MCP2.mp_grid,my_path,x,y,mouse_x,mouse_y,true);

if (success) {
	running = true;
	cur_node_index = 0;
	cur_node_x = path_get_point_x(my_path,cur_node_index);
	cur_node_y = path_get_point_y(my_path,cur_node_index);
}