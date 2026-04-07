if !instance_exists(obj_RoomTransitionSEGAMenu) {
	var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu);
	instantiated.target_rm = rm_NewLanguage;
}