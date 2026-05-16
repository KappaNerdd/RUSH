/*scr_ShiftRGB();

var _charCheck = 0;

if room == rm_CharSelect {
	_charCheck = global.SelectedPlayer;
	
	if _charCheck == 0 {
		global.r = 255;
		global.g = 255;
		global.b = 255;
	} else if _charCheck == 1 {
		global.r = 010;
		global.g = 036;
		global.b = 203;
	} else if _charCheck == 2 {
		global.r = 064;
		global.g = 245;
		global.b = 255;
	} else if _charCheck == 3 {
		global.r = 114;
		global.g = 70;
		global.b = 217;
	} else if _charCheck == 4 {
		global.r = 220;
		global.g = 67;
		global.b = 30;
	} else if _charCheck == 5 {
		global.r = 114;
		global.g = 0;
		global.b = 255;
	} else if _charCheck == 6 {
		global.r = 255;
		global.g = 132;
		global.b = 25;
	} else if _charCheck == 7 {
		global.r = 143;
		global.g = 0;
		global.b = 0;
	} else if _charCheck == 8 {
		global.r = 198;
		global.g = 25;
		global.b = 64;
	} else if _charCheck == 9 {
		global.r = 207;
		global.g = 46;
		global.b = 87;
	} else if _charCheck == 10 {
		global.r = 000;
		global.g = 200;
		global.b = 248;
	} else if _charCheck == 11 {
		global.r = 46;
		global.g = 36;
		global.b = 52;
	} else if _charCheck == 12 {
		global.r = 255;
		global.g = 189;
		global.b = 000;
	} else if _charCheck == 13 {
		global.r = 241;
		global.g = 139;
		global.b = 176;
	} else if _charCheck == 14 {
		if changeColTimer > 0 {
			changeColTimer -= 1;
		}
		
		if changeColTimer <= 0 {
			changeColTimer = changeColFrames;
			
			if changeColBlue {
				changeColBlue = false;
			} else {
				changeColBlue = true;
			}
		}
		
		if changeColBlue {
			global.r = 60;
			global.g = 0;
			global.b = 255;
		} else {
			global.r = 129;
			global.g = 230;
			global.b = 29;
		}
	} else if _charCheck == 15 {
		global.r = 172;
		global.g = 50;
		global.b = 50;
	} else if _charCheck == 16 {
		global.r = 255;
		global.g = 242;
		global.b = 0;
	}
} else {
	_charCheck = global.PlayerChar;
	
	if _charCheck == 0 {
		global.r = 255;
		global.g = 255;
		global.b = 255;
	} else if _charCheck == 1 {
		global.r = 010;
		global.g = 036;
		global.b = 203;
	} else if _charCheck == 2 {
		global.r = 064;
		global.g = 245;
		global.b = 255;
	} else if _charCheck == 3 {
		global.r = 114;
		global.g = 70;
		global.b = 217;
	} else if _charCheck == 4 {
		global.r = 220;
		global.g = 67;
		global.b = 30;
	} else if _charCheck == 5 {
		global.r = 114;
		global.g = 0;
		global.b = 255;
	} else if _charCheck == 6 {
		global.r = 255;
		global.g = 132;
		global.b = 25;
	} else if _charCheck == 7 {
		global.r = 143;
		global.g = 0;
		global.b = 0;
	} else if _charCheck == 8 {
		global.r = 198;
		global.g = 25;
		global.b = 64;
	} else if _charCheck == 9 {
		global.r = 207;
		global.g = 46;
		global.b = 87;
	} else if _charCheck == 10 {
		global.r = 000;
		global.g = 200;
		global.b = 248;
	} else if _charCheck == 11 {
		global.r = 46;
		global.g = 36;
		global.b = 52;
	} else if _charCheck == 12 {
		global.r = 255;
		global.g = 189;
		global.b = 000;
	} else if _charCheck == 13 {
		global.r = 241;
		global.g = 139;
		global.b = 176;
	} else if _charCheck == 14 {
		if changeColTimer > 0 {
			changeColTimer -= 1;
		}
		
		if changeColTimer <= 0 {
			changeColTimer = changeColFrames;
			
			if changeColBlue {
				changeColBlue = false;
			} else {
				changeColBlue = true;
			}
		}
		
		if changeColBlue {
			global.r = 60;
			global.g = 0;
			global.b = 255;
		} else {
			global.r = 129;
			global.g = 230;
			global.b = 29;
		}
	} else if _charCheck == 15 {
		global.r = 172;
		global.g = 50;
		global.b = 50;
	} else if _charCheck == 16 {
		global.r = 255;
		global.g = 242;
		global.b = 0;
	}
}*/

if !global.MIND {
	global.r = global.PlayerSelection[global.PlayerChar][5][0];
	global.g = global.PlayerSelection[global.PlayerChar][5][1];
	global.b = global.PlayerSelection[global.PlayerChar][5][2];
}

scr_ShiftRGB();