/// @arg tilemap
/// @arg x
/// @arg y

var _tilemap = argument[0];
var _x = argument[1];
var _y = argument[2];

var _tile_info = tilemap_get_at_pixel(_tilemap,_x,_y);
return tile_get_index(_tile_info);