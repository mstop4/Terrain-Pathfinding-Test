if (my_state == unitState.moving) {
	my_state = unitState.settling;
	path_start(my_settle_path,my_speed,path_action_stop,true);
	
}

else if (my_state == unitState.settling) {
	my_state = unitState.idle;
	path_speed = 0;
}