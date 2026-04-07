getCharacterControls();

if !nameChosen {
	charAlpha = lerp(charAlpha, 1, 0.15);
	nameY = lerp(nameY, 0, 0.05);
	nameAngle = 0;
	
	if nameScale > 1 {
		nameScale -= 0.01;
	}
	
	if left_Key or right_Key or up_Key or down_Key {
		changeTimer--;
		
		if changeTimer <= 0 {
			obj_SFXManager.menuPop = true;
			charScale = 1.5;
			changeTimer = changeFrames;
			
			if left_Key {
				if nameChar > 0 {
					nameChar--;
				} else {
					nameChar = array_length(charArray[nameBar][nameColumn]) - 1;
				}
			}
			
			if right_Key {
				if nameChar < array_length(charArray[nameBar][nameColumn]) - 1 {
					nameChar++;
				} else {
					nameChar = 0;
				}
			}
			
			if up_Key {
				if nameColumn > 0 {
					nameColumn--;
				} else {
					nameColumn = array_length(charArray[nameBar]) - 1;
				}
			}
			
			if down_Key {
				if nameColumn < array_length(charArray[nameBar]) - 1 {
					nameColumn++;
				} else {
					nameColumn = 0;
				}
			}
		}
	} else {
		changeTimer = 1;
	}
	
	if jump_Key {
		if string_length(global.PlayerName) < 15 {
			obj_SFXManager.homingLockOn = true;
			global.PlayerName = global.PlayerName + string(charArray[nameBar][nameColumn][nameChar]);
			charScale = 1;
		} else {
			obj_SFXManager.menuCancel = true;
		}
	}
	
	if action_Key {
		if string_length(global.PlayerName) > 0 {
			obj_SFXManager.balloonPop = true;
			global.PlayerName = string_delete(global.PlayerName, string_length(global.PlayerName), 1);
		}
	}
	
	if action1_Key {
		if string_length(global.PlayerName) < 15 {
			obj_SFXManager.homingLockOn = true;
			global.PlayerName = global.PlayerName + " ";
		}
	}
	
	if action2_Key {
		if nameBar < array_length(charArray) - 1 {
			nameBar++;
		} else {
			nameBar = 0;
		}
		
		rightArrow = true;
		
		obj_SFXManager.clench = true;
	}
	
	if action4_Key {
		if nameBar > 0 {
			nameBar--;
		} else {
			nameBar = array_length(charArray) - 1;
		}
		
		leftArrow = true;
		
		obj_SFXManager.clench = true;
	}
	
	if pause_Key {
		if string_length(global.PlayerName) > 0 {
			obj_SFXManager.menuConfirm = true;
			nameChosen = true;
		} else {
			obj_SFXManager.menuCancel = true;
		}
	}
} else {
	charAlpha = lerp(charAlpha, 0, 0.15);
	nameY = lerp(nameY, 150, 0.05);
	
	if !global.SimplifyVFX {
		nameAngle = random_range(-1, 1);
	}
	
	if nameScale < 2 {
		nameScale += 0.005;
	}
	
	if !nameConfirmed {
		if jump_Key or pause_Key {
			if confirmName {
				nameConfirmed = true;
				obj_NameFallinKappa.yspd = -2;
			} else {
				obj_SFXManager.menuCancel = true;
			}
		}
	
		if action_Key {
			obj_SFXManager.homingLockOn = true;
			nameChosen = false;
		}
	} else {
		if !instance_exists(obj_NameWhiteTrans) {
			instance_create_depth(-1000, 0, 0, obj_NameWhiteTrans);
		}
		
		obj_NameFallinKappa.yspd += 0.025;
		obj_HeadBlockBG.extraY += 0.035;
	}
}


charScale = lerp(charScale, 1.75, 0.1);

if nameChar > array_length(charArray[nameBar][nameColumn]) - 1 {
	nameChar = array_length(charArray[nameBar][nameColumn]) - 1;
}

if nameColumn > array_length(charArray[nameBar]) - 1 {
	nameColumn = array_length(charArray[nameBar]) - 1;
}

if visibleTimer > 0 {
	visibleTimer -= 1 / 15;
} else {
	visibleTimer = 2;
	visibleNameUnder = !visibleNameUnder;
}

charX = lerp(charX, -768 * nameBar, 0.2);

if rightArrow {
	rightFrames += 1 / 2;
	
	if rightFrames >= 5 {
		rightFrames = 0;
		rightArrow = false;
	}
}

if leftArrow {
	leftFrames += 1 / 2;
	
	if leftFrames >= 5 {
		leftFrames = 0;
		leftArrow = false;
	}
}