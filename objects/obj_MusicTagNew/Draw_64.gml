display_set_gui_size(768, 432);

if !moved {
	movedTimer--;
	
	if moveX <= -390 {
		if movedTimer <= 180 {
			moveX = lerp(moveX, 0, 0.15);
		}
	} else {
		moveX = lerp(moveX, 0, 0.1);
	}
	
	if movedTimer <= 0 {
		moved = true;
	}
} else {
	moveX = lerp(moveX, -400, 0.1);
	
	if moveX <= -399.5 {
		instance_destroy();
	}
}

draw_sprite_ext(spr_MusTagBox, 0, moveX, 380, 11, 2.5, 0, c_white, 0.5);
draw_sprite_ext(spr_MusTagIcon, 0, moveX + 8, 380, 1, 1, 0, c_white, 1);

draw_set_valign(fa_middle);
	draw_text_ext(moveX + 28, 380, "\"" + scr_LocalText(string(songName)) + "\" - " + scr_LocalText(string(songCredits)), 24, 300);
draw_set_valign(fa_top);
