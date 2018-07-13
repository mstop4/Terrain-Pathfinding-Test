/// @arg instance_id
/// @arg tilemap

var _id = argument[0];
var _tm = argument[1];

return	tilemap_get_at_pixel(_tm,_id.bbox_left,_id.bbox_top) ||
		tilemap_get_at_pixel(_tm,_id.bbox_right,_id.bbox_top) ||
		tilemap_get_at_pixel(_tm,_id.bbox_left,_id.bbox_bottom) ||
		tilemap_get_at_pixel(_tm,_id.bbox_right,_id.bbox_bottom);