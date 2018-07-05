if (my_state == unitState.moving) {
	my_state = unitState.settling;
	build_path(settle_x,settle_y);
}

else if (my_state == unitState.settling) {
	my_state = unitState.idle;
	path_speed = 0;
}