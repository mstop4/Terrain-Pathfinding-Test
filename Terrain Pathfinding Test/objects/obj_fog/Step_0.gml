var num_units = instance_number(obj_unit);

for (var i=0; i<num_units; i++) {
	var u = instance_find(obj_unit,i);
	var u_grid_x = u.x div CELL_SIZE;
	var u_grid_y = u.y div CELL_SIZE;
	
	ds_grid_set_disk(fog_grid,u_grid_x,u_grid_y,u.los,0);
}