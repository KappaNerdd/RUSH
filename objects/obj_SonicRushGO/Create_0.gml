x = -100000;

depth = -10;

baseX = global.CamWidth / 2;
baseY = global.CamHeight / 2;

shakeX = 0;
shakeY = 0;

changeXScale = 7;
changeYScale = 7;

doneTimer = 120;

if obj_Player.sonicRush {
	obj_SFXManager.breakSonic = true;
} else if obj_Player.blazeRush {
	obj_SFXManager.breakBlaze = true;
}

if global.Replay {
	obj_InputRecorder.isPlaying = true;
} else {
	obj_InputRecorder.isRecording = true;
}