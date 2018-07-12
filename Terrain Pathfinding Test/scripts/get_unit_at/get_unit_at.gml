/// @arg x
/// @arg y
/// @arg my_team

var _x = argument[0];
var _y = argument[1];
var _my_team = argument[2];
var _unit_queue = ds_queue_create();
var _return_unit = noone;
var _cur_unit;

with (obj_unit) {
	if (position_meeting(_x,_y,id)) {
		ds_queue_enqueue(_unit_queue,id);
	}
}

while (!ds_queue_empty(_unit_queue)) {
	_cur_unit = ds_queue_dequeue(_unit_queue);
	
	if (_cur_unit.my_team != _my_team) {
		ds_queue_destroy(_unit_queue);
		return _cur_unit;
	}
	
	else {
		_return_unit = _cur_unit;
	}
}

ds_queue_destroy(_unit_queue);
return _return_unit;