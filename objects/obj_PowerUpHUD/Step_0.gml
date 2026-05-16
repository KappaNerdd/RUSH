if hudTimer > 0 {
	hudTimer -= 1;
}

if !global.SimplifyVFX {
	if hudTimer <= 60 {
		if visibleTimer > 0 {
			visibleTimer -= 1;
		} else {
			if !global.DisableHUD {
				visible = !visible;
			}
		}
	}
}

if hudTimer <= 0 {
	instance_destroy();
} else {
	if hudTimer > 60 {
		visible = !global.DisableHUD;
	}
}
