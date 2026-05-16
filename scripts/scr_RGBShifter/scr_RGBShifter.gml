function scr_CreateRBG() {
	global.r = 255;
	global.g = 255;
	global.b = 255;
	
	global.realR = 255;
	global.realG = 255;
	global.realB = 255;
	
	global.fullRGB = 0;
}


function scr_ShiftRGB() {
	global.realR = lerp(global.realR, global.r, 0.05);
	global.realG = lerp(global.realG, global.g, 0.05);
	global.realB = lerp(global.realB, global.b, 0.05);
	
	if !global.MIND {
		if global.ColorCode {
			global.fullRGB = make_color_rgb(global.realR, global.realG, global.realB);
		} else {
			global.fullRGB = global.ColorBase[global.ChangeColor][0];
		}
	} else {
		global.r = 255;
		global.g = 255;
		global.b = 255;
		
		global.fullRGB = make_color_rgb(global.realR, global.realG, global.realB);
	}
}