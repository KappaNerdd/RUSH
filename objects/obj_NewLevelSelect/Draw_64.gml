display_set_gui_size(768, 432);

#region //BG
	if !global.SimplifyVFX {
		image_speed = 1;
	} else {
		image_speed = 0;
	}

	draw_sprite_ext(sprite_index, image_index, 0, 0, 14, 14, 0, global.fullRGB, image_alpha);
#endregion

#region //Character
	var _charX = charX + charX2;
	var _charY = charY + charY2;
	
	draw_sprite_ext(_charSprite, global.PlayerCostume, _charX + 5, _charY + 5, 0.5, 0.5, charAngle, c_black, 1);
	draw_sprite_ext(_charSprite, global.PlayerCostume, _charX, _charY, 0.5, 0.5, charAngle, c_white, 1);
#endregion

#region //Top 'n' Bottom
	if bottomY <= 99.5 {
		draw_sprite_ext(spr_CharSelectBottom, 0, 0, -68 - bottomY, 1.5, -1, 0, global.fullRGB, 1);
		draw_sprite_ext(spr_CharSelectBottom, 0, 0, 500 + bottomY, 1.5, 1, 0, global.fullRGB, 1);
	}
	
	var _charSel = global.PlayerSelection[global.PlayerChar];
	var _charName = _charSel[0][0];
	var _charBox = _charSel[6][0];
	var _charBoxAnim = _charSel[6][1];
	var _col = c_white;
		
	if charBoxFrames < _charBoxAnim && !global.SimplifyVFX {
		charBoxFrames += 1 / 6;
	} else {
		charBoxFrames = 0;
	}
	
	charNameX -= 1;
		
	if charNameX <= -384 {
		charNameX = 384;
	}
	
	draw_sprite_ext(spr_TextboxHead, 0, -10, charBoxY + 3 - 100 + bottomY, 25, 1, 0, c_black, 1);
	draw_sprite_ext(_charBox, charBoxFrames, -10, charBoxY - 100 + bottomY, 25, 1, 0, c_grey, 1);
	draw_sprite_ext(spr_TextboxTrans, 0, -10, charBoxY - 100 + bottomY, 25, 1, 0, c_white, 1);
		
	draw_set_halign(fa_right);
		draw_text_transformed_color(charNameX, charBoxY + 4 - 100 + bottomY, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768 / 2, charBoxY + 4 - 100 + bottomY, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768, charBoxY + 4 - 100 + bottomY, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768 * 1.5, charBoxY + 4 - 100 + bottomY, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768 * 2, charBoxY + 4 - 100 + bottomY, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
	draw_set_halign(fa_left);
	
	
	var _stage = global.speedStageData[chosenSpeed];
	var _textCol = global.fullRGB;
		
	if actionStage {
		_stage = global.actionStageData[chosenAction];
	}
		
	draw_set_halign(fa_center);
		if !_stage.locked {
			draw_text_transformed_color(384, -bottomY + 13, scr_LocalText(_stage.stage_Name), 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(384, -bottomY + 10, scr_LocalText(_stage.stage_Name), 1.5, 1.5, 0, c_white, c_white, _textCol, _textCol, 1);
		}
	draw_set_halign(fa_left);
#endregion

#region //Stages
	for(var i = 0; i < array_length(stages); i++) {
		var _gap = 50;
		var _bigX = 100 + choiceX;
		var _extraX = 0;
		var _selCol = c_grey;
		var _locks = 0;
		
		if choice == i {
			_extraX = 10;
			_selCol = global.fullRGB;
			_locks = lockFrames;
		}
		
		draw_sprite_ext(stages[i][2], 0, -43 + srSpikesX + _bigX + _extraX, 119 + (_gap * i), 1, 1, 0, c_black, 1);
		draw_sprite_ext(stages[i][2], 0, -40 + srSpikesX + _bigX + _extraX, 116 + (_gap * i), 1, 1, 0, c_white, 1);
		
		draw_sprite_ext(spr_PauseArrow, 0, srSpikesX + _bigX - 3 + _extraX, 103 + (_gap * i), 1, 0.5, 0, c_black, 1);
		draw_text_transformed_color(srSpikesX + _bigX + _extraX - 3, 98 + (_gap * i), scr_LocalText(stages[i][0]), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
		
		draw_sprite_ext(spr_PauseArrow, 0, srSpikesX + _bigX + _extraX, 100 + (_gap * i), 1, 0.5, 0, _selCol, 1);
		draw_text_transformed_color(srSpikesX + _bigX + _extraX, 95 + (_gap * i), scr_LocalText(stages[i][0]), 1, 1, 0, c_white, c_white, _selCol, _selCol, 1);
		
		if !stages[i][1] {
			draw_sprite_ext(spr_FreeplayLock, _locks, -37 + srSpikesX + _bigX + _extraX - 3, 116 + (_gap * i), 1, 1, 0, c_black, 1);
			draw_sprite_ext(spr_FreeplayLock, _locks, -37 + srSpikesX + _bigX + _extraX, 113 + (_gap * i), 1, 1, 0, c_white, 1);
		}
	}
	
	draw_sprite_ext(global.PlayerSelection[global.PlayerChar][6][2], 0, -30 + srSpikesX + _bigX + _extraX, 130 + (cursorY), 1, 1, 0, c_white, 1);
#endregion

#region //Levels (Speed)
	for(var s = 0; s < array_length(global.speedStageData); s++) {
		var _speedStages = global.speedStageData[s];
		var _gapX = 125;
		var _selCol = c_grey;
		var _levelCol = c_white;
		var _locks = 0;
		var _levelAlpha = levelAlphas;
		var _extraY = 0;
		
		if chosenSpeed == s {
			_extraY = -15;
		}
		
		draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s) - 3, bottomY + choiceSpeedY + 402 + 3 + + _extraY, 1, 1, 0, c_black, 1);
		
		if chosenSpeed == s {
			_selCol = c_white;
			_locks = lockFrames;
			_levelAlpha = 1;
			
			gpu_set_fog(true, c_black, 0, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s) + 2, bottomY + choiceSpeedY + 402 + _extraY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s) - 2, bottomY + choiceSpeedY + 402 + _extraY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s), bottomY + choiceSpeedY + 402 + 2 + _extraY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s), bottomY + choiceSpeedY + 402 - 2 + _extraY, 1, 1, 0, c_white, 1);
			gpu_set_fog(false, c_black, 0, 1);
			
			gpu_set_fog(true, c_white, 0, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s) + 1, bottomY + choiceSpeedY + 402 + _extraY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s) - 1, bottomY + choiceSpeedY + 402 + _extraY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s), bottomY + choiceSpeedY + 402 + 1 + _extraY, 1, 1, 0, c_white, 1);
				draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s), bottomY + choiceSpeedY + 402 - 1 + _extraY, 1, 1, 0, c_white, 1);
			gpu_set_fog(false, c_black, 0, 1);
		}
		
		draw_sprite_ext(_speedStages.level_Icon, 0, 384 + choiceSpeedX + (_gapX * s), bottomY + choiceSpeedY + 402 + _extraY, 1, 1, 0, _selCol, 1);
		
		if _speedStages.locked {
			_levelCol = c_black;
			draw_sprite_ext(spr_FreeplayLock, _locks, 384 + choiceSpeedX + (_gapX * s), bottomY + choiceSpeedY + 402 + _extraY, 1, 1, 0, _selCol, 1);
		} else {
			draw_sprite_ext(_speedStages.stage_Sprite, mindFrames, 384 + choiceSpeedX + (_gapX * s) - 18, bottomY + choiceSpeedY + 402 - 47 + _extraY, 0.35, 0.35, 60, c_black, _levelAlpha);
			draw_sprite_ext(_speedStages.stage_Sprite, mindFrames, 384 + choiceSpeedX + (_gapX * s) - 15, bottomY + choiceSpeedY + 402 - 50 + _extraY, 0.35, 0.35, 60, _levelCol, _levelAlpha);
			
			draw_sprite_ext(_speedStages.level_Sprite, mindFrames, 384 + choiceSpeedX + (_gapX * s) + 40 - 3, bottomY + choiceSpeedY + 402 - 20 + _extraY + 3, 0.75, 0.75, 60, c_black, _levelAlpha);
			draw_sprite_ext(_speedStages.level_Sprite, mindFrames, 384 + choiceSpeedX + (_gapX * s) + 40, bottomY + choiceSpeedY + 402 - 20 + _extraY, 0.75, 0.75, 60, _levelCol, _levelAlpha);
		}
	}
#endregion

#region //Level Info
	var _textCol2 = c_white;
	var _levelDesc = global.speedStageData[chosenSpeed];
	var _plusUltra = 0;
	var _boxCol = c_white;
	
	if _levelDesc.mind {
		_plusUltra = 7;
	}

	var _animCheck = 60

	if _levelDesc.mind {
		_animCheck = 3;
		rankAnim = 1 / 12;
	} else {
		rankAnim = 1 / 4;
	}
	
	rankFrames += rankAnim;

	if rankFrames >= _animCheck {
		rankFrames = 0;
	}
	
	if actionStage {
		_levelDesc = global.actionStageData[chosenAction];
	} else {
		if _levelDesc.rank == 6 && _levelDesc.rankTime == 5 && _levelDesc.rankScore == 5 && _levelDesc.musicSecret && _levelDesc.jsrSecrets[0] && _levelDesc.jsrSecrets[1] && _levelDesc.jsrSecrets[2] && _levelDesc.jsrSecrets[3] && _levelDesc.jsrSecrets[4] {
			_boxCol = c_fuchsia;
		}
	}
	
	var _descText = _levelDesc.stage_Desc;
	
	if _levelDesc.locked {
		_descText = _levelDesc.requirement;
	}
	
	if chosenYScale > 0.1 {
		draw_sprite_ext(spr_TextboxSonicRush, textboxFrames, 384, 216, 21, chosenYScale, 0, _boxCol, 1);
		
		draw_sprite_ext(_levelDesc.stage_Sprite, mindFrames, 197, 43, 0.35, 0.35, 0, c_black, chosenTextAlpha);
		draw_sprite_ext(_levelDesc.level_Sprite, mindFrames, 197, 103, 0.75, 0.75, 0, c_black, chosenTextAlpha);
		draw_sprite_ext(_levelDesc.level_Icon, mindFrames, 197 + (sprite_get_width(_levelDesc.stage_Sprite) * 0.35) + 50, 68, 1, 1, 0, c_black, chosenTextAlpha);
		
		draw_sprite_ext(_levelDesc.stage_Sprite, mindFrames, 200, 40, 0.35, 0.35, 0, c_white, chosenTextAlpha);
		draw_sprite_ext(_levelDesc.level_Sprite, mindFrames, 200, 100, 0.75, 0.75, 0, c_white, chosenTextAlpha);
		draw_sprite_ext(_levelDesc.level_Icon, mindFrames, 200 + (sprite_get_width(_levelDesc.stage_Sprite) * 0.35) + 50, 65, 1, 1, 0, c_white, chosenTextAlpha);
		
		var _sprayGap = 22;
		var _levelWidth = sprite_get_width(_levelDesc.level_Sprite);
		
		for(var i = 0; i < array_length(_levelDesc.jsrSecrets); i++) {
			var _col = c_white;
			var _sprite = spr_HUDJSRSprays;
			var _fog = true;
	
			if _levelDesc.mind {
				_sprite = spr_HUDJSRSpraysHead;
			}
	
			if _levelDesc.jsrSecrets[i] {
				if !_levelDesc.mind {
					_col = global.fullRGB;
				} else {
					_col = c_white;
				}
				
				_fog = false;
			}
	
	
			draw_sprite_ext(_sprite, mindFrames, 212 + _levelWidth + (_sprayGap * i), 108, 1, 1, 0, c_black, chosenTextAlpha);
	
			gpu_set_fog(_fog, _col, 0, 1);
				draw_sprite_ext(_sprite, mindFrames, 215 + _levelWidth + (_sprayGap * i), 105, 1, 1, 0, _col, chosenTextAlpha);
			gpu_set_fog(false, c_black, 0, 1);
		}
		
		var _cassSprite = spr_HUDCassette;
		var _cassCol = c_white;
		var _cassFog = true;

		if _levelDesc.musicSecret {
			if !_levelDesc.mind {
				_cassCol = global.fullRGB;
			} else {
				_cassCol = c_white;
			}
			
			_cassFog = false;
		}

		if _levelDesc.mind {
			_cassSprite = spr_HUDCassetteHead;
		}

		draw_sprite_ext(_cassSprite, mindFrames, 337 + _levelWidth, 108, 1, 1, 0, c_black, chosenTextAlpha);

		gpu_set_fog(_cassFog, _cassCol, 0, 1);
			draw_sprite_ext(_cassSprite, mindFrames, 337 + _levelWidth, 105, 1, 1, 0, _cassCol, chosenTextAlpha);
		gpu_set_fog(false, c_black, 0, 1);
		
		
		
		#region //Overall Rank
			var _rankOA = _levelDesc.rank;
			var _rankChar = _levelDesc.player_Sprite;
			var _rankCharCost = _levelDesc.player_Costume;
			var _rankSprite = spr_ResultsRankNew;
			
			if _levelDesc.mind {
				_rankSprite = spr_ResultsRankCheckHead;
			}
			
			draw_sprite_ext(_rankSprite, mindFrames, 69, 153, 0.6, 0.6, 0, c_black, chosenTextAlpha);
			draw_sprite_ext(_rankSprite, mindFrames, 72, 150, 0.6, 0.6, 0, c_white, chosenTextAlpha);
			
			draw_sprite_ext(ranks[_rankOA + _plusUltra], rankFrames, 69, 183, 1, 1, 0, c_black, chosenTextAlpha);
			draw_sprite_ext(ranks[_rankOA + _plusUltra], rankFrames, 72, 180, 1, 1, 0, c_white, chosenTextAlpha);
			
			draw_sprite_ext(_rankChar, _rankCharCost, 122, 183, 1, 1, 0, c_black, chosenTextAlpha);
			draw_sprite_ext(_rankChar, _rankCharCost, 125, 180, 1, 1, 0, c_white, chosenTextAlpha);
		#endregion
		
		#region //Best Time
			var _rankTime = _levelDesc.rankTime;
			var _rankTChar = _levelDesc.player_SpriteTime;
			var _rankTCharCost = _levelDesc.player_CostumeTime;
			var _timeCheck = string(_levelDesc.minutes) + ":0" + string(_levelDesc.seconds);
			
			if _levelDesc.seconds >= 10 or _levelDesc.minutes >= 10 {
				_timeCheck = string(_levelDesc.minutes) + ":" + string(_levelDesc.seconds);
			}
			
			var _rankTimeText = scr_LocalText("freeplay_BestTime") + " " + _timeCheck;
			var _rankTextWidth = string_width(_rankTimeText);
			
			draw_text_transformed_color(197, 123, _rankTimeText, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
			draw_sprite_ext(ranks[_rankTime + _plusUltra], rankFrames, 197 + (_rankTextWidth + 14), 123, 0.5, 0.5, 0, c_black, chosenTextAlpha);
			draw_sprite_ext(_rankTChar, _rankTCharCost, 225 + (_rankTextWidth + 14), 123, 0.5, 0.5, 0, c_black, chosenTextAlpha);
			
			draw_text_transformed_color(200, 120, _rankTimeText, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			draw_sprite_ext(ranks[_rankTime + _plusUltra], rankFrames, 200 + (_rankTextWidth + 14), 120, 0.5, 0.5, 0, c_white, chosenTextAlpha);
			draw_sprite_ext(_rankTChar, _rankTCharCost, 228 + (_rankTextWidth + 14), 120, 0.5, 0.5, 0, c_white, chosenTextAlpha);
		#endregion
		
		#region //Best Score
			var _actualScore = _levelDesc.rankScore;
			var _rankSChar = _levelDesc.player_SpriteScore;
			var _rankSCharCost = _levelDesc.player_CostumeScore;
			var _score0 = "000000";
			var _scoreCheck = string(round(_levelDesc.gameScore));
			
			if _scoreCheck < 10 {
				_score0 = "000000";
			} else if _scoreCheck < 100 && _scoreCheck >= 10 {
				_score0 = "00000";
			} else if _scoreCheck < 1000 && _scoreCheck >= 100 {
				_score0 = "0000";
			} else if _scoreCheck < 10000 && _scoreCheck >= 1000 {
				_score0 = "000";
			} else if _scoreCheck < 100000 && _scoreCheck >= 10000 {
				_score0 = "00";
			} else if _scoreCheck < 1000000 && _scoreCheck >= 100000 {
				_score0 = "0";
			} else if _scoreCheck >= 1000000 {
				_score0 = "";
			}
			
			var _rankScoreText = scr_LocalText("freeplay_BestScore") + " ";
			var _rankSTextWidth = string_width(_rankScoreText + string(_score0) + _scoreCheck);
			
			draw_text_transformed_color(197, 153, _rankScoreText + _score0 + _scoreCheck, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
			draw_sprite_ext(ranks[_actualScore + _plusUltra], rankFrames, 197 + (_rankSTextWidth + 14), 153, 0.5, 0.5, 0, c_black, chosenTextAlpha);
			draw_sprite_ext(_rankSChar, _rankSCharCost, 225 + (_rankSTextWidth + 14), 153, 0.5, 0.5, 0, c_black, chosenTextAlpha);
			
			draw_text_transformed_color(200, 150, _rankScoreText + _score0 + _scoreCheck, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			draw_sprite_ext(ranks[_actualScore + _plusUltra], rankFrames, 200 + (_rankSTextWidth + 14), 150, 0.5, 0.5, 0, c_white, chosenTextAlpha);
			draw_sprite_ext(_rankSChar, _rankSCharCost, 228 + (_rankSTextWidth + 14), 150, 0.5, 0.5, 0, c_white, chosenTextAlpha);
		#endregion
		
		#region //Trinkets
			var _actualRings = _levelDesc.rings_Rank;
			var _rankRChar = _levelDesc.player_SpriteRings;
			var _rankRCharCost = _levelDesc.player_CostumeRings;
			var _extraRings = "x";
			var _rings = _levelDesc.rings;
			
			if _rings < 100 && _rings >= 10 {
				_extraRings = "x0";
			} else if _rings < 10 {
				_extraRings = "x00";
			}
			
			var _allText = " " + _extraRings + string(_rings);
			var _allTextWidth = string_width(scr_LocalText("freeplay_Trinkets") + _allText);
			
			draw_text_transformed_color(197, 183, scr_LocalText("freeplay_Trinkets") + _allText, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
			
			
			draw_text_transformed_color(200, 180, scr_LocalText("freeplay_Trinkets") + _allText, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			draw_sprite_ext(ranks[_actualRings + _plusUltra], rankFrames, 200 + (_allTextWidth + 14), 180, 0.5, 0.5, 0, c_white, chosenTextAlpha);
			draw_sprite_ext(_rankRChar, _rankRCharCost, 228 + (_allTextWidth + 14), 180, 0.5, 0.5, 0, c_white, chosenTextAlpha);
		#endregion
		
		#region //Enemies Killed
			var _actualEnemy = _levelDesc.enemy_Rank;
			var _rankEChar = _levelDesc.player_SpriteEnemy;
			var _rankECharCost = _levelDesc.player_CostumeEnemy;
			var _extraEnemies = "x";
			var _enemies = _levelDesc.enemies;
			var _allText2 = " " + _extraEnemies + string(_enemies);
			var _allText2Width = string_width(scr_LocalText("freeplay_Enemies") + _allText2);
			
			draw_text_transformed_color(197, 213, scr_LocalText("freeplay_Enemies") + _allText2, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
			
			
			draw_text_transformed_color(200, 210, scr_LocalText("freeplay_Enemies") + _allText2, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			draw_sprite_ext(ranks[_actualEnemy + _plusUltra], rankFrames, 200 + (_allText2Width + 14), 210, 0.5, 0.5, 0, c_white, chosenTextAlpha);
			draw_sprite_ext(_rankEChar, _rankECharCost, 228 + (_allText2Width + 14), 210, 0.5, 0.5, 0, c_white, chosenTextAlpha);
		#endregion
		
		#region //Level Description
			draw_set_halign(fa_center);
				draw_text_ext_transformed_color(384, 249, scr_LocalText("freeplay_Desc") + "\n----------------------------------------------------------------------------------\n" + scr_LocalText(_descText), 21, 740, 0.85, 0.85, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
				draw_text_ext_transformed_color(384, 246, scr_LocalText("freeplay_Desc") + "\n----------------------------------------------------------------------------------\n" + scr_LocalText(_descText), 21, 740, 0.85, 0.85, 0, c_white, c_white, _textCol2, _textCol2, chosenTextAlpha);
			draw_set_halign(fa_left);
		#endregion
		
		#region //Buttons
			var _button = obj_CustomAct1KeySpeed.sprite_index;
			var _backWidth = sprite_get_width(obj_CustomAct1KeySpeed.sprite_index);
			
			#region //Replay Button
				var _replayCol = c_grey;
				var _replayText = scr_LocalText("results_ReplayText");
				var _replayBut = obj_CustomAct2KeySpeed.image_index;
				var _dir = working_directory + "/replay" + string(global.speedStageData[global.SpeedSelected].folder_Name);
			
				if file_exists(_dir + string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav") && file_exists(_dir + "Char" + string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav") {
					_replayCol = c_white;
				}
				
				draw_set_halign(fa_right);
					draw_text_transformed_color(703, 93, _replayText, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
					draw_sprite_ext(_button, _replayBut, 623, 73, 1, 1, 0, c_black, chosenTextAlpha);
				
					draw_text_transformed_color(700, 90, _replayText, 1, 1, 0, c_white, c_white, _replayCol, _replayCol, chosenTextAlpha);
					draw_sprite_ext(_button, _replayBut, 620, 70, 1, 1, 0, _replayCol, chosenTextAlpha);
				draw_set_halign(fa_left);
				
			#endregion
			
			#region //Back Button
				var _butBack = obj_CustomAct1KeySpeed.image_index;
				var _backText = scr_LocalText("fs_Back");
				
				draw_sprite_ext(_button, _butBack, 67, 383, 1, 1, 0, c_black, chosenTextAlpha);
				draw_text_transformed_color(67 + _backWidth + 10, 373, _backText, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
				
				draw_sprite_ext(_button, _butBack, 70, 380, 1, 1, 0, c_white, chosenTextAlpha);
				draw_text_transformed_color(70 + _backWidth + 10, 370, _backText, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			#endregion
				
			#region //Play Track
				var _butTrack = obj_CustomAct4KeySpeed.image_index;
				var _trackText = scr_LocalText("freeplay_Track");
				var _extraWidth1 = string_width(_backText) + 10 + _backWidth + 20;
				
				if !global.Girly {
					if obj_MusicManager.songAsset == _levelDesc.musicTrack {
						_trackText = scr_LocalText("freeplay_StopTrack");
					}
				} else {
					if obj_MusicManager.songAsset == _levelDesc.musicTrackGirly {
						_trackText = scr_LocalText("freeplay_StopTrack");
					}
				}
				
				draw_sprite_ext(_button, _butTrack, 70 + _extraWidth1, 383, 1, 1, 0, c_black, chosenTextAlpha);
				draw_text_transformed_color(70 + _extraWidth1 + _backWidth + 10, 373, _trackText, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
				
				draw_sprite_ext(_button, _butTrack, 70 + _extraWidth1, 380, 1, 1, 0, c_white, chosenTextAlpha);
				draw_text_transformed_color(70 + _extraWidth1 + _backWidth + 10, 370, _trackText, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			#endregion
			
			#region //Select
				var _butSelect = obj_CustomJumpKeySpeed.image_index;
				var _selectText = scr_LocalText("fs_Select");
				var _extraWidth2 = _extraWidth1 + string_width(_trackText) + 10 + _backWidth + 20;
				
				draw_sprite_ext(_button, _butSelect, 73 + _extraWidth2, 383, 1, 1, 0, c_black, chosenTextAlpha);
				draw_text_transformed_color(73 + _extraWidth2 + _backWidth + 10, 373, _selectText, 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
				
				draw_sprite_ext(_button, _butSelect, 70 + _extraWidth2, 380, 1, 1, 0, c_white, chosenTextAlpha);
				draw_text_transformed_color(70 + _extraWidth2 + _backWidth + 10, 370, _selectText, 1, 1, 0, c_white, c_white, c_white, c_white, chosenTextAlpha);
			#endregion
			
			#region //Custom Music (I'm Shadow Freddy. I'm so awesome and black.)
				var _custCol = c_grey;
				var _custText = "freeplay_JukeOff";
				
				if jukeCheck {
					_custText = "freeplay_JukeOn";
				}
				
				if _levelDesc.complete {
					_custCol = c_white;
				}
			
				draw_set_halign(fa_right);
					draw_text_transformed_color(703, 173, scr_LocalText(_custText), 1, 1, 0, c_black, c_black, c_black, c_black, chosenTextAlpha);
					draw_sprite_ext(_button, obj_CustomRightKeySpeed.image_index, 623, 148, 1, 1, 0, c_black, chosenTextAlpha);
				
					draw_text_transformed_color(700, 170, scr_LocalText(_custText), 1, 1, 0, c_white, c_white, _custCol, _custCol, chosenTextAlpha);
					draw_sprite_ext(_button, obj_CustomRightKeySpeed.image_index, 620, 145, 1, 1, 0, _custCol, chosenTextAlpha);
				draw_set_halign(fa_left);
			#endregion
		#endregion
	}
#endregion

#region //Change Characters
	if !speedStage && !actionStage {
		var _press = scr_LocalText("freeplay_ChooseChar1") + " " + string(obj_CustomAct4KeySpeed.keyText) + " " + scr_LocalText("freeplay_ChooseChar2");
		var _press2 = scr_LocalText("freeplay_ChooseChar1") + " " + string(obj_CustomAct2KeySpeed.keyText) + " " + scr_LocalText("freeplay_ChooseJuke");
		
		
		draw_set_halign(fa_center);
			draw_text_transformed_color(384, 53, _press, 1, 1, 0, c_black, c_black, c_black, c_black, changeCharAlpha);
			draw_text_transformed_color(384, 50, _press, 1, 1, 0, c_white, c_white, c_white, c_white, changeCharAlpha);
			
			draw_text_transformed_color(384, 78, _press2, 1, 1, 0, c_black, c_black, c_black, c_black, changeCharAlpha);
			draw_text_transformed_color(384, 75, _press2, 1, 1, 0, c_white, c_white, c_white, c_white, changeCharAlpha);
		draw_set_halign(fa_left);
	}
#endregion

#region //Sonic Rush Spikes
	if !global.SimplifyVFX {
		srSpikesFrames += srSpikesAnim;
	}

	if srSpikesFrames >= 20 {
		srSpikesFrames = 0;
	}

	draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesFrames, 0 - srSpikesX, 0, 2, 2, 0, global.fullRGB, 1);
	draw_sprite_ext(spr_SonicRushSpikesNorm, -srSpikesFrames + 20, 769 + srSpikesX, 0, -2, 2, 0, global.fullRGB, 1);
#endregion
