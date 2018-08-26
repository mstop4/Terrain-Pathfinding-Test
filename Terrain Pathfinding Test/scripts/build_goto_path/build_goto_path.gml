/// @desc build_goto_path(goal_x, goal_y)
/// @arg goal_x
/// @arg goal_y

var _goal_x = argument[0];
var _goal_y = argument[1];

path_clear_points(my_goto_path);
var success = mp_grid_path(obj_MCP.mp_grid,my_goto_path,x,y,_goal_x,_goal_y,true);

if (success) {
	if (path_get_length(my_goto_path) > 0) {
		goal_x = _goal_x;
		goal_y = _goal_y;
		unit_path_start();
	}
	
	else {
		success = 2;
	}
}

return success;