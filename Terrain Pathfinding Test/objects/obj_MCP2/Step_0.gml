if (track_fps) {
	if (fps_real > max_fps)
		max_fps = fps_real;
	if (fps_real < min_fps)
		min_fps = fps_real;
}

if (selecting) {
	select_end_x = mouse_x;
	select_end_y = mouse_y;
}