/// @desc encode_coords
/// @arg encoded_coords

var _ec = argument[0];
var _y = _ec >> 12;
var _x = _ec & $FFF;

return [_x, _y];