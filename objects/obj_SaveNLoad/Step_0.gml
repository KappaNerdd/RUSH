/*if keyboard_check_pressed(ord("Q")) {		
	save_game(0);
}

if keyboard_check_pressed(ord("3")) {
	save_game(1);
}

if keyboard_check_pressed(ord("4")) {
	save_game(2);
}

if keyboard_check_pressed(ord("5")) {
	save_game(3);
}
	
if keyboard_check_pressed(ord("8")) {
	load_game(1);
}

if keyboard_check_pressed(ord("9")) {
	load_game(2);
}

if keyboard_check_pressed(ord("0")) {
	load_game(3);
}*/

//Screenshot Function
if keyboard_check_pressed(vk_f3) {
	instance_create_depth(x, y, depth, obj_CameraFlash);
	obj_SFXManager.funkinScreenshot = true;
	screen_save(working_directory + "screenshots/Screen_SaveFile" + string(global.saveFile) + "_" + string(global.PlayerName) + "_M" + string(current_month) + "_D" + string(current_day) + "_Y" + string(current_year) + ".png");
}

//Global Timer
global.PlayerTimeSeconds += 1 / 60;


if global.PlayerTimeSeconds < 60 && global.PlayerTimeSeconds > 59.9 {
	global.PlayerTimeSeconds = 0;
	global.PlayerTimeMinutes += 1;
}

if global.PlayerTimeMinutes == 60 {
	global.PlayerTimeMinutes = 0;
	global.PlayerTimeHours += 1;
}


//Death

//Puttin' this here instead of makin' a separate object.
if global.Death {
	if !global.Freeplay {
		if global.PlayerExtraLives != 0 {
			if global.DeathCountdown > 0 && !instance_exists(obj_NewPauseMenu) {
				global.DeathCountdown -= 1;
			}
		} else if global.PlayerExtraLives == 0 {
			if global.GameOverCountdown > 0 && !instance_exists(obj_NewPauseMenu) {
				global.GameOverCountdown -= 1;
			}
		}
	} else {
		if global.DeathCountdown > 0 && !instance_exists(obj_NewPauseMenu) {
			global.DeathCountdown -= 1;
		}
	}
} else {
	global.DeathCountdown = 120;
	global.GameOverCountdown = 180;
}

//If you have extra lives
if global.DeathCountdown <= 0 && !instance_exists(obj_DeathCharMessages) && !instance_exists(obj_NewPauseMenu) {
	instance_create_depth(x, y, depth, obj_DeathCharMessages);
}


//If you DON'T have extra lives
if global.GameOverCountdown <= 0 && !instance_exists(obj_GameOverTrans) && !instance_exists(obj_NewPauseMenu) {
	instance_create_depth(x, y, depth, obj_GameOverTrans);
}
