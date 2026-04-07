display_set_gui_size(640, 360);

draw_sprite_ext(sprite_index, image_index, 320, 180, scaleChange, scaleChange, 0, c_white, normAlph);

draw_set_halign(fa_center);
	draw_text_transformed_color(320, 240, scr_LocalText("I might swerve-"), scaleChange, scaleChange, 0, c_white, c_white, c_white, c_white, normAlph);
draw_set_halign(fa_left);

if !chosen {
	draw_set_halign(fa_center);
		draw_text(320, 20, scr_LocalText("opt_ChooseLang"));
		draw_text_transformed(320, 50, scr_LocalText("opt_AskOnce"), 0.5, 0.5, 0);
	draw_set_halign(fa_left);
	
	draw_sprite_ext(spr_CharSelectArrow, rightFrames, 420, 180, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_CharSelectArrow, leftFrames, 220, 180, -1, 1, 0, c_white, 1);
	
	draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, 20, 340, 1, 1, 0, c_white, 1);
	draw_text(80, 328, scr_LocalText("fs_Select"));
}

draw_sprite_ext(spr_WhiteTrans, 0, 0, 0, 20, 12, 0, c_white, flashAlpha);

