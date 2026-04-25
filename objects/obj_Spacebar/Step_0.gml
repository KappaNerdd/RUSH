if instance_exists(obj_Player) {
	mask_index = obj_Player.mask_index;
	x = obj_Player.x;
	y = obj_Player.y;
	
	if instance_exists(obj_Player) && (place_meeting(x, y, obj_TextboxColl) or place_meeting(x, y, obj_LevelDoorHead)) && (obj_Player.can_MoveFULL) && obj_Player.ground == true && obj_Player.vel == 0 && obj_Player.stomped == false && obj_Player.specialIdle == false {
		opacity = 1;
	} else if instance_exists(obj_Player) && (place_meeting(x, y, obj_TextboxColl) or place_meeting(x, y, obj_LevelDoorHead)) && (obj_Player.can_MoveFULL == false or obj_Player.ground == false or obj_Player.vel != 0 or obj_Player.stomped == true or obj_Player.specialIdle == true) {
		opacity = 0.5;
	} else {
		opacity = 0;
	}

	image_alpha = opacity;
} else {
	image_xscale = 1;
	image_yscale = 1;
	image_alpha = 1;
}

if instance_number(obj_Spacebar) > 1 {
	instance_destroy();
}

sprite_index = obj_CustomAct3KeySpeed.sprite_index;
image_index = obj_CustomAct3KeySpeed.image_index;