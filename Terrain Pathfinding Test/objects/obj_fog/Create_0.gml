/*var fog_layer = layer_get_id("Fog");
fog_tilemap = layer_tilemap_get_id(fog_layer);

var fog_tile_info, fog_tile_index;

for (var i=0; i<obj_MCP.grid_width; i++) {
	for (var j=0; j<obj_MCP.grid_height; j++) {
		fog_tile_info = tilemap_get(fog_tilemap,i,j);
		fog_tile_info = tile_set_index(fog_tile_info,1);
		tilemap_set(fog_tilemap,fog_tile_info,i,j);
	}
}*/

fog_grid = ds_grid_create(obj_MCP.grid_width,obj_MCP.grid_height);
ds_grid_set_region(fog_grid,0,0,obj_MCP.grid_width-1,obj_MCP.grid_height-1,1);