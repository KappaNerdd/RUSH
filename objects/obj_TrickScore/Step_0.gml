visible = false;

/*comboY = lerp(comboY, 0, 0.25);

if obj_Player.rushTrickScore > extraScore {
	extraScore = obj_Player.rushTrickScore;
}

if trickScore < extraScore {
	trickScore = lerp(trickScore, extraScore, 0.3);
}

if comboTimer > 0 {
	comboTimer -= 1;
}

if (obj_Player.rushTrickCombo > 0 or obj_Player.railTrickUno or obj_Player.railTrickDos or obj_Player.railTrickTres) && flashingTimer > 0 {
	visible = true;
}

if comboTimer <= 20 && !global.SimplifyVFX {
	flashingTimer -= 1;
	
	if flashingTimer <= 0 {
		flashingTimer = 1;
		
		if visible {
			visible = false;
		} else {
			visible = true;
		}
	}
}

if extraScore >= 2000 && !global.SimplifyVFX {
	colorFlashTimer -= 1;
	
	if colorFlashTimer <= 0 {
		colorFlashTimer = 2;
		
		if colorFlash == c_white {
			colorFlash = global.fullRGB;
		} else {
			colorFlash = c_white;
		}
	}
} else {
	colorFlash = c_white;
	colorFlashTimer = 2;
}

if comboTimer <= 0 {
	if obj_Player.rushTrickCombo > 0 {
		comboTimer = 90;
	}
	
	visible = false;
	trickScore = 0;
	extraScore = 0;
	obj_Player.rushTrickScore = 0;
}

if obj_Player.vel >= 0 {
	hAlign = fa_left;
	comboX = 20;
} else {
	hAlign = fa_right;
	comboX = -20;
}