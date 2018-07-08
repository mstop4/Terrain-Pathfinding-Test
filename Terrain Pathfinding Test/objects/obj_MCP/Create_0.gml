#macro CELL_SIZE 16
display_set_gui_maximize(2,2,0,0);
init_enums();

grid_width = room_width div CELL_SIZE;
grid_height = room_height div CELL_SIZE;
mp_grid = mp_grid_create(0,0,grid_width,grid_height,CELL_SIZE,CELL_SIZE);
mp_grid_ds = ds_grid_create(grid_width,grid_height);
occupied_grid = ds_grid_create(grid_width,grid_height);

for (var i=12; i<22; i++) {
	for (var j=2; j<12; j++) {
		instance_create_layer(i * CELL_SIZE + CELL_SIZE / 2,j * CELL_SIZE + CELL_SIZE / 2,"Instances",obj_unit);
	}
}

/*repeat(10) {
	var u = instance_create_layer(320,196,"Instances",obj_unit);
	u.image_blend = $d35600;
}*/

selecting = false;
select_start_x = 0;
select_start_y = 0;
select_end_x = 0;
select_end_y = 0;