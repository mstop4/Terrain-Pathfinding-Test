if (running) {
	if (cur_node_index >= path_get_number(my_path)) {
		running = false;
	}
	
	else {
		if (point_distance(x,y,cur_node_x,cur_node_y) < my_speed) {
			cur_node_index++;
			cur_node_x = path_get_point_x(my_path,cur_node_index);
			cur_node_y = path_get_point_y(my_path,cur_node_index);
		}
		
		else {
			mp_potential_step_object(cur_node_x,cur_node_y,my_speed,obj_wall);
		}
	}
}