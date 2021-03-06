switch (my_state) {
		
	case unitState.idle:
		var _closest_enemy = noone;
	
		// respond to assailant
		if (ds_list_size(attacker_list) != 0) {
			_closest_enemy = attacker_list[| 0];
		} 
		
		// watch for approaching enemies
		else if (is_watching) {
			_closest_enemy = find_closest_enemy(my_team, detect_range);
		}
	
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
	
		// target sighted, engage
		if (instance_exists(target_unit)) {
			if (is_attacking) {
				var _dist = point_distance(x,y,target_unit.x,target_unit.y);
				if (_dist <= attack_range) {
					//print(string(id) + ": (moving) Attacking target" + string(target_unit));
					unit_begin_attack(id,target_unit);
				}
			}
		}
			
		// move
		if (point_distance(x,y,path_tar_x,path_tar_y) < my_speed) {
			x = path_tar_x;
			y = path_tar_y;
			path_current_node++;
			
			if (path_current_node >= path_num_nodes)
				unit_path_end();
			else {
				path_tar_x = path_get_point_x(my_goto_path,path_current_node);
				path_tar_y = path_get_point_y(my_goto_path,path_current_node);
			}
		}
		
		else {
			direction = point_direction(x,y,path_tar_x,path_tar_y);
			var _dx = lengthdir_x(my_speed,direction);
			var _dy = lengthdir_y(my_speed,direction);
			
			x += _dx;
			y += _dy;
		}
			
		break;
	
	case unitState.attacking:
	
		if (instance_exists(target_unit)) {
			var _dist = point_distance(x,y,target_unit.x,target_unit.y);
	
			if (_dist < min_attack_range) {
				//print(string(id) + ": Target " + string(target_unit) + " too close");
				var _dir = point_direction(target_unit.x,target_unit.y,x,y);
			
				var _x_spd = lengthdir_x(my_speed,_dir);
				var _y_spd = lengthdir_y(my_speed,_dir);
	
				if (!instance_meeting_tile(id,obj_MCP.ter_tilemap,_x_spd,0)) {
					x += _x_spd;
					unit_reset_alarms();
				}
	
				if (!instance_meeting_tile(id,obj_MCP.ter_tilemap,0,_y_spd)) {
					y += _y_spd;
					unit_reset_alarms();
				}
			}
	
			else if (_dist > chase_range) {
				//print(string(id) + ": Chase target " + string(target_unit) + " Lost");
				my_state = unitState.idle;
				is_attacking = false;
				unit_reset_alarms();
			}
	
			else if (_dist > attack_range &&
				_dist <= chase_range) {
				//print(string(id) + ": Chasing target " + string(target_unit));
				var _temp_queue = ds_queue_create();
				ds_queue_enqueue(_temp_queue,id);
				units_attack(_temp_queue, target_unit);
				ds_queue_destroy(_temp_queue);
				unit_reset_alarms();
			}
		
			else if (alarm[1] == -1 && alarm[2] == -1) {
				//print(string(id) + ": (attack) Attacking target" + string(target_unit));
				unit_begin_attack(id,target_unit);
			}
		} 
		
		else {
			target_unit = noone;
			my_state = unitState.idle;
		}
		
		break;
}