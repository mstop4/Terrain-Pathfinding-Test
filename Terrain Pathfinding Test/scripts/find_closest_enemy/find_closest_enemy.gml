/// @arg my_team
/// @arg max_distance

var _my_team = argument[0];
var _max_dist = argument[1];
var _closest_dist = 1000000;
var _closest_id = noone;
var _orig_unit = id;
var _dist;

with (obj_unit) {
	if (_orig_unit != id &&
		my_team != _my_team) {
		
		_dist = point_distance(_orig_unit.x,_orig_unit.y,x,y);
		if (_dist <= _max_dist &&
			_dist < _closest_dist) {
			_closest_dist = _dist;
			_closest_id = id;
			
		}
	}
}

return _closest_id;