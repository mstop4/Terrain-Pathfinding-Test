var vx = obj_MDP.view_x;
var vy = obj_MDP.view_y;
var vw = obj_MDP.view_width;
var vh = obj_MDP.view_height;

for (var i=0; i<obj_MCP.grid_width; i++) {
	for (var j=0; j<obj_MCP.grid_height; j++) {
		
		var xx = i*CELL_SIZE;
		var yy = j*CELL_SIZE;

		if (xx <= vx+vw && xx+CELL_SIZE >= vx &&
			yy <= vy+vh && yy+CELL_SIZE >= vy &&
			fog_grid[# i,j] == 1)
			draw_sprite(spr_fog1,0,i*CELL_SIZE,j*CELL_SIZE);
	}
}