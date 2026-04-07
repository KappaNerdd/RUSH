rankS_Time = 055;
rankA_Time = 120;
rankB_Time = 150;
rankC_Time = 190;
rankD_Time = 250;
rankF_Time = 300;

totalSeconds = 0;

global.Secrets = global.speedStageData[global.SpeedSelected].jsrSecrets;
global.MusicSecret = global.speedStageData[global.SpeedSelected].musicSecret;

global.PRank = true;
global.StarterHealth = global.Health;

global.TargetRM = 0;
global.TargetX = 0;
global.TargetY = 0;

extraLife = [
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
]

if !global.LevelForced {
	with(instance_create_depth(-10000000, 0, 0, obj_SonicRushIntroCard)) {
		kysTimer = 240;
	}
	
	if instance_exists(obj_Player) {
		obj_Player.can_Move = false;
	}
} else {
	instance_create_depth(-10000000, 0, 0, obj_SonicRushIntroCard);
}

if instance_exists(obj_InputRecorder) {
	obj_InputRecorder.index = 0;
	obj_InputRecorder.frame = 0;
}
	
if instance_exists(obj_GhostRecorder) {
	obj_GhostRecorder.ghostRecordFrames = 0;
}

if !global.Jukebox {
	if !global.Girly {
		playTrack = global.speedStageData[global.SpeedSelected].musicTrack;
	} else {
		playTrack = global.speedStageData[global.SpeedSelected].musicTrackGirly;
	}
	
	set_song_ingame(playTrack, 0, 0);
}

instance_create_depth(-10000, y, -9, obj_PlayerExtraLives);
instance_create_depth(-10000, y, -9, obj_Timer);
instance_create_depth(-10000, y, -9, obj_CameraExtended);
instance_create_depth(-10000, y, -9, obj_HUDRankDisplayer);
instance_create_depth(-10000, y, -9, obj_LevelCoords);
instance_create_depth(-10000, y, -9, obj_CreatePauseSpeed);
instance_create_depth(-10000, y, -9, obj_GhostRecorder);
instance_create_depth(-10000, y, -9, obj_InputRecorder);
