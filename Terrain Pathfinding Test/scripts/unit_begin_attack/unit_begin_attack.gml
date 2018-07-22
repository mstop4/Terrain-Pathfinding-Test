/// @arg current_unit
/// @arg target_unit

var _current_unit = argument[0];
var _target_unit = argument[1];

with (_current_unit) {
	var _col = collision_line_tile(x,y,_target_unit.x,_target_unit.y,1,obj_MCP.ter_tilemap);
		
	if (_col[0] == -1) {	
		path_speed = 0;
		my_state = unitState.attacking;
		direction = point_direction(x,y,target_unit.x,target_unit.y);
		alarm[1] = attack_startup;
	}
}