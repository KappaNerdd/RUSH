display_set_gui_size(768, 432);

var _camX = 0;
var _camY = 0;
var _col = global.fullRGB;
var _xscale = 0.8;
var _yscale = 1;
var _ang = 0;

if global.MIND or global.PlayerChar == 0 {
	_col = c_white;
}

//Draw Background Box
draw_sprite_ext(sprite_index, image_index, _camX - 5, _camY - 5, image_xscale, image_yscale, 0, c_grey, image_alpha);


//Sonic Rush Boss Ball
var _ballAlpha = 0.5;
var _leftBackAnim = mindImageIndex;

if !global.MIND && global.PlayerChar != 0 {
	_leftBackAnim = 0;
	_ballAlpha = 1;
}

draw_sprite_ext(leftBackSprite, _leftBackAnim, _camX + leftBackMoveX + 10, _camY - 10, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(leftBackSprite, _leftBackAnim, _camX + leftBackMoveX, _camY, 1, 1, 0, _col, 1);

draw_sprite_ext(srBallBG, 0, _camX + 598 - 15 + srBallBGMoveX, _camY + 230 + srBallMoveY + 15, 2, 2, 0, c_black, 0.5);
draw_sprite_ext(srBallBG, 0, _camX + 598 + srBallBGMoveX, _camY + 230 + srBallMoveY, 2, 2, 0, _col, 1);
draw_sprite_ext(srBall, 0, _camX + 598 + srBallBGMoveX + srBallMoveX, _camY + 230 + srBallMoveY + -srBallMoveX, 2, 2, srBallRotate, _col, _ballAlpha);


//Text UI
draw_sprite_ext(resultsSprite, mindImageIndex, _camX + resultsMoveX + 5, _camY + 55 + 5 + 20, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(resultsSprite, mindImageIndex, _camX + resultsMoveX, _camY + 55 + 20, 0.5, 0.5, 0, c_white, 1);

draw_sprite_ext(stageNameSprite, mindImageIndex, _camX + stageNameMoveX + 5, _camY + 100 + 5 + 15, 0.25, 0.25, 0, c_black, 0.5);
draw_sprite_ext(stageNameSprite, mindImageIndex, _camX + stageNameMoveX, _camY + 100 + 15, 0.25, 0.25, 0, c_white, 1);

draw_sprite_ext(levelNumberSprite, mindImageIndex, _camX + levelNumberMoveX + 5, _camY + 140 + 5 + 15, 0.75, 0.75, 0, c_black, 0.5);
draw_sprite_ext(levelNumberSprite, mindImageIndex, _camX + levelNumberMoveX, _camY + 140 + 15, 0.75, 0.75, 0, c_white, 1);


var _font = global.EnemyComboFont;

if global.MIND or global.PlayerChar == 0 {
	_font = global.EnemyComboFontHead;
}

draw_set_font(_font);
if savedSeconds < 10 && savedMinutes < 10 {
	draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 180 + 5, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
} else if savedSeconds >= 10 && savedMinutes >= 10 {
	draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 180 + 5, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
} else if savedSeconds < 10 && savedMinutes >= 10 {
	draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 180 + 5, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
} else if savedSeconds >= 10 && savedMinutes < 10 {
	draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 180 + 5, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
}
	
if savedSeconds < 10 && savedMinutes < 10 {
	draw_text_transformed(_camX + timeMoveX, _camY + 180, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang);
} else if savedSeconds >= 10 && savedMinutes >= 10 {
	draw_text_transformed(_camX + timeMoveX, _camY + 180, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang);
} else if savedSeconds < 10 && savedMinutes >= 10 {
	draw_text_transformed(_camX + timeMoveX, _camY + 180, string(round(savedMinutes)) + ":0" + string(savedSeconds), _xscale, _yscale, _ang);
} else if savedSeconds >= 10 && savedMinutes < 10 {
	draw_text_transformed(_camX + timeMoveX, _camY + 180, string(round(savedMinutes)) + ":" + string(savedSeconds), _xscale, _yscale, _ang);
}

draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 210 + 5, string(ceil(savedScore)), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
draw_text_transformed(_camX + timeMoveX, _camY + 210, string(ceil(savedScore)), _xscale, _yscale, _ang);

draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 240 + 5, string(ceil(ringScore)), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
draw_text_transformed(_camX + timeMoveX, _camY + 240, string(ceil(ringScore)), _xscale, _yscale, _ang);

draw_text_transformed_color(_camX + timeMoveX + 5, _camY + 270 + 5, string(ceil(enemyScore)), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 0.5);
draw_text_transformed(_camX + timeMoveX, _camY + 270, string(ceil(enemyScore)), _xscale, _yscale, _ang);
draw_set_font(global.font_main);

rankFrames += rankAnim;

var _animCheck = 60

if global.MIND or global.PlayerChar == 0 {
	_animCheck = 3;
}

if rankFrames >= _animCheck {
	rankFrames = 0;
}

var _scoreRank = spr_RankFHead;
var _mod2 = global.speedStageData[global.SpeedSelected];
var _totalSeconds = (savedMinutes * 100) + savedSeconds;

if !global.MIND && global.PlayerChar != 0 {
	if _totalSeconds < _mod2.rankD_Time && _totalSeconds >= _mod2.rankC_Time {
		_scoreRank = spr_RankDNew;
	} else if _totalSeconds < _mod2.rankC_Time && _totalSeconds >= _mod2.rankB_Time {
		_scoreRank = spr_RankCNew;
	} else if _totalSeconds < _mod2.rankB_Time && _totalSeconds >= _mod2.rankA_Time {
		_scoreRank = spr_RankBNew;
	} else if _totalSeconds < _mod2.rankA_Time && _totalSeconds >= _mod2.rankS_Time {
		_scoreRank = spr_RankANew;
	} else if _totalSeconds < _mod2.rankS_Time {
		_scoreRank = spr_RankSNew;
	} else {
		_scoreRank = spr_RankFNew;
	}
} else {
	if _totalSeconds < _mod2.rankD_Time && _totalSeconds >= _mod2.rankC_Time {
		_scoreRank = spr_RankDHead;
	} else if _totalSeconds < _mod2.rankC_Time && _totalSeconds >= _mod2.rankB_Time {
		_scoreRank = spr_RankCHead;
	} else if _totalSeconds < _mod2.rankB_Time && _totalSeconds >= _mod2.rankA_Time {
		_scoreRank = spr_RankBHead;
	} else if _totalSeconds < _mod2.rankA_Time && _totalSeconds >= _mod2.rankS_Time {
		_scoreRank = spr_RankAHead;
	} else if _totalSeconds < _mod2.rankS_Time {
		_scoreRank = spr_RankSHead;
	} else {
		_scoreRank = spr_RankFHead;
	}
}


//draw_sprite_ext(timeSprite, mindImageIndex, _camX + timeMoveX + 5, _camY + 195 + 2 + 5, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_scoreRank, rankFrames, _camX + timeMoveX + 120, _camY + 180 - 3 + 5, 0.5, 0.5, 0, c_black, 0.5);
//draw_sprite_ext(timeSprite, mindImageIndex, _camX + timeMoveX, _camY + 195 + 2, 1, 1, 0, _col, 1);
draw_sprite_ext(_scoreRank, rankFrames, _camX + timeMoveX + 120, _camY + 180 - 3, 0.5, 0.5, 0, c_white, 1);


var _timeRank = spr_RankFNew;
var _mod3 = global.speedStageData[global.SpeedSelected];

if !global.MIND && global.PlayerChar != 0 {
	if savedScore >= _mod3.rankD_Score && savedScore < _mod3.rankC_Score {
		_timeRank = spr_RankDNew;
	} else if savedScore >= _mod3.rankC_Score && savedScore < _mod3.rankB_Score {
		_timeRank = spr_RankCNew;
	} else if savedScore >= _mod3.rankB_Score && savedScore < _mod3.rankA_Score {
		_timeRank = spr_RankBNew;
	} else if savedScore >= _mod3.rankA_Score && savedScore < _mod3.rankS_Score {
		_timeRank = spr_RankANew;
	} else if savedScore >= _mod3.rankS_Score {
		_timeRank = spr_RankSNew;
	} else {
		_timeRank = spr_RankFNew;
	}
} else {
	if savedScore >= _mod3.rankD_Score && savedScore < _mod3.rankC_Score {
		_timeRank = spr_RankDHead;
	} else if savedScore >= _mod3.rankC_Score && savedScore < _mod3.rankB_Score {
		_timeRank = spr_RankCHead;
	} else if savedScore >= _mod3.rankB_Score && savedScore < _mod3.rankA_Score {
		_timeRank = spr_RankBHead;
	} else if savedScore >= _mod3.rankA_Score && savedScore < _mod3.rankS_Score {
		_timeRank = spr_RankAHead;
	} else if savedScore >= _mod3.rankS_Score {
		_timeRank = spr_RankSHead;
	} else {
		_timeRank = spr_RankFHead;
	}
}


//draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX + 5, _camY + 195 + 2 + 5 + 30, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_timeRank, rankFrames, _camX + timeMoveX + 120, _camY + 210 - 3 + 5, 0.5, 0.5, 0, c_black, 0.5);
//draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX, _camY + 195 + 2 + 30, 1, 1, 0, _col, 1);
draw_sprite_ext(_timeRank, rankFrames, _camX + timeMoveX + 120, _camY + 210 - 3, 0.5, 0.5, 0, c_white, 1);


var _ringRank = spr_RankFNew;
var _mod4 = global.speedStageData[global.SpeedSelected];

if !global.MIND && global.PlayerChar != 0 {
	if ringScore >= _mod3.rankS_Ring * 0.2 && ringScore < _mod3.rankS_Ring * 0.4 {
		_ringRank = spr_RankDNew;
	} else if ringScore >= _mod3.rankS_Ring * 0.4 && ringScore < _mod3.rankS_Ring * 0.6 {
		_ringRank = spr_RankCNew;
	} else if ringScore >= _mod3.rankS_Ring * 0.6 && ringScore < _mod3.rankS_Ring * 0.8 {
		_ringRank = spr_RankBNew;
	} else if ringScore >= _mod3.rankS_Ring * 0.8 && ringScore < _mod3.rankS_Ring {
		_ringRank = spr_RankANew;
	} else if ringScore >= _mod3.rankS_Ring {
		_ringRank = spr_RankSNew;
	} else {
		_ringRank = spr_RankFNew;
	}
} else {
	if ringScore >= _mod3.rankS_Ring * 0.2 && ringScore < _mod3.rankS_Ring * 0.4 {
		_ringRank = spr_RankDHead;
	} else if ringScore >= _mod3.rankS_Ring * 0.4 && ringScore < _mod3.rankS_Ring * 0.6 {
		_ringRank = spr_RankCHead;
	} else if ringScore >= _mod3.rankS_Ring * 0.6 && ringScore < _mod3.rankS_Ring * 0.8 {
		_ringRank = spr_RankBHead;
	} else if ringScore >= _mod3.rankS_Ring * 0.8 && ringScore < _mod3.rankS_Ring {
		_ringRank = spr_RankAHead;
	} else if ringScore >= _mod3.rankS_Ring {
		_ringRank = spr_RankSHead;
	} else {
		_ringRank = spr_RankFHead;
	}
}


//draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX + 5, _camY + 195 + 2 + 5 + 30, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_ringRank, rankFrames, _camX + timeMoveX + 120, _camY + 240 - 3 + 5, 0.5, 0.5, 0, c_black, 0.5);
//draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX, _camY + 195 + 2 + 30, 1, 1, 0, _col, 1);
draw_sprite_ext(_ringRank, rankFrames, _camX + timeMoveX + 120, _camY + 240 - 3, 0.5, 0.5, 0, c_white, 1);


var _enemyRank = spr_RankFNew;
var _mod5 = global.speedStageData[global.SpeedSelected];

if !global.MIND && global.PlayerChar != 0 {
	if enemyScore >= _mod3.rankS_Enemy * 0.2 && enemyScore < _mod3.rankS_Enemy * 0.4 {
		_enemyRank = spr_RankDNew;
	} else if enemyScore >= _mod3.rankS_Enemy * 0.4 && enemyScore < _mod3.rankS_Enemy * 0.6 {
		_enemyRank = spr_RankCNew;
	} else if enemyScore >= _mod3.rankS_Enemy * 0.6 && enemyScore < _mod3.rankS_Enemy * 0.8 {
		_enemyRank = spr_RankBNew;
	} else if enemyScore >= _mod3.rankS_Enemy * 0.8 && enemyScore < _mod3.rankS_Enemy {
		_enemyRank = spr_RankANew;
	} else if enemyScore >= _mod3.rankS_Enemy {
		_enemyRank = spr_RankSNew;
	} else {
		_enemyRank = spr_RankFNew;
	}
} else {
	if enemyScore >= _mod3.rankS_Enemy * 0.2 && enemyScore < _mod3.rankS_Enemy * 0.4 {
		_enemyRank = spr_RankDHead;
	} else if enemyScore >= _mod3.rankS_Enemy * 0.4 && enemyScore < _mod3.rankS_Enemy * 0.6 {
		_enemyRank = spr_RankCHead;
	} else if enemyScore >= _mod3.rankS_Enemy * 0.6 && enemyScore < _mod3.rankS_Enemy * 0.8 {
		_enemyRank = spr_RankBHead;
	} else if enemyScore >= _mod3.rankS_Enemy * 0.8 && enemyScore < _mod3.rankS_Enemy {
		_enemyRank = spr_RankAHead;
	} else if enemyScore >= _mod3.rankS_Enemy {
		_enemyRank = spr_RankSHead;
	} else {
		_enemyRank = spr_RankFHead;
	}
}


//draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX + 5, _camY + 195 + 2 + 5 + 30, 1, 1, 0, c_black, 0.5);
draw_sprite_ext(_enemyRank, rankFrames, _camX + timeMoveX + 120, _camY + 270 - 3 + 5, 0.5, 0.5, 0, c_black, 0.5);
//draw_sprite_ext(scoreSprite, mindImageIndex, _camX + timeMoveX, _camY + 195 + 2 + 30, 1, 1, 0, _col, 1);
draw_sprite_ext(_enemyRank, rankFrames, _camX + timeMoveX + 120, _camY + 270 - 3, 0.5, 0.5, 0, c_white, 1);


draw_sprite_ext(rankSprite, mindImageIndex, _camX + rankMoveX + 5, _camY + 290 + 5 + 40, 1, 0.8, 0, c_black, 0.5);
draw_sprite_ext(rankSprite, mindImageIndex, _camX + rankMoveX, _camY + 290 + 40, 1, 0.8, 0, c_white, 1);

if !completed {
	var _sprayGap = 22;
	var _levelWidth = sprite_get_width(_mod2.level_Sprite);
		
	for(var i = 0; i < array_length(_mod2.jsrSecrets); i++) {
		var _colThing = c_white;
		var _sprite = spr_HUDJSRSprays;
		var _fog = true;
	
		if _mod2.mind {
			_sprite = spr_HUDJSRSpraysHead;
		}
	
		if _mod2.jsrSecrets[i] {
			if !_mod2.mind {
				_colThing = global.fullRGB;
			} else {
				_colThing = c_white;
			}
				
			_fog = false;
		}
	
	
		draw_sprite_ext(_sprite, mindImageIndex, _camX + 339 + (_sprayGap * i), _camY + 85, 1, 1, 0, c_black, image_alpha);
	
		gpu_set_fog(_fog, _colThing, 0, 1);
			draw_sprite_ext(_sprite, mindImageIndex, _camX + 344 + (_sprayGap * i), _camY + 80, 1, 1, 0, _colThing, image_alpha * 2);
		gpu_set_fog(false, c_black, 0, 1);
	}
		
	var _cassSprite = spr_HUDCassette;
	var _cassCol = c_white;
	var _cassFog = true;

	if _mod2.musicSecret {
		if !_mod2.mind {
			_cassCol = global.fullRGB;
		} else {
			_cassCol = c_white;
		}
			
		_cassFog = false;
	}

	if _mod2.mind {
		_cassSprite = spr_HUDCassetteHead;
	}

	draw_sprite_ext(_cassSprite, mindImageIndex, _camX + 466, _camY + 85, 1, 1, 0, c_black, image_alpha);

	gpu_set_fog(_cassFog, _cassCol, 0, 1);
		draw_sprite_ext(_cassSprite, mindImageIndex, _camX + 466, _camY + 80, 1, 1, 0, _cassCol, image_alpha * 2);
	gpu_set_fog(false, c_black, 0, 1);
}

//Player
draw_sprite_ext(playerSprite, playerCostume, _camX + playerMoveX - 15, _camY + 25 + 25 + 40, 0.5, 0.5, 0, c_black, 0.5);
draw_sprite_ext(playerSprite, playerCostume, _camX + playerMoveX, _camY + 35 + 40, 0.5, 0.5, 0, c_white, 1);

var _rank = spr_RankFHead;
var _mod = global.Rank;

if !global.MIND && global.PlayerChar != 0 {
	if _mod == -1 or _mod == 0 {
		_rank = spr_RankFNew;
	} else if _mod == 1 {
		_rank = spr_RankDNew;
	} else if _mod == 2 {
		_rank = spr_RankCNew;
	} else if _mod == 3 {
		_rank = spr_RankBNew;
	} else if _mod == 4 {
		_rank = spr_RankANew;
	} else if _mod == 5 {
		_rank = spr_RankSNew;
	} else if _mod == 6 {
		_rank = spr_RankPNew;
	}
} else {
	if _mod == -1 or _mod == 0 {
		_rank = spr_RankFHead;
	} else if _mod == 1 {
		_rank = spr_RankDHead;
	} else if _mod == 2 {
		_rank = spr_RankCHead;
	} else if _mod == 3 {
		_rank = spr_RankBHead;
	} else if _mod == 4 {
		_rank = spr_RankAHead;
	} else if _mod == 5 {
		_rank = spr_RankSHead;
	} else if _mod == 6 {
		_rank = spr_RankPHead;
	}
}

if createRank {
	draw_sprite_ext(_rank, rankFrames, _camX + rankShakeX + rankAltX + 235 + 5, _camY + rankShakeY + 260 + 5 + 40, 1 + rankSize, 1 + rankSize, 0, c_black, 0.5);
	draw_sprite_ext(_rank, rankFrames, _camX + rankShakeX + rankAltX + 235, _camY + rankShakeY + 260 + 40, 1 + rankSize, 1 + rankSize, 0, c_white, 1);
}

//Draw Sonic Rush Spikes
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + 768 + 10, _camY + moveUp + 10, 3.1, 3.1, -90, c_black, 0.5);
draw_sprite_ext(srSpikes, srSpikesImageIndexBack, _camX + 768 + 10, _camY + moveDown - 10, 3.1, -3.1, 90, c_black, 0.5);
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + moveRight + 10, _camY + 10, 2.75, 2.75, 0, c_black, 0.5);

draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + 768, _camY + moveUp, 3.1, 3.1, -90, _col, 1);
draw_sprite_ext(srSpikes, srSpikesImageIndexBack, _camX + 768, _camY + moveDown, 3.1, -3.1, 90, _col, 1);
draw_sprite_ext(srSpikes, srSpikesImageIndex, _camX + moveRight, _camY, 2.75, 2.75, 0, _col, 1);


var _return = "RETURN";
var _retry = "RETRY";

if rankSize == 0 {
	var _button = obj_CustomAct1KeySpeed.sprite_index;
	var _retryText = "results_Retry";
	var _retryWidth = string_width(scr_LocalText(_retryText));
	
	var _continueText = "title_Continue";
	var _continueWidth = string_width(scr_LocalText(_continueText));
	
	var _ghostText = "results_Ghost";
	var _replayText = "results_Replay";
	
	if ghostGotSaved {
		_ghostText = "results_GhostSaved";
	}
	
	var _ghostWidth = string_width(scr_LocalText(_ghostText));
	
	if replayGotSaved {
		_replayText = "results_ReplaySaved";
	}
	
	var _replayWidth = string_width(scr_LocalText(_replayText));
	
	if !completed {
		draw_set_halign(fa_right);
			#region //Retry
				draw_sprite_ext(_button, obj_CustomAct1KeySpeed.image_index, _camX + 698 - _retryWidth, _camY + 345 + 68, 1, 1, 0, c_white, image_alpha * 2);
				draw_text_transformed_color(_camX + 763, _camY + 335 + 68, scr_LocalText(_retryText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
			#endregion
		
			#region //Continue
				draw_sprite_ext(_button, obj_CustomJumpKeySpeed.image_index, _camX + 570 + 128 - _continueWidth, _camY + 310 + 68, 1, 1, 0, c_white, image_alpha * 2);
				draw_text_transformed_color(_camX + 635 + 128, _camY + 300 + 68, scr_LocalText(_continueText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
			#endregion
		
			#region //Replay
				var _replayCol = c_white;
				
				if !instance_exists(obj_InputRecorder) {
					_replayCol = c_grey;
				}
			
				if !replayGotSaved {
					draw_sprite_ext(_button, obj_CustomAct2KeySpeed.image_index, _camX + 570 + 128 - _replayWidth, _camY + 20, 1, 1, 0, _replayCol, image_alpha * 2);
				}
			
				draw_text_transformed_color(_camX + 635 + 128, _camY + 10, scr_LocalText(_replayText), 1, 1, 0, c_white, c_white, _replayCol, _replayCol, image_alpha * 2);
			#endregion
		
			#region //Ghost
				if !ghostGotSaved {
					draw_sprite_ext(_button, obj_CustomAct4KeySpeed.image_index, _camX + 570 + 128 - _ghostWidth, _camY + 55, 1, 1, 0, c_white, image_alpha * 2);
				}
			
				draw_text_transformed_color(_camX + 635 + 128, _camY + 45, scr_LocalText(_ghostText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha * 2);
			#endregion
		draw_set_halign(fa_left);
	}
}



