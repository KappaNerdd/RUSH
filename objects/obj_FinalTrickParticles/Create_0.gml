if !global.MIND {
	sprite_index = global.PlayerSelection[global.PlayerChar][19][0];
} else {
	sprite_index = global.PlayerSelection[0][19][0];
}

scale = 0.5;

depth = obj_Player.depth + 1;

image_alpha = 1;

image_index = 0;

image_speed = 0;