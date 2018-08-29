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

create_units_square(12,12,5,5,player_team);
create_units_square(0,0,0,0,player_team);

hover_unit = noone;
selecting = false;
select_start_x = 0;
select_start_y = 0;
select_end_x = 0;
select_end_y = 0;