x += x_speed;
y += y_speed;

if (get_tile_index_at(obj_MCP.ter_tilemap,x,y) == 1)
	instance_destroy();