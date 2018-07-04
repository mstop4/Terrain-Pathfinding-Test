var tile_info;
var grid_x = mouse_x div CELL_SIZE;
var grid_y = mouse_y div CELL_SIZE;

tile_info = tilemap_get(ter_tilemap,grid_x,grid_y);
tile_info = tile_set_empty(tile_info);
tilemap_set(ter_tilemap,tile_info,grid_x,grid_y);

mp_grid_clear_cell(mp_grid,grid_x,grid_y);