var snap_x = (mouse_x div CELL_SIZE) * CELL_SIZE + CELL_SIZE / 2;
var snap_y = (mouse_y div CELL_SIZE) * CELL_SIZE + CELL_SIZE / 2;

with (obj_unit) {
	build_path(snap_x,snap_y);
}