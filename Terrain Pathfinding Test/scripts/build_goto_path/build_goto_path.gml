/// @desc build_goto_path(goal_x, goal_y)
/// @arg goal_x
/// @arg goal_y

var _goal_x = argument[0];
var _goal_y = argument[1];

path_clear_points(my_goto_path);
var success = mp_grid_path(obj_MCP.mp_grid,my_goto_path,x,y,_goal_x,_goal_y,true);

if (success) {
	//prune_path(my_goto_path);
	path_set_kind(my_goto_path, 1);
	path_set_precision(my_goto_path,8);
	path_start(my_goto_path,my_speed,path_action_stop,true);
}