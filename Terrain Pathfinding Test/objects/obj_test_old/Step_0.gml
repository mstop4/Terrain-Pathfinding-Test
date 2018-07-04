if (running) {
	if (point_distance(x,y,goal_x,goal_y) == 0)
		running = false;
	else
		mp_potential_step_object(goal_x,goal_y,4,obj_terrain);
}