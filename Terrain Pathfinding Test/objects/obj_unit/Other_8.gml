if (!is_attacking && my_state == unitState.moving) {
	my_state = unitState.idle;
	path_speed = 0;
}