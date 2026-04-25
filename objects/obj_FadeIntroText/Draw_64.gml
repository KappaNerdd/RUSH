display_set_gui_size(640, 360);

var _x = 320;
var _y = 180;

draw_sprite_ext(spr_TextboxULTRAKILL, 0, 320, 180, 8, 1.5, 0, c_white, 0.5 * textAlpha);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
	draw_text_ext_transformed_color(_x, _y, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha);
	
	gpu_set_fog(true, c_white, 0, 1);
		draw_text_ext_transformed_color(_x - 2, _y, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha / 2);
		draw_text_ext_transformed_color(_x + 2, _y, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha / 2);
		draw_text_ext_transformed_color(_x, _y - 2, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha / 2);
		draw_text_ext_transformed_color(_x, _y + 2, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha / 2);
		
		draw_text_ext_transformed_color(_x - 1, _y, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha);
		draw_text_ext_transformed_color(_x + 1, _y, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha);
		draw_text_ext_transformed_color(_x, _y - 1, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha);
		draw_text_ext_transformed_color(_x, _y + 1, scr_DialogueText(string(textArray[chosenText])), 20, 450, 1, 1, 0, c_white, c_white, c_white, c_white, textAlpha * glowAlpha);
	gpu_set_fog(false, c_black, 0, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);