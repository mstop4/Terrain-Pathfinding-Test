mp_potential_settings(20,5,3,true);
min_fps = 1000000;
max_fps = -100000;
track_fps = false;
alarm[0] = 60;

repeat(100) {
	instance_create_layer(320,180,"Instances",obj_test);
}