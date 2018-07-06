/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg visted_list
/// @arg free_queue
/// @arg tilemap

var _x = argument[0];
var _y = argument[1];
var _w = argument[2];
var _h = argument[3];
var _vl = argument[4];
var _fq = argument[5];
var _tilemap = argument[6];

if (_x >= 0 && _x < _w &&
	_y >= 0 && _y < _h) {
		
	var _ec = encode_coords(_x,_y);
	
	if (ds_list_find_index(_vl,_ec) == -1) {
		
		var _tile_info = tilemap_get(_tilemap,_x,_y);

		if (tile_get_index(_tile_info) != 1) {
			ds_queue_enqueue(_fq,_ec);
		}
	}
}