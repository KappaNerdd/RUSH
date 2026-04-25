instance_create_depth(x, y, depth, obj_NewRecordN);
global.Jukebox = false;

x = -1000000;

resultsMus = global.PlayerSelection[global.PlayerChar][23][4];

audio_play_sound(resultsMus, 1, false, global.MASTER_VOL * global.MUSIC_VOL);
set_song_ingame(noone);

#region //Depth
	depth = 2;
	
	if global.PlayerChar == 0 or global.MIND {
		rankAnim = 1 / 12;
	} else {
		rankAnim = 1 / 4;
	}
	
	rankFrames = 0;
#endregion

#region //Stop player from movin' and have 'em do their Prepare animation
	if instance_exists(obj_Player) {
		obj_Player.can_Move = false;
		obj_Player.prepare = true;
		obj_Player.image_index = 0;
		obj_Player.image_speed = 0;
	}
#endregion

#region //Stop Animation if SimplifyVFX is on
	if global.SimplifyVFX {
		image_speed = 0;
		image_index = 0;
	} else {
		image_speed = 1;
	}
#endregion

#region //Character Boxes
	scr_GetCharTextboxes();
	image_alpha = 0;
	image_xscale = 25;
	image_yscale = 15;
#endregion


#region //Sonic Rush Spikes
	if global.PlayerChar == 0 or global.MIND {
		srSpikes = spr_SonicRush_Spikes_Head;
	} else {
		srSpikes = spr_SonicRushSpikesNorm;
	}

	moveRightStart = -120;
	moveRightEnd = 0;
	moveRight = moveRightStart;

	moveUpStart = -120;
	moveUpEnd = 0;
	moveUp = moveUpStart;

	moveDownStart = 550;
	moveDownEnd = 360 + 72;
	moveDown = moveDownStart;
	
	srSpikesImageIndex = 0;
	srSpikesImageIndexBack = 19;
#endregion

#region //Sonic Rush Boss Ball
	if global.PlayerChar == 0 or global.MIND {
		srBall = spr_CharSelectRushBossBallHead;
		srBallBG = spr_CharSelectRushBossBGHead;
	} else {
		srBall = spr_CharSelectRushBossBall;
		srBallBG = spr_CharSelectRushBossBG;
	}
	
	srBallBGMoveX = 0;
	
	srBallRotate = 0;
	srBallStartX = 0;
	srBallEndX = 0;
	srBallMoveX = 250;
	srBallMoveY = 0;
	
	fullBallX = 0;
#endregion


#region //Stage ('n' Other Shit)
	if global.MIND or global.PlayerChar == 0 {
		leftBackSprite = spr_SideBarHeadR;
	} else {
		leftBackSprite = spr_SideBarR;
	}
	
	leftBackStartX = -2000;
	leftBackEndX = -520 + 72;
	leftBackMoveX = leftBackStartX;
	
	if global.MIND or global.PlayerChar == 0 {
		resultsSprite = spr_ResultsHead;
	} else {
		resultsSprite = spr_ResultsNew;
	}
	
	resultsStartX = -300;
	resultsEndX = 60;
	resultsMoveX = resultsStartX;
	
	if global.MIND or global.PlayerChar == 0 {
		scoreSprite = spr_ResultsScoreHead;
	} else {
		scoreSprite = spr_ResultsScore;
	}
	
	if global.MIND or global.PlayerChar == 0 {
		timeSprite = spr_ResultsTimeHead;
	} else {
		timeSprite = spr_ResultsTime;
	}
	
	timeStartX = -300;
	timeEndX = 60;
	timeMoveX = timeStartX;
	
	savedSeconds = 59.99;
	savedMinutes = 99;
	
	soundSeconds = 59.99;
	
	savedScore = 0;
	
	soundScore = 0;
	waitScore = 2;
	
	ringScore = 0;
	
	enemyScore = 0;
	
	if global.MIND or global.PlayerChar == 0 {
		rankSprite = spr_ResultsRankCheckHead;
	} else {
		rankSprite = spr_ResultsRankNew;
	}
	
	rankStartX = -300;
	rankEndX = 60;
	rankMoveX = rankStartX;
	
	rankShakeX = 0;
	rankShakeY = 0;
	rankAltX = 0;
	
	rankShakeTimer = 30;
	rankShakeValue = 5;
	rankShook = false;
	
	rankSize = 2;
	lowerRankSize = 0.005;
	
	mindImageIndex = 0;

	//Stage Name
	stageNameSprite = global.speedStageData[global.SpeedSelected].stage_Sprite;
	stageNameStartX = -200;
	stageNameEndX = 60;
	stageNameMoveX = stageNameStartX;
	stageSound = false;

	//Level Number
	levelNumberSprite = global.speedStageData[global.SpeedSelected].level_Sprite;
	levelNumberStartX = -200;
	levelNumberEndX = 60;
	levelNumberMoveX = levelNumberStartX;
	levelNumSound = false;
#endregion


#region //Player
	playerSprite = global.PlayerSelection[global.PlayerChar][26][0];
	playerCostume = global.PlayerCostume;
	
	playerStartX = 800;
	playerEndX = 300 + 128;
	playerMoveX = playerStartX;
#endregion


#region //Extra Variables
	completed = false;
	completedTimer = 45;
	
	retry = false;
	createRank = false;
	
	restartTimer = 45;
	
	ghostGotSaved = false;
	replayGotSaved = false;
#endregion