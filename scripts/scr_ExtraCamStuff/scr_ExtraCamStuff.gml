function scr_SetCamFollow(_following = noone) {
	with(obj_CameraExtended) {
		if _following == noone {
			targetCutX = baseX;
			targetCutY = baseY;
			cutCamX = baseX;
			cutCamY = baseY;
		}
		
		following = _following;
	}
}

function scr_StopCamDir(_stop = "", _check = false) {
	switch(_stop) {
		case "h":
		case "H":
		case "hori":
		case "horizontal":
			with(obj_CameraExtended) {
				camHori = !_check;
			}
		break;
		
		case "v":
		case "V":
		case "verti":
		case "vertical":
			with(obj_CameraExtended) {
				camVerti = !_check;
			}
		break;
	}
}

function scr_StopCamMove(_resetTimer = 2, _timer = 10) {
	with(obj_CameraExtended) {
		resetTimer = _resetTimer;
		inactiveTimer = _timer;
	}
}

function scr_ChangeCamZoom(_sizeMult = 1, _speed = 0.1, _bars = false) {
	with(obj_CameraExtended) {
		ingameCamX = _sizeMult;
		ingameCamY = _sizeMult;
		barSpd = _speed;
		blackBars = _bars;
	}
}

function scr_CamFollowAngle(_follow = false) {
	with(obj_CameraExtended) {
		followAngle = _follow;
	}
}

function scr_CutsceneCamMove(_x = 0, _y = 0, _ease = Easings.QUAD_IO, _effect = 0.1) {
	with(obj_CameraExtended) {
		targetCutX = baseX + _x;
		targetCutY = baseY + _y;
		easeType = _ease;
		targetEffect = _effect;
	}
}

function scr_ScreenShake(_shakePower = 0.5, _shakeDuration = 10, _shakeHori = false, _shakeVerti = true) {
	with(obj_CameraExtended) {
		if global.ScreenShake {
			shakeValue = _shakePower;
			shakeTimer = _shakeDuration;
			shakeHori = _shakeHori;
			shakeVerti = _shakeVerti;
		}
	}
}