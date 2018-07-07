/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg visted_grid
/// @arg free_queue
/// @arg tilemap

var _x = argument[0];
var _y = argument[1];
var _w = argument[2];
var _h = argument[3];
var _vg = argument[4];
var _fq = argument[5];
var _tilemap = argument[6];

if (_x >= 0 && _x < _w &&
	_y >= 0 && _y < _h) {
		
	if (_vg[# _x, _y] == 0) {
		
		_vg[# _x, _y] = 1;
		var _tile_info = tilemap_get(_tilemap,_x,_y);

		if (tile_get_index(_tile_info) != 1) {
			var _ec = encode_coords(_x,_y);
			ds_queue_enqueue(_fq,_ec);
		}
	}
}