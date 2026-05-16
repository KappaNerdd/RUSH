#region //Depth, Image Alpha, Image Scale & BPM
	depth = -10;
	image_alpha = 0;
	image_xscale = 12;
	image_yscale = 12;
	
	if global.SelectedPlayer == 0 {
		global.SelectedPlayer = 1;
	}
	
	global.DownBPM = true;
	global.BPM = 140;
	global.ConvertedBPM = time_bpm_to_seconds(global.BPM);
	global.RealBPM = 0;
#endregion

#region //UI
	#region //Rush Ball Back
		ballAngle = 0;
		ballScale = 0;
		otherBallScale = 0;
		iconAngle = 360;
	#endregion

	#region //Bottom Shit
		bottomShitY = 732;
		
		whiteBallAnimation = 1 / 8;
		whiteBallFrames = 0;
		
		whiteBallX = 0;
		whiteBallXBase = 384;
		whiteBallY = 0;
		
		lockAnimation = 1 / 3;
		lockFrames = 0;
		lockAnim = false;
	#endregion
	
	#region //Sonic Rush Spikes
		srSpikesAnimation = 1;
		srSpikesFrames = 0;
		srSpikesX = -100;
		srSpikesNegaX = 868;
	#endregion
	
	#region //Char Name & Arrows
		charNameY = 150;
		
		arrowLeft = false;
		arrowRight = false;
		
		arrowUp = false;
		arrowDown = false;
		
		arrowAnim = 1 / 3;
		arrowFrames = 0;
		
		arrowAlpha = 0;
	#endregion
	
	#region //Char Sprite
		charSpriteX = 0;
		charSpriteAlpha = 0;
		
		charSpriteAnim = 1 / 6;
		charSpriteFrames = 0;
	#endregion
#endregion

#region //Stats & Moves
	checkStats = false;
	checkMoves = false;
	
	checkStatsX = 0;
	checkUniversalMovesX = 0;
	
	checkUniversalMoves = false;
	
	charMoveList = [
		
	]
	
	universalMoves = [
		"BOOST: PRESS & HOLD " + string(obj_CustomAct2KeySpeed.keyText) + " (GROUND & MID-AIR || ALL CHARS.)",
		"SLIDE: PRESS " + string(obj_CustomDownKeySpeed.keyText) + " (GROUND & WHILE MOVING || ALL CHARS.)",
		"START SLIDE: HOLD " + string(obj_CustomDownKeySpeed.keyText) + " & PRESS " + string(obj_CustomJumpKeySpeed.keyText) + " (GROUND & WHILE STILL || SOME CHARS.)",
		"STOMP: HOLD " + string(obj_CustomDownKeySpeed.keyText) + " & PRESS " + string(obj_CustomAct1KeySpeed.keyText) + " (MID-AIR || ALL CHARS.)",
		"STOMP-DASH: HOLD " + string(obj_CustomLeftKeySpeed.keyText) + " OR " + string(obj_CustomRightKeySpeed.keyText) + " & PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (WHILE STOMPING ON GROUND || SOME CHARS.)",
		"RUSH-TRICKS: SPAM " + string(obj_CustomJumpKeySpeed.keyText) + " (TWIRLING, UNPERFORMABLE AFTER RUSH-TRICK FINALE || ALL CHARS.)",
		"RUSH-TRICK FINALE: PRESS " + string(obj_CustomAct1KeySpeed.keyText) + " (TWIRLING, ATLEAST 2 RUSH-TRICK COMBOS || ALL CHARS.)",
		"UPWARDS TRICK: HOLD: " + string(obj_CustomUpKeySpeed.keyText) + " & PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (TWIRLING, PERFORMABLE DIAGONALLY, RESETS RUSH-TRICK FINALE || ALL CHARS.)",
		"SIDEWAYS TRICK: HOLD " + string(obj_CustomLeftKeySpeed.keyText) + " OR " + string(obj_CustomRightKeySpeed.keyText) + " & PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (TWIRLING, RESETS RUSH-TRICK FINALE || ALL CHARS.)",
		"BACKWARDS TRICK: PRESS " + string(obj_CustomAct3KeySpeed.keyText) + " (TWIRLING, RESETS RUSH-TRICK FINALE || ALL CHARS.)",
	]
#endregion

#region //Switch Character & Costume
	switchChar = false;
	switchCharTimer = 20;
	switchCharFrames = 20;
	
	switchCost = false;
	
	charStats = false;
	charMoves = false;
	
	charX = 800;
	charBaseX = 400;
	charY = 1200;
	
	charBoxY = -40;
	charBoxFrames = 0;
	
	charNameX = 384;
	charNameXRepeat = 768;
#endregion

#region //Ask Girly
	askGirly = false;
	askGirlySelect = 0;
	askGirlyY = 432;
	askGirlyBoxX = 0;
#endregion

#region //BPM Shit
	arrowScale = 1.25;
	nameScale = 0.9;
	circleScale = 1;
	whiteCircleScale = 1.5;
	whiteBarScale = 1.13;
	iconScale = 0;
#endregion

#region //Confirm Character
	cancelled = false;
	cancelledTimer = 30;
	
	setPlayer = global.PlayerChar;

	confirmed = false;
	confirmedTimer = 0;
	confirmedFrames = 60;
	confirmedOpacity = 0;
	
	finished = false;
#endregion