display_set_gui_size(320, 180);

if blackBarsPos > 0 {
	draw_sprite_ext(spr_CinematicBar, 0, 0, bar1 + (32 * blackBarsPos), 320, -32 * blackBarsPos, 0, c_white, 1);
	draw_sprite_ext(spr_CinematicBar, 0, 0, bar2 - (32 * blackBarsPos), 320, 32 * blackBarsPos, 0, c_white, 1);
}

