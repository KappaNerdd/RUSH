scr_GetCharRushBoostIcon();

visible = !global.DisableHUD;

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = _charCheck3;
} else {
	sprite_index = spr_HeadCollectable;
}

startX = lerp(startX, 25, 0.1);
startY = lerp(startY, 19, 0.1);

if startX <= 26.1 {
	instance_destroy();
}