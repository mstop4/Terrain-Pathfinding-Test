my_goto_path = path_add();
goal_x = x;
goal_y = y;
selected = false;

my_state = unitState.idle;
image_blend = my_colour;

settle_process_queue = ds_queue_create();
my_settle_grid = ds_grid_create(obj_MCP.grid_width,obj_MCP.grid_height);