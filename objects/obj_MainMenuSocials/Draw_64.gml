display_set_gui_size(384, 216);

draw_sprite_ext(spr_TextboxULTRAKILL, 0, 192, moveY, 4, 1, 0, c_white, 0.75);

draw_set_halign(fa_center);
	draw_text_transformed(192, moveY - 30, scr_LocalText(socials[chosen][1]), 1, 1, 0);
draw_set_halign(fa_left);

for(var i = 0; i < array_length(socials); i++) {
	var _gapX = 50;
	
	draw_sprite_ext(sprite_index, i, 145 + (_gapX * i), moveY + 10, 1, 1, 0, c_white, 1);
	
	if chosen == i {
		draw_sprite_ext(sprite_index, 4, 145 + (_gapX * i), moveY + 10, 1 + (0.075 * scaled), 1 + (0.075 * scaled), 0, global.fullRGB, 1);
	}
}