getCharacterControls();

if !changeText {
	if textAlpha < 1 {
		textAlpha += 0.035;
	}
	
	if jump_Key && textAlpha > 0.75 {
		changeText = true;
	}
} else {
	if textAlpha > 0 {
		if chosenText < array_length(textArray) - 1 {
			textAlpha -= 0.035;
		} else {
			textAlpha -= 0.01;
		}
	} else {
		changeText = false;
		
		if chosenText < array_length(textArray) - 1 {
			chosenText++;
		} else {
			if createName {
				instance_create_depth(x, y, depth, obj_NameMakerNew);
			}
			
			if createChars {
				with(instance_create_depth(384, -64, depth, obj_FallinChar)) {
					xspd = 3;
					obj_SFXManager.breakSonic = true;
					dir = 1;
					createName = true;
					scr_MusicTag();
				}
				
				with(instance_create_depth(384, -64, depth, obj_FallinChar)) {
					xspd = -3;
					charAngle = 180;
					sprite_index = spr_LuciferCDTwirlHead;
					image_speed = -1;
					image_index = 1;
					obj_SFXManager.breakBlaze = true;
					dir = -1;
					createName = false;
				}
				
			}
			
			if lowTaperFade {
				obj_BlackFade.removeFade = true;
			}
			
			instance_destroy();
			
			if instance_exists(obj_FallinChar) {
				if obj_FallinChar.leave {
					obj_FallinChar.yspd = -3;
				}
			}
		}
	}
}

if !global.SimplifyVFX {
	if glow {
		glowAlpha += 0.001;
	
		if glowAlpha >= 0.2 {
			glow = false;
		}
	} else {
		glowAlpha -= 0.001;
	
		if glowAlpha <= 0.1 {
			glow = true;
		}
	}
} else {
	glowAlpha = 0.1;
}