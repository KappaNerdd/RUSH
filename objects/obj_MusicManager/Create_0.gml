//Global Music Variable
global.MUSIC_VOL = 1;


//Info for song currently or trying to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0; //How many frames to fade out the song currently playing
startFadeInTime = 0; //How many frames to fade in new song
fadeInInstVol = 1; //Volume of songInstance
targetPitch = 1; //Set pitch of track
targetPos = 0; //Set position of new track

//Fade music out and stopping songs that aren't playing
fadeOutInstance = array_create(0); //Audio instances to fade out
fadeOutInstVol = array_create(0); //The volumes of each individual audio instance
fadeOutInstTime = array_create(0); //How fast the fade out should be