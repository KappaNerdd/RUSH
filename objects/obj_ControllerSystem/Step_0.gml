if p1Timer > 0 {
	p1Timer--;
} else {
	p1Timer = 0;
	
	if textAlphaP1 > 0 {
		textAlphaP1 -= 0.01;
	}
}

if p2Timer > 0 {
	p2Timer--;
} else {
	p2Timer = 0;
	
	if textAlphaP2 > 0 {
		textAlphaP2 -= 0.01;
	}
}

if p3Timer > 0 {
	p3Timer--;
} else {
	p3Timer = 0;
	
	if textAlphaP3 > 0 {
		textAlphaP3 -= 0.01;
	}
}



if global.ControllerOnly {
	if !gamepad_is_connected(global.Player1Con) {
		if !instance_exists(obj_ControllerDC) {
			instance_create_depth(x, y, depth, obj_ControllerDC);
		}
	}
}