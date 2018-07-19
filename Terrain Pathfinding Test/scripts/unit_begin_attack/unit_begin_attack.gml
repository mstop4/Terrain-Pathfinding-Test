/// @arg current_unit
/// @arg target_unit

var _current_unit = argument[0];
var _target_unit = argument[1];

with (_current_unit) {
	/*if (_target_unit.cur_fight_slot == -1) {
		_target_unit.fight_circle_angle = point_direction(_target_unit.x,_target_unit.y,x,y);
		_target_unit.cur_fight_slot = 0;
	}*/
		
	var _col = collision_line_tile(x,y,_target_unit.x,_target_unit.y,1,obj_MCP.ter_tilemap);
		
	if (_col[0] == -1) {
		/*var _result = false;
		var _att_list_size = ds_list_size(_target_unit.attacker_list);
				
		while (!_result) {			
			fight_slot = _target_unit.cur_fight_slot;
			_target_unit.cur_fight_slot = wrap(_target_unit.cur_fight_slot+1, 0, _att_list_size-1);
					
			var _angle = _target_unit.fight_circle_angle + fight_slot * (360 / _att_list_size);
			var _angle_x = lengthdir_x(attack_range,_angle) + _target_unit.x;
			var _angle_y = lengthdir_y(attack_range,_angle) + _target_unit.y;
				
			//instance_meeting_tile(id,obj_MCP.ter_tilemap);
				
			_result = build_goto_path(_angle_x,_angle_y);
		}*/
				
		path_speed = 0;
		my_state = unitState.attacking;
		direction = point_direction(x,y,target_unit.x,target_unit.y);
		alarm[1] = attack_startup;
	}
}