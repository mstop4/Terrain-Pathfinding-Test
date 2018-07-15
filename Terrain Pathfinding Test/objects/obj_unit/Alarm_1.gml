/// @description attac

if (instance_exists(target_unit)) {
	target_unit.hp -= attack_power;
	if (target_unit.hp <= 0) {
		instance_destroy(target_unit);
	}
	
	else {
		alarm[2] = attack_cooldown;
	}
}

sprite_index = idle_spr;