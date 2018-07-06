var n = encode_coords(2,2);
show_debug_message(n);
var m = decode_coords(n);
show_debug_message(string(m[0]) + ", " + string(m[1]));