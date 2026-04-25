if global.countUp {
	global.seconds += 1 / 60;
	image_speed = 1;
} else {
	image_speed = 0;
}

inGameScore = lerp(inGameScore, global.GameScore, 0.25);

if inGameScore <= 0 {
	inGameScore = 0;
}

if global.GameScore <= 0 {
	global.GameScore = 0;
}

if global.seconds < 60 && global.seconds > 59.9 {
	global.seconds = 0;
	global.minutes += 1;
}

if trinket {
	trinketFrames += trinketAnim;
	
	if trinketFrames >= 4 {
		trinketFrames = 0;
		trinket = false;
	}
} else {
	trinketFrames = 0;
}

trinketScale = lerp(trinketScale, 1, 0.1);

if instance_exists(obj_LevelCard) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCardMinor) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) {
	moveY = lerp(moveY, -200, 0.1);
} else {
	moveY = lerp(moveY, 10, 0.1);
}

scr_GetCharRushBoostIcon();