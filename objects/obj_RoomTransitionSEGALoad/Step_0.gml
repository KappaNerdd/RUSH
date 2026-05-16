if !transComplete {
	if colorRed < 255 {
	    colorRed += 20 / division;
	}

	if colorGreen < 255 && colorRed > 255 / 2.5 {
	    colorGreen += 20 / division;
	}

	if colorBlue < 255 && colorGreen > 255 / 2.5 {
		colorBlue += 20 / division;
	}

	//End the transition:
	if colorBlue == 255 {
	    if image_alpha < 1 {
	       image_alpha += 0.20 / division;
	    } else {
			if !transComplete {
				transComplete = true;
				room_goto(target_rm);
			}
		}
	}
	
	if image_alpha >= 0.9 {
		global.PlayerChar = global.statData[0].player_Char;
	}
} else {
	if image_alpha >= 0.99 {
		global.PlayerChar = global.statData[0].player_Char;
		
		if instance_exists(obj_Player) {
			obj_Player.can_Move = true;
			obj_Player.can_MoveFULL = true;
		}
		
		var _dir = working_directory + "/saves/" + string(global.saveFile) + "/";
			
		if file_exists(_dir + string(global.MainDataFile) + string(global.saveFile) + ".sav") {
			if instance_exists(obj_Player) {
				if !spawnPlayer {
					obj_Player.x = global.statData[0].save_x;
					obj_Player.y = global.statData[0].save_y;
					spawnPlayer = true;
				}
			}
		}
	}
	
	if colorRed > 0 && colorGreen <= 0 {
	    colorRed -= 20 / division;
	}

	if colorGreen > 0 && colorBlue <= 0 {
	    colorGreen -= 20 / division;
	}

	if colorBlue > 0 {
		colorBlue -= 20 / division;
	}
	
	if colorRed == 0 {
		if image_alpha > 0 {
			image_alpha -= 0.20 / division;
		}
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}