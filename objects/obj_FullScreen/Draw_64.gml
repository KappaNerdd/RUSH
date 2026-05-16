display_set_gui_size(768, 432);

if quittingTimer < 90 {
	var _quitting = scr_LocalText("game_Quitting");
	var _dots = "";

	if quittingTimer > 60 {
		_dots = ".";
	} else if quittingTimer > 30 {
		_dots = "..";
	} else if quittingTimer <= 30 {
		_dots = "...";
	}

	draw_text_transformed_color(0, 0, string(_quitting) + string(_dots), 0.5, 0.5, 0, c_white, c_white, global.fullRGB, global.fullRGB, quitAlpha);
}