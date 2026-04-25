if affectChar != noone && !instance_exists(obj_CutsceneParent) {
	if !affectChar.ground && affectChar.can_Move && affectChar.yspd > 4 && affectChar.playerHurt && !global.Death {
		if affectChar.jump_Key {
			obj_SFXManager.jumpSound = true;
			affectChar.yspd = -affectChar.normalJspd;
			affectChar.playerHurt = false;
			affectChar.realJumping = true;
		}
	}
}