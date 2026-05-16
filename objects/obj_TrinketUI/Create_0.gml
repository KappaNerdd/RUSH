depth = -8;
image_speed = 0.25;
x = -10000000;

scr_GetCharRushBoostIcon();

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = _charCheck3;
} else {
	sprite_index = spr_HeadCollectable;
}

visible = !global.DisableHUD;