if instance_exists(obj_Player) {
	with(obj_Player) {
		if place_meeting(x, y, obj_TextboxColl) or place_meeting(x, y, obj_LevelDoorHead) {
			if can_MoveFULL && vel == 0 && ground && !stomped && !specialIdle {
				other.image_alpha = 1;
			} else {
				other.image_alpha = 0.5;
			}
		} else {
			other.image_alpha = 0;
		}
	}
	
	x = obj_Player.x - 20;
	y = obj_Player.y - 70;
}

sprite_index = obj_CustomAct3KeySpeed.sprite_index;
image_index = obj_CustomAct3KeySpeed.image_index;
