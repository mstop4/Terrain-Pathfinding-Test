// Check for first non-free tile in a given direction and range

/// @param start_x
/// @param start_y
/// @param end_x
/// @param end_y
/// @param value
/// @param tilemap

/// @returns [iteration, x, y, distance]

var _start_x = argument[0];
var _start_y = argument[1];
var _end_x = argument[2];
var _end_y = argument[3];
var _v = argument[4];
var _tm = argument[5];

var _len = point_distance(_start_x, _start_y, _end_x, _end_y);
var _dir = point_direction(_start_x, _start_y, _end_x, _end_y);
var _dx = lengthdir_x(_len,_dir);
var _dy = lengthdir_y(_len,_dir);
var _abs_dx = abs(_dx);
var _abs_dy = abs(_dy);
var _sign_dx = sign(_dx);
var _sign_dy = sign(_dy);
var _abs_m, _is_vertical;
var _tile_info, _tile_index;

var _prev_x = 0;
var _prev_y = 0;

// non-vertical line
if (_abs_dx <> 0)
{
	var _abs_m = _abs_dy / _abs_dx;
	var _cur_x = 0;
	var _cur_y = 0;
	var _err = 0;

	// iterate over x
	if (_abs_dx > _abs_dy)
	{
		for (var i=0; i<_abs_dx; i++)
		{
			_cur_x = _sign_dx * i;
			
			_tile_info = tilemap_get_at_pixel(_tm,_start_x+_cur_x,_start_y+_cur_y);
			_tile_index = tile_get_index(_tile_info);

			if (_tile_index == _v)
			{
				var _dist = point_distance(0,0,_prev_x, _prev_y);
				return [i, _start_x + _prev_x, _start_y + _prev_y, _dist];
			}
				
			_err += _abs_m;
		
			while (_err > 0.5)
			{
				_cur_y += _sign_dy * 1;
				_err -= 1;
			}
			
			_prev_x = _cur_x;
			_prev_y = _cur_y;
		}
	
		return [-1, _start_x + _dx, _start_y + _dy, _len];
	}

	// iterate over y
	else
	{
		var _inv_abs_m = 1/_abs_m;
	
		for (var i=0; i<_abs_dy; i++)
		{
			_cur_y = _sign_dy * i;
			
			_tile_info = tilemap_get_at_pixel(_tm,_start_x+_cur_x,_start_y+_cur_y);
			_tile_index = tile_get_index(_tile_info);
			
			if (_tile_index == _v)
			{
				var _dist = point_distance(0,0,_prev_x, _prev_y);
				return [i, _start_x + _prev_x, _start_y + _prev_y, _dist];
			}
	
			_err += _inv_abs_m;
		
			while (_err > 0.5)
			{
				_cur_x += _sign_dx * 1;
				_err -= 1;
			}
			
			_prev_x = _cur_x;
			_prev_y = _cur_y;
		}
	
		return [-1, _start_x + _dx, _start_y + _dy, _len];
	}
}

// vertical line
else
{
	var _cur_x = 0;
	
	for (var i=0; i<_abs_dy; i++)
	{
		_cur_y = _sign_dy * i;
		
		_tile_info = tilemap_get_at_pixel(_tm,_start_x+_cur_x,_start_y+_cur_y);
		_tile_index = tile_get_index(_tile_info);
		
		if (_tile_index == _v)
		{
			var _dist = point_distance(0,0,_prev_x, _prev_y);
			return [i, _start_x + _prev_x, _start_y + _prev_y, _dist];
		}
		
		_prev_x = _cur_x;
		_prev_y = _cur_y;
	}
	
	return [-1, _start_x + _dx, _start_y + _dy, _len];
}