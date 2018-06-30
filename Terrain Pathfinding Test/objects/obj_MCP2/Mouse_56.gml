selecting = false;

with (obj_test2) {
	if (collision_rectangle(other.select_start_x,other.select_start_y,other.select_end_x,other.select_end_y,id,false,false)) {
		selected = true;
	}
	
	else
		selected = false;
}