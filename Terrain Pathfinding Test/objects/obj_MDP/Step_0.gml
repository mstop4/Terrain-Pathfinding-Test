var view_x = camera_get_view_x(view_camera);
var view_y = camera_get_view_y(view_camera);
var can_scroll = false;

if (device_mouse_x_to_gui(0) <= scroll_border) {
	view_x = max(0,view_x-scroll_speed);
	can_scroll = true;
}

else if (device_mouse_x_to_gui(0) >= view_width-scroll_border) {
	view_x = min(room_width-view_width,view_x+scroll_speed);
	can_scroll = true;
}

if (device_mouse_y_to_gui(0) <= scroll_border) {
	view_y = max(0,view_y-scroll_speed);
	can_scroll = true;
}

else if (device_mouse_y_to_gui(0) >= view_height-scroll_border) {
	view_y = min(room_height-view_height,view_y+scroll_speed);
	can_scroll = true;
}

if (can_scroll) {
	scroll_speed = min(scroll_speed + scroll_accel, max_scroll_speed);
	camera_set_view_pos(view_camera,view_x,view_y);
}

else
	scroll_speed = 0;