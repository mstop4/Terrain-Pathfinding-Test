switch (my_state) {
		
	case unitState.idle:
		var _closest_enemy = find_closest_enemy(my_team, detect_range);
		if (_closest_enemy != noone) {
			is_attacking = true;
			my_state = unitState.attacking;
			
			// remove self from previous attack target's list
			if (instance_exists(target_unit)) {
				var _my_index = ds_list_find_index(target_unit.attacker_list, id);
				if (_my_index != -1)
					ds_list_delete(target_unit.attacker_list, _my_index);
			}
			
			// update attack target 
			target_unit = _closest_enemy;
			
			if (ds_list_find_index(_closest_enemy.attacker_list, id) == -1)
				ds_list_add(_closest_enemy.attacker_list, id);
				
			// make room for any new attackers
			var _at_len = ds_list_size(_closest_enemy.attacker_list);
			var _cur_unit;
			
			for (var i=0; i<_at_len; i++) {
				_cur_unit =  _closest_enemy.attacker_list[| i];
				if (_cur_unit.my_state == unitState.attacking) {
					unit_begin_attack(_cur_unit,_closest_enemy);
				}
			}
		}
		
		break;
	
	case unitState.moving: 
		if (is_attacking && point_distance(x,y,target_unit.x,target_unit.y) <= attack_range) {
			unit_begin_attack(id,target_unit);
		}
			
		break;
	
	case unitState.attacking:
		if (point_distance(x,y,target_unit.x,target_unit.y) > attack_range) {
			var _temp_queue = ds_queue_create();
			ds_queue_enqueue(_temp_queue,id);
			units_attack(_temp_queue, target_unit);
			ds_queue_destroy(_temp_queue);
		}
		break;
}