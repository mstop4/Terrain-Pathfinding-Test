if (is_attacking) {
	if (my_state == unitState.moving) {
		if (point_distance(x,y,target_unit.x,target_unit.y) < attack_range) {
		
			if (target_unit.cur_fight_slot == -1) {
				target_unit.fight_circle_angle = point_direction(target_unit.x,target_unit.y,x,y);
				target_unit.cur_fight_slot = 0;
			}
		
			var _col = collision_line_tile(x,y,target_unit.x,target_unit.y,1,obj_MCP.ter_tilemap);
		
			if (_col[0] == -1) {
				var _result = false;
				var _att_list_size = ds_list_size(target_unit.attacker_list);
				
				while (!_result) {			
					fight_slot = target_unit.cur_fight_slot;
					target_unit.cur_fight_slot = wrap(target_unit.cur_fight_slot+1, 0, _att_list_size-1);
					
					var _angle = target_unit.fight_circle_angle + fight_slot * (360 / _att_list_size);
					var _angle_x = lengthdir_x(attack_range,_angle) + target_unit.x;
					var _angle_y = lengthdir_y(attack_range,_angle) + target_unit.y;
				
					//!instance_meeting_tile(id,obj_MCP.ter_tilemap)
				
					_result = build_goto_path(_angle_x,_angle_y);
				}
				
				my_state = unitState.attacking;
			}
		}
	}
	
	else if (my_state == unitState.attacking) {
	
	}
}