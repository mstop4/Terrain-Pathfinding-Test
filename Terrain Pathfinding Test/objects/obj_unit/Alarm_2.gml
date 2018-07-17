/// @desc attack
if (instance_exists(target_unit)) {
	direction = point_direction(x,y,target_unit.x,target_unit.y);
	alarm[1] = attack_startup;
	sprite_index = attack_spr;
}