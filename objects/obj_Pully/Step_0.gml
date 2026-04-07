
if pulled {
	if y <= pullyBase.y - 38 {
		y = pullyBase.y - 38;
		
		if !pulledDone {
			for(var i = 0; i < array_length(pulledChars); i++) {
				var _chars = pulledChars[i];
			
				_chars.yspd = yspd / 1.45;
				_chars.rampRing = true;
				_chars.upLaunch = true;
				_chars.can_Move = true;
				_chars.can_MoveFULL = true;
				
				if giveScore {
					_chars.getScore = true;
					giveScore = false;
				}
				
				array_delete(pulledChars, i, 1);
			}
			
			scr_ScreenShake();
			scr_ControllerRumble();
			
			yspd = 0;
			pulledDone = true;
			obj_SFXManager.bump = true;
		}
		
		if pulledTimer > 0 {
			pulledTimer -= 1;
		}
		
		if pulledTimer <= 0 {
			pulled = false;
			pulledDone = false;
			pulledYspd = 0;
			
			pulledTimer = pulledFrames;
		}
	} else {
		pulledYspd += 0.1;
		yspd -= pulledYspd;
		y += yspd;
		
		for(var i = 0; i < array_length(pulledChars); i++) {
			var _chars = pulledChars[i];
			
			_chars.x = x;
			_chars.y = y + 47;
			_chars.can_Move = false;
			_chars.vel = 0;
			_chars.yspd = 0;
			_chars.can_MoveFULL = false;
			
			if _chars.leftFacer {
				if pullyBase.image_xscale == 1 {
					_chars.face_Left = false;
					_chars.sprite_index = _chars.sprPullyRight;
				} else {
					_chars.face_Left = true;
					_chars.sprite_index = _chars.sprPullyLeft;
				}
			} else {
				_chars.visXScale = pullyBase.image_xscale;
				_chars.sprite_index = _chars.sprPully
			}
		}
	}
} else {
	y = lerp(y, startY, 0.25);
}

if yspd <= -25 {
	yspd = -25;
}