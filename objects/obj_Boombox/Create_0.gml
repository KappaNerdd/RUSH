image_xscale = 1;
image_yscale = 1;

depth = -5;

ultrakilled = false;

boxX = 192;
boxY = 600;

custAlbum = spr_AlbumPlaceholder;
custNum = -1;

speakerScale = 4;
speakerTimer = ceil(random(20));

moveTimer = 1;
moveFrames = 10;

boomChoice = 0;
chosenBoom = false;

playChoice = 0;
chosenPlay = false;

moveTextX = 0;
moveTextTimer = 60;
trackTimer = 10;

bgAlph = 0;

curSprite = noone;

albumY = 0;

leftArrow = false;
leftFrames = 0;

rightArrow = false;
rightFrames = 0;

upArrow = false;
upFrames = 0;

downArrow = false;
downFrames = 0;

if obj_MusicManager.songAsset == mus_WrapItUpK or obj_MusicManager.songAsset == mus_WrapItUpL or room == rm_FreeplayNew {
	set_song_ingame(noone, 60);
}
