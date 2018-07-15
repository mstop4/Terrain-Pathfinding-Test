if (is_attacking) {
	if (my_state == unitState.moving) {
		if (point_distance(x,y,target_unit.x,target_unit.y) < attack_range) {
			unit_begin_attack(id,target_unit);
		}
	}
	
	else if (my_state == unitState.attacking) {
	
	}
}