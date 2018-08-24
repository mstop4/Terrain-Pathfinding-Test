/// @arg my_team
/// @arg max_distance

var _my_team = argument[0];
var _max_dist = argument[1];
var _orig_unit = id;
var _col_list = ds_list_create();

collision_circle_list(_orig_unit.x,_orig_unit.y,_max_dist,obj_unit,false,true,_col_list,true);

var _len = ds_list_size(_col_list);

for (var i=0; i<_len; i++) {
	if (_col_list[| i].my_team != _my_team) {
		var _closest_unit = _col_list[| i];
		ds_list_destroy(_col_list);
		return _closest_unit;
	}
}

return noone;