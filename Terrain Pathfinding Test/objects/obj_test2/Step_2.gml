var push_mag = point_distance(0,0,push_vector_x,push_vector_y);
push_vector_x = push_vector_x / push_mag * push_force;
push_vector_y = push_vector_y / push_mag * push_force;

if (push_vector_x != 0) {
	var can_push = true;
	var tile_info, tile_index;
	
	if (push_vector_x > 0) {
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_right+push_vector_x,bbox_top);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
			
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_right+push_vector_x,bbox_bottom);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
	}
			
	else {
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_left+push_vector_x,bbox_top);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
			
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_left+push_vector_x,bbox_bottom);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
	}		

	if (can_push) {
		x += push_vector_x;
	}
}

if (push_vector_y != 0) {
	var can_push = true;
	var tile_info, tile_index;
	
	if (push_vector_y > 0) {
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_left,bbox_bottom+push_vector_y);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
			
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_right,bbox_bottom+push_vector_y);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
	}
			
	else {
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_left,bbox_top+push_vector_y);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
			
		tile_info = tilemap_get_at_pixel(obj_MCP2.ter_tilemap,bbox_right,bbox_top+push_vector_y);
		tile_index = tile_get_index(tile_info);
		if (tile_index == 1)
			can_push = false;
	}		

	if (can_push) {
		y += push_vector_y;
	}
}