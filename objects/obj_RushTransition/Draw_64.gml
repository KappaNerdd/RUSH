display_set_gui_size(320, 180);

draw_sprite_ext(sprite_index, image_index, rushX, 0, 6, 9, 0, image_blend, 1);

if speedStage or restart {
	var _col = c_white;
	
	if global.MIND or global.PlayerChar == 0 {
		_col = c_black;
	}
	
	draw_sprite_ext(spr_WhiteTrans, 0, 0, 0, 10, 6, 0, _col, speedAlpha);
}

