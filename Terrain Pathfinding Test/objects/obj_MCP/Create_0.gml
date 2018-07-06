#macro CELL_SIZE 16
display_set_gui_maximize(2,2,0,0);

grid_width = room_width div CELL_SIZE;
grid_height = room_height div CELL_SIZE;
mp_grid = mp_grid_create(0,0,grid_width,grid_height,CELL_SIZE,CELL_SIZE);

repeat(9) {
	instance_create_layer(320,180,"Instances",obj_unit);
}

selecting = false;
select_start_x = 0;
select_start_y = 0;
select_end_x = 0;
select_end_y = 0;