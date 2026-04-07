display_set_gui_size(640, 360);

draw_sprite_ext(sprite_index, image_index, 320, 310, 8, 1, 0, c_white, 0.5);

draw_set_halign(fa_middle)
draw_set_valign(fa_center);
	draw_text_transformed(320, 310, scr_LocalText("game_Whoops"), 1, 1, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);