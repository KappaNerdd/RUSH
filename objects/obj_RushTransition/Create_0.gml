depth = -14;

x = -1000000

target_rm = noone;

rushX = 320;
transd = false;

sonicRush = false;
blazeRush = false;

speedStage = false;
speedAlpha = 0;

restart = false;

obj_SFXManager.block = true;

if sonicRush {
	sprite_index = spr_SonicRushSonic;
	image_blend = c_white;
} else if blazeRush {
	sprite_index = spr_SonicRushBlaze;
	image_blend = c_white;
} else {
	if global.MIND or global.PlayerChar == 0 {
		sprite_index = spr_SonicRushHead;
	}
	
	image_blend = global.fullRGB;
}