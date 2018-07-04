var num_units = instance_number(obj_unit);

for (var i=0; i<num_units; i++) {
	var u = instance_find(obj_unit,i);
	var u_grid_x = u.x div CELL_SIZE;
	var u_grid_y = u.y div CELL_SIZE;
	
	ds_grid_set_disk(fog_grid,u_grid_x,u_grid_y,u.los,0);
}

/*var fog_tile_info;

for (var i=0; i<obj_MCP.grid_width; i++) {
	for (var j=0; j<obj_MCP.grid_height; j++) {
		fog_tile_info = tilemap_get(fog_tilemap,i,j);
		fog_tile_info = tile_set_index(fog_tile_info,fog_grid[# i,j]);
		tilemap_set(fog_tilemap,fog_tile_info,i,j);
	}
}*/
