image_angle = direction;

switch (my_state) {
	case unitState.attacking:
		sprite_index = spr_test_attack;
		break;
		
	default:
		sprite_index = spr_test;
}