/// @arg cell_x
/// @arg cell_y
/// @arg width
/// @arg height
/// @arg team

var _cell_x = argument[0];
var _cell_y = argument[1];
var _width = argument[2];
var _height = argument[3];
var _team = argument[4];

for (var i=_cell_y; i<_cell_y+_height; i++) {
	for (var j=_cell_x; j<_cell_x+_width; j++) {
		var u = instance_create_layer(i * CELL_SIZE + CELL_SIZE / 2,j * CELL_SIZE + CELL_SIZE / 2,"Instances",obj_unit);
		u.my_team = _team;
	}
}