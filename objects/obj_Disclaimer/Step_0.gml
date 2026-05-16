getCharacterControls();

if !createOpt {
	if jump_Key {
		createOpt = true;
		instance_create_depth(-1000, 0, depth, obj_NewOptions);
	}
	
	if action_Key {
		createOpt = false;
	}
} else {
	if createOptTimer > 0 {
		createOptTimer--;
	} else {
		if !instance_exists(obj_NewOptions) {
			instance_destroy();
			
			if !instance_exists(obj_RoomTransParent) {
				scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_Splash1);
			}
		}
	}
}