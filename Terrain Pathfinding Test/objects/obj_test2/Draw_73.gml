if (path_exists(my_path)) {
	draw_path(my_path,0,0,true);
	//draw_text(x,y,string(path_speed));
}

if (selected)
	draw_arrow(x,y-16,x,y,4);