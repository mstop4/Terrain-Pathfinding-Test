var ter_layer = layer_get_id("Terrain");
ter_tilemap = layer_tilemap_get_id(ter_layer);

var ter_tile_index;

for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		ter_tile_index = get_tile_index(ter_tilemap,i,j);
		
		if (ter_tile_index == 1) {
			mp_grid_add_cell(mp_grid,i,j);
		}
	}
}

mp_grid_to_ds_grid(mp_grid,mp_grid_ds);