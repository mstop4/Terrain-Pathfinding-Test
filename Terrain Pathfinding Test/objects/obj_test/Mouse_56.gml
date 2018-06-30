var success = mp_potential_path_object(my_path,mouse_x,mouse_y,4,4,obj_terrain);

if (success) {
	path_start(my_path,4,path_action_stop,true);
}