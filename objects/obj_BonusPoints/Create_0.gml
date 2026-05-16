scr_GetCharRushBoostIcon();

altAlpha = 1;

sprX = 384;
sprY = 392;

sprYScale = 0;

kysTimer = 150;

bonusPoints = 0;
fullScore = 0;
createScore = 2;

soundWait = 2;
soundDone = false;

if !global.MIND {
	sprite_index = _charCheck3;
} else {
	sprite_index = spr_HeadCollectable;
}

image_speed = 1 / 10;