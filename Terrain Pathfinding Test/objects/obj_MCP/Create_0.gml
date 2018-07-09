#macro CELL_SIZE 16
display_set_gui_maximize(2,2,0,0);
init_enums();

grid_width = room_width div CELL_SIZE;
grid_height = room_height div CELL_SIZE;
mp_grid = mp_grid_create(0,0,grid_width,grid_height,CELL_SIZE,CELL_SIZE);
mp_grid_ds = ds_grid_create(grid_width,grid_height);

for (var i=s_left; i<s_right; i++) {
	for (var j=s_top; j<s_bottom; j++) {
		instance_create_layer(i * CELL_SIZE + CELL_SIZE / 2,j * CELL_SIZE + CELL_SIZE / 2,"Instances",obj_unit);
	}
}

for (var i=0; i<2; i++) {
	for (var j=0; j<2; j++) {
		var u = instance_create_layer(i * CELL_SIZE + CELL_SIZE / 2,j * CELL_SIZE + CELL_SIZE / 2,"Instances",obj_unit);
		u.image_blend = $d35600;
	}
}

selecting = false;
select_start_x = 0;
select_start_y = 0;
select_end_x = 0;
select_end_y = 0;