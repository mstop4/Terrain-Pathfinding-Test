/// @description attack other unit

if (instance_exists(target_unit)) {
	target_unit.hp -= attack_power;
	if (target_unit.hp <= 0) {
		instance_destroy(target_unit);
	}
	
	else {
		alarm[2] = attack_cooldown;
		if (ds_list_find_index(target_unit.attacker_list,id) == -1) 
			ds_list_add(target_unit.attacker_list,id);
	}
}

sprite_index = idle_spr;