if (is_attacking && my_state != unitState.attacking) {
	if (point_distance(x,y,target_unit.x,target_unit.y < attack_range) &&
		collision_line_tile() {
		my_state = unitState.attacking;
		fight_slot = target_unit.num_engaged;
		target_unit.num_engaged++;
		
		if (fight_slot == 0) {
			target_unit.fight_circle_angle = point_direction(
		}
	}
}