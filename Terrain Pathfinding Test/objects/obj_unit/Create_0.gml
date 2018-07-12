my_goto_path = path_add();
goal_x = x;
goal_y = y;
selected = false;

my_state = unitState.idle;

settle_process_queue = ds_queue_create();
my_settle_grid = ds_grid_create(obj_MCP.grid_width,obj_MCP.grid_height);
attacker_list = ds_list_create();
target_unit = noone;

alarm[0] = 1;