getCharacterControls();

if !skip && pause_Key && !instance_exists(obj_NameMakerNew) {
	skip = true;
	
	if instance_exists(obj_BlackFade) {
		instance_destroy(obj_BlackFade);
	}
	
	if instance_exists(obj_FadeIntroText) {
		instance_destroy(obj_FadeIntroText);
	}
	
	if !instance_exists(obj_FallinChar) {
		instance_create_depth(x, y, depth, obj_NameMakerNew);
			
		with(instance_create_depth(384, -64, depth, obj_FallinChar)) {
			xspd = 3;
			obj_SFXManager.breakSonic = true;
			dir = 1;
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
}