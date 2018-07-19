#macro CELL_SIZE 16
display_set_gui_maximize(2,2,0,0);
init_enums();

global.teamColours = [
	$C0C0C0,
	$F0AE00,
	$4AB539,
	$00F2FF,
	$241CEE
]

grid_width = room_width div CELL_SIZE;
grid_height = room_height div CELL_SIZE;
mp_grid = mp_grid_create(0,0,grid_width,grid_height,CELL_SIZE,CELL_SIZE);
mp_grid_ds = ds_grid_create(grid_width,grid_height);

for (var i=12; i<15; i++) {
	for (var j=12; j<15; j++) {
		var u = instance_create_layer(i * CELL_SIZE + CELL_SIZE / 2,j * CELL_SIZE + CELL_SIZE / 2,"Instances",obj_unit);
		u.my_team = 1;
	}
}

for (var i=0; i<2; i++) {
	for (var j=0; j<2; j++) {
		var u = instance_create_layer(i * CELL_SIZE + CELL_SIZE / 2,j * CELL_SIZE + CELL_SIZE / 2,"Instances",obj_unit);
		u.my_team = player_team;
	}
}

hover_unit = noone;
selecting = false;
select_start_x = 0;
select_start_y = 0;
select_end_x = 0;
select_end_y = 0;