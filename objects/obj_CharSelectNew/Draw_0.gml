display_set_gui_size(768, 432);

var _camX = 0;
var _camY = 0;

//[28][3]

#region //BG	
	draw_sprite_ext(sprite_index, image_index, _camX, _camY, image_xscale, image_yscale, 0, global.fullRGB, image_alpha);
	draw_sprite_ext(sprite_index, image_index, _camX, _camY, image_xscale, image_yscale, 0, c_white, confirmedOpacity * image_alpha);
#endregion
	
#region //UI
	#region //Box & Name
		var _charSel = global.PlayerSelection[global.SelectedPlayer];
		var _charName = _charSel[0][0];
		var _charBox = _charSel[6][0];
		var _charBoxAnim = _charSel[6][1];
		var _col = c_white;
		
		if _charSel[2] {
			_charName = "?????";
		} else {
			_charName = _charSel[0][0];
		}
		
		if charBoxFrames < _charBoxAnim && !global.SimplifyVFX {
			charBoxFrames += 1 / 6;
		} else {
			charBoxFrames = 0;
		}
		
		draw_sprite_ext(_charBox, charBoxFrames, _camX - 10, _camY + charBoxY, 25, 1, 0, c_grey, 1);
		draw_sprite_ext(spr_TextboxTrans, 0, _camX - 10, _camY + charBoxY, 25, 1, 0, c_white, 1);
		
		draw_set_halign(fa_right);
			draw_text_transformed_color(_camX + charNameX, _camY + charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
			draw_text_transformed_color(_camX + charNameX + charNameXRepeat / 2, _camY + charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
			draw_text_transformed_color(_camX + charNameX + charNameXRepeat, _camY + charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
			draw_text_transformed_color(_camX + charNameX + charNameXRepeat * 1.5, _camY + charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
			draw_text_transformed_color(_camX + charNameX + charNameXRepeat * 2, _camY + charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_set_halign(fa_left);
	#endregion

	#region //Rush Ball Back
		var _x = 200;
		var _iconCol = c_white;
	
		draw_sprite_ext(spr_CharSelectRushBallWhite, 0, _camX + _x, _camY + 210, ballScale + (iconScale / 2), ballScale + (iconScale / 2), ballAngle, c_white, 1);
		draw_sprite_ext(spr_CharSelectRushBall2, 0, _camX + _x, _camY + 210, ballScale + (iconScale / 2), ballScale + (iconScale / 2), ballAngle, global.fullRGB, 1);
		draw_sprite_ext(spr_CharSelectRushBall2, 1, _camX + _x, _camY + 210, otherBallScale + (iconScale / 1.5), otherBallScale + (iconScale / 1.5), -ballAngle, c_white, 1);
		draw_sprite_ext(spr_CharSelectRushBall2, 1, _camX + _x, _camY + 210, otherBallScale + (iconScale / 1.5), otherBallScale + (iconScale / 1.5), -ballAngle, c_white, confirmedOpacity);
		
		if global.PlayerSelection[global.SelectedPlayer][2] {
			_iconCol = c_black;
		}
		
		draw_sprite_ext(global.PlayerSelection[global.SelectedPlayer][28][3], 0, _camX + _x, _camY + 210, ballScale + iconScale, ballScale + iconScale, iconAngle, _iconCol, 1);
	#endregion
	
	#region //Characters
		for(var i = 0; i < array_length(global.PlayerSelection); i++) {
			var _char = global.PlayerSelection[i];
			var _actChar = _char[26][0];
			var _gap = 700;
			var _col = c_white;
			
			if _char[2] or !global.PlayerSelection[global.SelectedPlayer][4][global.PlayerCostume][0] {
				_col = c_black;
			}
			
			if _char[1] {
				gpu_set_fog(true, c_white, 0, 0);
					draw_sprite_ext(_actChar, global.PlayerCostume, _camX + charX + (_gap * i) - 10, _camY + 70 + charY, 0.5, 0.5, 0, _col, 1);
				gpu_set_fog(false, c_black, 0, 0);
					
				draw_sprite_ext(_actChar, global.PlayerCostume, _camX + charX + (_gap * i), _camY + 60 + charY, 0.5, 0.5, 0, _col, 1);
			}
		}
	#endregion
	
 	#region //Bottom Shit
		draw_sprite_ext(spr_CharSelectWhiteBar, 0, _camX + 384, _camY + bottomShitY - 120, whiteBarScale, 1, 0, c_white, 1);
	
		for(var i = 0; i < array_length(global.PlayerSelection); i++) {
			var _char = global.PlayerSelection[i];
			var _col1 = _char[5][0];
			var _col2 = _char[5][1];
			var _col3 = _char[5][2];
			var _col = make_color_rgb(_col1, _col2, _col3);
			var _alpha = 1;
			var _lockAnim = 0;
			var _gap = 120;
			
			if global.SelectedPlayer == i {
				_lockAnim = lockFrames;
			}
			
			if _char[2] && _char[1] {
				_alpha = 0.5;
				draw_sprite_ext(spr_FreeplayLock, _lockAnim, _camX + whiteBallX + (_gap * i), _camY + bottomShitY - 190, 1, 1, 0, c_white, 1);
			}
			
			if !_char[1] {
				_col = c_black;
			}
			
			if i != 0 {
				draw_sprite_ext(spr_CharSelectWhiteBall, whiteBallFrames, _camX + whiteBallX + (_gap * i), _camY + bottomShitY - 120, whiteCircleScale, whiteCircleScale, 0, _col, _alpha);
			}
		}
		
		draw_sprite_ext(spr_CharSelectWhiteCircle, 0, _camX + 384, _camY + bottomShitY - 120, circleScale, circleScale, 0, c_white, 1);
		
		draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesFrames, _camX + srSpikesX, _camY, 2, 2, 0, global.fullRGB, 1);
		draw_sprite_ext(spr_SonicRushSpikesNorm, -srSpikesFrames + 19, _camX + srSpikesNegaX, _camY, -2, 2, 0, global.fullRGB, 1);
		draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesFrames, _camX + srSpikesX, _camY, 2, 2, 0, c_white, confirmedOpacity);
		draw_sprite_ext(spr_SonicRushSpikesNorm, -srSpikesFrames + 19, _camX + srSpikesNegaX, _camY, -2, 2, 0, c_white, confirmedOpacity);
		
		draw_sprite_ext(spr_CharSelectBottom, 0, _camX, _camY + bottomShitY, 1.47977, 1, 0, global.fullRGB, 1);
		draw_sprite_ext(spr_CharSelectBottom, 0, _camX, _camY + bottomShitY, 1.47977, 1, 0, c_white, confirmedOpacity);
		
		if !global.PlayerSelection[global.PlayerChar][2] && global.PlayerSelection[global.PlayerChar][1] {
			var _gloChar = global.PlayerSelection[global.SelectedPlayer];
			var _colChar = c_white;
			var _costName = _gloChar[4][global.PlayerCostume][3];
			
			if !_gloChar[4][global.PlayerCostume][0] {
				_colChar = c_black;
				_costName = "?????";
			}
			
			draw_sprite_ext(_gloChar[12][0], 0, _camX + 384, _camY + charNameY + bottomShitY - 95, nameScale, nameScale, 0, c_white, 1);
			
			draw_sprite_ext(_gloChar[4][global.PlayerCostume][1], charSpriteFrames, _camX + 384, _camY + 240 + (charSpriteX - 30), 1, 1, 0, _colChar, charSpriteAlpha);
			
			draw_set_halign(fa_right);
				draw_text_transformed_color(_camX + 725, _camY + 50 + (charSpriteX - 50), scr_LocalText("cost_Cost") + ": " + scr_LocalText(_costName), 1, 1, 0, c_white, c_white, c_white, c_white, charSpriteAlpha);
			draw_set_halign(fa_left);
		}
		
		//draw_sprite_ext(global.PlayerSelection[global.PlayerChar][12][0], 0, _camX + 384, _camY + charNameY + bottomShitY - 95, nameScale, nameScale, 0, c_white, 1);
		
		var _arrowAnim = 0;
		var _arrowAnim2 = 0;
		
		if arrowRight {
			_arrowAnim = arrowFrames;
		} else if arrowLeft {
			_arrowAnim2 = arrowFrames;
		}
		
		draw_sprite_ext(spr_CharSelectArrow, _arrowAnim2, _camX + 214, _camY + bottomShitY - 95, -arrowScale, arrowScale, 0, c_white, 1);
		draw_sprite_ext(spr_CharSelectArrow, _arrowAnim, _camX + 554, _camY + bottomShitY - 95, arrowScale, arrowScale, 0, c_white, 1);
		
		var _iconSprite = global.PlayerSelection[global.PlayerChar][17][0];
		//var _iconSprite2 = global.PlayerSelection[global.PartnerChar][17][0];
		var _iconBlack = c_white;
		
		if global.PlayerSelection[global.PlayerChar][2] or !_gloChar[4][global.PlayerCostume][0] {
			_iconBlack = c_black;
		}
		
		draw_sprite_ext(_iconSprite, global.PlayerCostume, _camX + 715, _camY + bottomShitY - 120, circleScale - 0.35, circleScale - 0.35, 0, _iconBlack, 1);
		//draw_sprite_ext(_iconSprite2, global.PartnerCostume, _camX + 710, _camY + bottomShitY - 95, circleScale - 0.35, circleScale - 0.35, 0, _iconBlack, 1);
		
	#endregion
	
#endregion
	
#region //Buttons (Kinda)
	#region //Confirm
		var _button = obj_CustomJumpKeySpeed.sprite_index;

		if !global.PlayerSelection[global.SelectedPlayer][2] {
			draw_sprite_ext(_button, obj_CustomJumpKeySpeed.image_index, _camX + 352, _camY + bottomShitY - 190, 1, 1, 0, c_white, 1);
		}
	#endregion
	
	#region //Costumes
		var _costumeLength = array_length(global.PlayerSelection[global.SelectedPlayer][4]);
	
		if _costumeLength > 1 {
			var _arrowAnim3 = 0;
			var _arrowAnim4 = 0;
			
			if arrowUp {
				_arrowAnim3 = arrowFrames;
			} else if arrowDown {
				_arrowAnim4 = arrowFrames;
			}
			
			draw_sprite_ext(spr_CharSelectArrow, _arrowAnim3, _camX + 350, _camY + 70, arrowScale - 0.75, arrowScale - 0.75, 90, c_white, arrowAlpha);
			draw_sprite_ext(spr_CharSelectArrow, _arrowAnim4, _camX + 350, _camY + 130, arrowScale - 0.75, arrowScale - 0.75, -90, c_white, arrowAlpha);
			draw_sprite_ext(spr_CharSelectCostume, 0, _camX + 350, _camY + 100, 2 + (iconScale), 2 + (iconScale), 0, c_white, arrowAlpha);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
				draw_text_transformed_color(_camX + 350, _camY + 100, string(global.PlayerCostume + 1), 1 + (iconScale), 1 + (iconScale), 0, c_white, c_white, c_white, c_white, arrowAlpha);
			draw_set_valign(fa_top);
			draw_set_halign(fa_left);
		}
	#endregion
	
	#region //Stats & Moves
		var _charStat = global.PlayerSelection[global.SelectedPlayer][13];
		var _questionStat = "??";
	
		draw_sprite_ext(spr_SideBarR, 0, _camX - 970 + checkStatsX, _camY, 1, 1, 0, global.fullRGB, 1);
		draw_sprite_ext(spr_SideBarR, 1, _camX - 970 + checkStatsX, _camY, 1, 1, 0, c_white, 0.1);
		draw_sprite_ext(spr_SideBarR, 0, _camX - 1450 + checkStatsX, _camY, 1, 1, 0, global.fullRGB, 1);
		
		draw_set_halign(fa_right);
			draw_text_transformed(_camX - 420 + checkStatsX, _camY + 10, scr_LocalText("freeplay_Speed"), 1.4, 1.5, 0);
		draw_set_halign(fa_left);
		
		if checkStats {
			var _accStat = _charStat[1];
			var _accText = scr_LocalText("charSel_Acc");
			
			var _jumpStat = _charStat[2];
			var _jumpText = scr_LocalText("charSel_Jump");
			
			var _gravStat = _charStat[3];
			var _gravText = scr_LocalText("charSel_Grav");
			
			var _maxStat = _charStat[4];
			var _maxText = scr_LocalText("charSel_Max");
			
			var _breakStat = _charStat[5];
			var _breakText = scr_LocalText("charSel_Break");
			
			var _boostStat = _charStat[6];
			var _boostText = scr_LocalText("charSel_Boost");
			
			if global.PlayerSelection[global.SelectedPlayer][2] {
				_accStat = 0;
				_jumpStat = 0;
				_gravStat = 0;
				_maxStat = 0;
				_breakStat = 0;
				_boostStat = 0;
			}
		
			draw_text_transformed(_camX - 650 + checkStatsX, _camY + 80, scr_LocalText("charSel_Acc") + ": ", 1, 1, 0);
			draw_sprite_ext(spr_CharSelectSpeedStat, _accStat, _camX - (640 - string_width(_accText)) + checkStatsX, _camY + 80, 1, 1, 0, c_white, 1);
			
			draw_text_transformed(_camX - 625 + checkStatsX, _camY + 120, scr_LocalText("charSel_Jump") + ": ", 1, 1, 0);
			draw_sprite_ext(spr_CharSelectOtherStat, _jumpStat, _camX - (615 - string_width(_jumpText)) + checkStatsX, _camY + 120, 1, 1, 0, c_white, 1);
			
			draw_text_transformed(_camX - 600 + checkStatsX, _camY + 160, scr_LocalText("charSel_Grav") + ": ", 1, 1, 0);
			draw_sprite_ext(spr_CharSelectOtherStat, _gravStat, _camX - (595 - string_width(_gravText)) + checkStatsX, _camY + 160, 1, 1, 0, c_white, 1);
			
			draw_text_transformed(_camX - 575 + checkStatsX, _camY + 200, scr_LocalText("charSel_Max") + ": ", 1, 1, 0);
			draw_sprite_ext(spr_CharSelectSpeedStat, _maxStat, _camX - (563 - string_width(_maxText)) + checkStatsX, _camY + 200, 1, 1, 0, c_white, 1);
			
			draw_text_transformed(_camX - 550 + checkStatsX, _camY + 240, scr_LocalText("charSel_Break") + ": ", 1, 1, 0);
			draw_sprite_ext(spr_CharSelectSpeedStat, _breakStat, _camX - (540 - string_width(_breakText)) + checkStatsX, _camY + 240, 1, 1, 0, c_white, 1);
			
			draw_text_transformed(_camX - 525 + checkStatsX, _camY + 280, scr_LocalText("charSel_Boost") + ": ", 1, 1, 0);
			draw_sprite_ext(spr_CharSelectSpeedStat, _boostStat, _camX - (510 - string_width(_boostText)) + checkStatsX, _camY + 280, 1, 1, 0, c_white, 1);
		}
		
			
		if checkMoves {
			//draw_text_transformed(_camX - 660 + checkStatsX, _camY + 50, "UNIVERSAL MOVES", 0.8, 1, 0);
			//draw_sprite_ext(obj_CustomAct3KeySpeed.sprite_index, obj_CustomAct3KeySpeed.image_index, _camX - 510 + checkStatsX, _camY + 62, 1, 1, 0, c_white, 1);
			
			for(var i = 0; i < array_length(charMoveList[global.SelectedPlayer]); i++) {
				var _gapX = 34;
				var _gapY = 45;
				var _text = charMoveList[global.SelectedPlayer][i];
				var _textWidth = string_width(_text);
				var _xCheck = _camX - 660 + checkStatsX + (_gapX * i);
				var _yCheck = _camY + 80 + (_gapY * i);
				
				draw_text_transformed(_xCheck, _yCheck, string(_text), 0.8, 1, 0);
			}
		}
		
		var _charSel = global.PlayerSelection[global.SelectedPlayer];
		var _charBox = _charSel[6][0];
				
		draw_sprite_ext(_charBox, charBoxFrames, _camX + 768 + checkUniversalMovesX, _camY, 15, 15, 0, c_grey, 1);
		draw_sprite_ext(_charBox, 0, _camX + 768 + checkUniversalMovesX, _camY, 15, 15, 0, c_black, 0.4);
		draw_sprite_ext(spr_TextboxTrans, 0, _camX + 768 + checkUniversalMovesX, _camY, 15, 15, 0, c_white, 1);
		
		for(var i = 0; i < array_length(universalMoves); i++) {
			var _gapX = 0;
			var _gapY = 40;
			
			if i >= 8 {
				_gapY = 42;
			}
					
			draw_text_ext_transformed(_camX + 778 + checkUniversalMovesX + (_gapX * i), _camY + 4 + (_gapY * i), string(universalMoves[i]), 15, 625, 0.75, 1, 0);
		}
	
		//draw_sprite_ext(_button, obj_CustomAct2KeySpeed.image_index, _camX + 10, _camY + bottomShitY - 85, 1, 1, 0, c_white, 1);
		//draw_sprite_ext(spr_CharSelectSpeedStatPre, 0, _camX + 42, _camY + bottomShitY - 110, 1, 1, 0, c_white, 1);
		
		draw_sprite_ext(_button, obj_CustomAct4KeySpeed.image_index, _camX + 80, _camY + bottomShitY - 85, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_CharSelectOtherStatPre, 0, _camX + 112, _camY + bottomShitY - 110, 1, 1, 0, c_white, 1);
	#endregion

	#region //Ask Girly
		var _charSel2 = global.PlayerSelection[global.SelectedPlayer];
		var _charBox2 = _charSel2[6][0];
		var _cellCol1 = c_white; //Check out my perfect form. It's perfect.
		var _cellCol2 = c_white; //Check out my super perfect form. It's super perfect.
		var _setBoxX = 192;
		
		if askGirlySelect == 0 {
			_cellCol2 = c_grey;
		} else {
			_cellCol1 = c_grey;
		}
		
		askGirlyBoxX = lerp(askGirlyBoxX, _setBoxX * askGirlySelect, 0.25);
		
		draw_sprite_ext(_charBox2, charBoxFrames, _camX + 224, _camY + askGirlyY, 10, 5, 0, c_grey, 1);
		draw_sprite_ext(spr_TextboxTrans, charBoxFrames, _camX + 224, _camY + askGirlyY, 10, 5, 0, c_white, 1);
		
		draw_set_halign(fa_center);
			draw_text_transformed(_camX + 224 + 160, _camY + askGirlyY + 16, scr_LocalText("freeplay_Mix"), 1, 1, 0);
		draw_set_halign(fa_left);
		
		draw_sprite_ext(spr_TextboxTrans, 0, _camX + 256 + (askGirlyBoxX), _camY + askGirlyY + 108 - 32, 2, 2, 0, c_white, 1);
		
		draw_sprite_ext(spr_CharSelectBullshit, 0, _camX + 224 + 64, _camY + askGirlyY + 108, 2, 2, 0, _cellCol1, 1);
		draw_sprite_ext(spr_CharSelectBullshit, 1, _camX + 224 + 256, _camY + askGirlyY + 108, 2, 2, 0, _cellCol2, 1);
	#endregion
#endregion
