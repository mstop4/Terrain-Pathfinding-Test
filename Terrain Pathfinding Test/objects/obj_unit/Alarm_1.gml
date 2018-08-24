/// @description attack other unit

if (instance_exists(target_unit)) {
	target_unit.hp -= attack_power;
	if (target_unit.hp <= 0) {
		instance_destroy(target_unit);
	}
	
	else {
		alarm[2] = attack_cooldown;
		ds_list_add(target_unit.attacker_list);
		with (target_unit)
			event_user(0);
	}
}

sprite_index = idle_spr;