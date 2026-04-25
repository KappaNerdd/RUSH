display_set_gui_size(640, 360);

gpu_set_fog(true, c_black, 0, 1);
	draw_sprite_ext(sprite_index, image_index, 320 + 3, 180, changeScale, changeScale, 0, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, 320 - 3, 180, changeScale, changeScale, 0, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, 320, 180 + 3, changeScale, changeScale, 0, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, 320, 180 - 3, changeScale, changeScale, 0, c_white, image_alpha);
gpu_set_fog(false, c_black, 0, 1);

draw_sprite_ext(sprite_index, image_index, 320, 180, changeScale, changeScale, 0, c_white, image_alpha);