/// @arg tilemap
/// @arg cell_x
/// @arg cell_y

var _tilemap = argument[0];
var _cell_x = argument[1];
var _cell_y = argument[2];

var _tile_info = tilemap_get(_tilemap,_cell_x,_cell_y);
return tile_get_index(_tile_info);