function scr_Approach(_current, _target, _amount) {
	if _current < _target {
		return min(_current + _amount, _target);
	} else {
		return max(_current - _amount, _target);
	}
}

function scr_DisableHUD(_disable = false) {
	global.DisableHUD = _disable;
}

function scr_ControllerRumble(_rumblePower = 0.1, _rumbleTimer = 10) {
	with(obj_ConRumbleSystem) {
		if global.ConRumble {
			rumblePower = _rumblePower;
			rumbleTimer = _rumbleTimer;
		}
	}
}

function scr_CharSensX(_num, _num2) {
	return angleCos * _num + angleSin * _num2;
}

function scr_CharSensY(_num, _num2) {
	return angleSin * _num + angleCos * _num2;
}