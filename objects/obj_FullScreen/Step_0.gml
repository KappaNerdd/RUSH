if global.FullScreen {
	window_set_fullscreen(true);
} else {
	window_set_fullscreen(false);
}

if keyboard_check_pressed(vk_f4) {
	global.FullScreen = !global.FullScreen;
}


//Also puttin' this here lol.
if keyboard_check(vk_escape) {
	if quittingTimer > 0 {
		quittingTimer -= 1;
	} else {
		game_end();
	}
	
	if quitAlpha < 1 {
		quitAlpha += 0.05;
	}
} else {
	quittingTimer = quittingFrames;
	
	if quitAlpha > 0 {
		quitAlpha -= 0.05;
	}
}