display_set_gui_size(768, 432);

if !skip && !instance_exists(obj_NameMakerNew) {
	draw_set_halign(fa_right);
		draw_text(750, 400, scr_LocalText("freeplay_ChooseChar1") + " " + obj_CustomPauseKeySpeed.keyText + " " + scr_LocalText("game_ToSkip"));
	draw_set_halign(fa_left);
}