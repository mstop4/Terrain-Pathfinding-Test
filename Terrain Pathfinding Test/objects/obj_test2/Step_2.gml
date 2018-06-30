var push_mag = point_distance(0,0,push_vector_x,push_vector_y);
push_vector_x = push_vector_x / push_mag * push_force;
push_vector_y = push_vector_y / push_mag * push_force;

if (push_vector_x != 0 && !place_meeting(x+push_vector_x,y,obj_wall)) {
	x += push_vector_x;
}

if (push_vector_y != 0 && !place_meeting(x,y+push_vector_y,obj_wall)) {
	y += push_vector_y;
}
