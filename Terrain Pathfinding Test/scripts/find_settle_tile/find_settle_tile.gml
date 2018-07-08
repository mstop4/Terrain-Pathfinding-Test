/// @arg width
/// @arg height
/// @arg settle_grid
/// @arg occupied_grid
/// @arg settle_queue
/// @arg tilemap

var _w = argument[0];
var _h = argument[1];
var _sg = argument[2];
var _og = argument[3]
var _sq = argument[4];
var _tilemap = argument[5];

var _dec, _x, _y;

while (!ds_queue_empty(_sq)) {
	_dec = decode_coords(ds_queue_dequeue(_sq));
	_x = _dec[0];
	_y = _dec[1];
		
	var _tile_info = tilemap_get(_tilemap,_x,_y);

	if (tile_get_index(_tile_info) != 1 &&
		_og[# _x, _y] == 0) {
			
		ds_queue_clear(_sq);
		return [_x, _y];
	}
	
	_sg[# _x, _y] = -1;
	
	if (_x+1 < _w && _sg[# _x+1, _y] == 0)
		ds_queue_enqueue(_sq,encode_coords(_x+1,_y));
	if (_y+1 < _h && _sg[# _x, _y+1] == 0)
		ds_queue_enqueue(_sq,encode_coords(_x,_y+1));
	if (_x-1 >= 0 && _sg[# _x-1, _y] == 0)
		ds_queue_enqueue(_sq,encode_coords(_x-1,_y));
	if (_y-1 >= 0 && _sg[# _x, _y-1] == 0)
		ds_queue_enqueue(_sq,encode_coords(_x,_y-1));
}

return [-1, -1];