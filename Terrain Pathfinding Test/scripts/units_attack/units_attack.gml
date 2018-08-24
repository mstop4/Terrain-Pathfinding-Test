/// @arg selected_queue
/// @arg target_unit

var _selected_queue = argument[0];
var _target_unit = argument[1];
var _cur_unit, _result;

_target_unit.cur_fight_slot = -1;

while (!ds_queue_empty(_selected_queue) ) {
	_cur_unit = ds_queue_dequeue(_selected_queue);
	
	with (_cur_unit) {
		_result = build_goto_path(_target_unit.x,_target_unit.y);
	
		if (_result) {
			is_attacking = true;
			
			// remove self from previous attack target's list
			if (instance_exists(target_unit)) {
				var _my_index = ds_list_find_index(target_unit.attacker_list, id);
				if (_my_index != -1)
					ds_list_delete(target_unit.attacker_list, _my_index);
			}
			
			// update attack target 
			target_unit = _target_unit;
		}
	
		else {
			is_attacking = false;
			
			// remove self from attack target's list
			if (target_unit != noone) {
				var _my_index = ds_list_find_index(target_unit.attacker_list, id);
				if (_my_index != -1)
					ds_list_delete(target_unit.attacker_list, _my_index);
			}
			
			target_unit = noone;
		}
	}
}