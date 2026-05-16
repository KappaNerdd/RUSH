display_set_gui_size(640, 360);

draw_set_halign(fa_right);
	var _prototype = "";
	var _version = " V0.3.0";

	if global.FPSOn {
		draw_text_transformed(640, 0, scr_LocalText("game_Demo") + string(_version), 0.5, 0.5, 0);
		draw_text_transformed(640, 12, "REAL FPS: " + string(fps_real), 0.5, 0.5, 0);
		draw_text_transformed(640, 24, "FPS: " + string(fps), 0.5, 0.5, 0);
	}
draw_set_halign(fa_left);

