if (!is_attacking) {
	if (my_state == unitState.moving) {
		my_state = unitState.idle;
		alarm[3] = 30;
	}
}

else {
	my_state = unitState.attacking_delay;
	alarm[4] = 10;
}

path_speed = 0;