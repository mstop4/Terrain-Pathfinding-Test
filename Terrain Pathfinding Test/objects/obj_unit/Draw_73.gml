/*if (path_exists(my_path)) {
	draw_path(my_path,0,0,true);
}*/

if (selected)
	draw_sprite(spr_arrow,0,x,y);
	
draw_text(x,y,ds_list_size(attacker_list));