//Save player coordinates for respawn if no checkpoint or save point.
if respawnTimer > 0 {
	if instance_exists(obj_Player) {
		global.RespawnX = obj_Player.x;
		global.RespawnY = obj_Player.y;
	}
	
	respawnTimer -= 1;
}

if healthIndex < 2 {
	healthIndex += 1;
} else if healthIndex >= 2 {
	healthIndex = 0;
}

if obj_Player.playerHurt {
	healthHurt = true;
} else {
	healthHurt = false;
	healthHurtTimer = 5;
}

if healthHurt {
	if healthHurtTimer > 0 {
		healthHurtTimer -= 1;
	}
}

if global.Death {
	if !instance_exists(obj_RedDeath) {
		instance_create_depth(-100000, 0, 0, obj_RedDeath);
	}
}

//---Change based on character---///

scr_GetCharLives();


if global.DisableHUD or instance_exists(obj_RoomTransParent) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCardMinor) or instance_exists(obj_Textbox) or instance_exists(obj_CutsceneParent) or instance_exists(obj_LevelCard) or instance_exists(obj_ResultsCard) {
	yMove = lerp(yMove, 172, 0.1);
} else {
	yMove = lerp(yMove, 72, 0.1);
}

lifeScale = lerp(lifeScale, 1, 0.1);