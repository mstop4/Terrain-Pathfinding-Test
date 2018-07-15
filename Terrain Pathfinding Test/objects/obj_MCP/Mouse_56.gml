selecting = false;

with (obj_unit) {
	if (collision_rectangle(other.select_start_x,other.select_start_y,other.select_end_x,other.select_end_y,id,false,false) &&
		my_team == obj_MCP.player_team) {
		selected = true;
	}
	
	else
		selected = false;
}