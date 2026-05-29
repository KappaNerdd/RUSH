getCharacterControls();

if !dead {
	moveY = lerp(moveY, 108, 0.15);
	
	if scaleTimer > 0 {
		scaleTimer--;
	} else {
		scaleTimer = 30;
		scaled = !scaled;
	}
	
	if left_Key or right_Key {
		moveTimer--;
	} else {
		moveTimer = 1;
	}
	
	if moveTimer <= 0 {
		obj_SFXManager.menuPop = true;
		moveTimer = moveFrames;
		
		if right_Key {
			if chosen < array_length(socials) - 1 {
				chosen++;
			} else {
				chosen = 0;
			}
		}
		
		if left_Key {
			if chosen > 0 {
				chosen--;
			} else {
				chosen = array_length(socials) - 1;
			}
		}
	}
	
	if jump_Key or pause_Key {
		obj_SFXManager.homingLockOn = true;
		url_open(socials[chosen][0]);
	}
	
	if action_Key {
		obj_SFXManager.UNDERTALEBombFly = true;
		dead = true;
	}
} else {
	moveY = lerp(moveY, 296, 0.2);
	
	if moveY >= 295.5 {
		instance_destroy();
	}
}