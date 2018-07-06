/// @desc encode_coords
/// @arg x
/// @arg y

var _x = argument[0];
var _y = argument[1];

return ((_y << 12) + _x);