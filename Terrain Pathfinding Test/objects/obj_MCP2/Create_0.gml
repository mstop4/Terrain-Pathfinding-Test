#macro CELL_SIZE 16
var grid_width = room_width div CELL_SIZE;
var grid_height = room_height div CELL_SIZE;

mp_grid = mp_grid_create(0,0,grid_width,grid_height,CELL_SIZE,CELL_SIZE);
mp_grid_add_instances(mp_grid,obj_wall,false);

repeat(5) {
	instance_create_layer(320,180,"Instances",obj_test2);
}

min_fps = 1000000;
max_fps = -100000;
track_fps = false;
alarm[0] = 60;

select_start_x = 0;
select_start_y = 0;
select_end_x = 0;
select_end_y = 0;