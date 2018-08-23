my_goto_path = path_add();
goal_x = x;
goal_y = y;

hp = hp_max;
target_unit = noone;
fight_slot = -1;

attacker_list = ds_list_create();
cur_fight_slot = -1;
fight_circle_angle = 0;

selected = false;
my_state = unitState.idle;
is_attacking = false;

settle_process_queue = ds_queue_create();
my_settle_grid = ds_grid_create(obj_MCP.grid_width,obj_MCP.grid_height);

idle_spr = spr_test;
attack_spr = spr_test_attack;

alarm[0] = 1;