function scr_RoomTrans(_obj = obj_RoomTransitionSEGAMenu, _room) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(0, 0, -999999, _obj)) {
			target_rm = _room;
		}
	}
}

function scr_MainMenuTrans(_type) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu)) {
			target_rm = rm_MainMenuNew;
			type = _type;
		}
	}
}

function scr_LeaveTrans() {
	if !instance_exists(obj_RoomTransParent) {
		instance_create_depth(0, 0, 0, obj_LeaveGameTransSEGA);
	}
}