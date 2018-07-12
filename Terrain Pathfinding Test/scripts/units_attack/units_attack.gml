/// @arg selected_queue
/// @arg target_unit

var _selected_queue = argument[0];
var _target_unit = argument[1];
var _cur_unit, _result;

while (!ds_queue_empty(_selected_queue) ) {
	_cur_unit = ds_queue_dequeue(_selected_queue);
	
	with (_cur_unit) {
		_result = build_goto_path(_target_unit.x,_target_unit.y);
	
		if (_result) {
			is_attacking = true;
			target_unit = _target_unit;
			ds_list_add(_target_unit.attacker_list, id);
		}
	
		else {
			is_attacking = false;
			target_unit = _target_unit;
		}
	}
}