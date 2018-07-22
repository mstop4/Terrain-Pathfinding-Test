/// @arg instance_id
/// @arg tilemap
/// @arg x_offset
/// @arg y_offset

var _id = argument[0];
var _tm = argument[1];
var _xo = argument[2];
var _yo = argument[3];

return	tilemap_get_at_pixel(_tm,_id.bbox_left+_xo,_id.bbox_top+_yo) ||
		tilemap_get_at_pixel(_tm,_id.bbox_right+_xo,_id.bbox_top+_yo) ||
		tilemap_get_at_pixel(_tm,_id.bbox_left+_xo,_id.bbox_bottom+_yo) ||
		tilemap_get_at_pixel(_tm,_id.bbox_right+_xo,_id.bbox_bottom+_yo);