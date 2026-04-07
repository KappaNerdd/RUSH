getCharacterControls();

if !chosen {
	if left_Key or right_Key {
		if chooseTimer > 0 {
			chooseTimer--;
		} else {
			chooseTimer = chooseFrames;
			obj_SFXManager.homingLockOn = true;
			
			if left_Key {
				if langCheck > 0 {
					langCheck--;
				} else {
					langCheck = array_length(langArray) - 1;
				}
				
				leftArrow = true;
				leftFrames = 0;
			}
			
			if right_Key {
				if langCheck < array_length(langArray) - 1 {
					langCheck++;
				} else {
					langCheck = 0;
				}
				
				rightArrow = true;
				rightFrames = 0;
			}
		}
	} else {
		chooseTimer = 1;
	}
	
	if rightArrow {
		rightFrames += 1 / 3;
			
		if rightFrames >= 5 {
			rightFrames = 0;
			rightArrow = false;
		}
	}
		
	if leftArrow {
		leftFrames += 1 / 3;
			
		if leftFrames >= 5 {
			leftFrames = 0;
			leftArrow = false;
		}
	}
	
	if jump_Key {
		obj_SFXManager.menuPop = true;
		chosen = true;
		flashAlpha = 0.5;
		
		var _file = file_text_open_write("ARLANGCHECK.sav");
		file_text_write_string(_file, "\"'Boutta hit this mf with the Max & Ruby.\" - Dotodoya");
		file_text_close(_file);
		
		save_options();
	}
} else {
	flashAlpha = lerp(flashAlpha, 0, 0.05);
	scaleChange -= 0.001;
	
	fadeTimer--;
	
	if fadeTimer <= 0 {
		normAlph -= 0.01;
		
		if normAlph <= 0 {
			if !instance_exists(obj_RoomTransParent) {
				with(instance_create_depth(-1000, 0, depth, obj_RoomTransitionSEGAMenu)) {
					target_rm = rm_FileSelectNew;
				}
			}
		}
	}
}

global.Language = langCheck + 1;
sprite_index = langArray[langCheck][1 - chosen];