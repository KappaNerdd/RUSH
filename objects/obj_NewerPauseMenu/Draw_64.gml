display_set_gui_size(768, 432);

var _camWidth = 768;
var _camHeight = 432;

#region //BG
	draw_sprite_ext(sprite_index, image_index, -10, -10, 25, 15, 0, #444444, image_alpha);
	draw_sprite_ext(sideBar, mindFrames, backSideX + 5, 0, 1, 1, 0, c_black, 1);
	draw_sprite_ext(sideBar, mindFrames, backSideX, 0, 1, 1, 0, global.fullRGB, 1);

	draw_text_transformed_color(backSideX + 755 + ((charNameX + (768 / 2)) / 1.55), 5 + (charNameX + (768 / 2)), scr_LocalText("menu_Paused"), 2, 2, -57, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(backSideX + 755 + ((charNameX + (768)) / 1.55), 5 + (charNameX + (768)), scr_LocalText("menu_Paused"), 2, 2, -57, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(backSideX + 755 + ((charNameX + (768 * 1.5)) / 1.55), 5 + (charNameX + (768 * 1.5)), scr_LocalText("menu_Paused"), 2, 2, -57, c_black, c_black, c_black, c_black, 1);

	draw_text_transformed_color(backSideX + 750 + ((charNameX + (768 / 2)) / 1.55), 0 + (charNameX + (768 / 2)), scr_LocalText("menu_Paused"), 2, 2, -57, c_white, c_white, global.fullRGB, global.fullRGB, 1);
	draw_text_transformed_color(backSideX + 750 + ((charNameX + (768)) / 1.55), 0 + (charNameX + (768)), scr_LocalText("menu_Paused"), 2, 2, -57, c_white, c_white, global.fullRGB, global.fullRGB, 1);
	draw_text_transformed_color(backSideX + 750 + ((charNameX + (768 * 1.5)) / 1.55), 0 + (charNameX + (768 * 1.5)), scr_LocalText("menu_Paused"), 2, 2, -57, c_white, c_white, global.fullRGB, global.fullRGB, 1);
	
	if instance_exists(obj_StageTrackerSpeed) or instance_exists(obj_StageTrackerAction) {
		draw_sprite_ext(obj_CustomSelectKeySpeed.sprite_index, obj_CustomSelectKeySpeed.image_index, backSideX + 507, 83, 1, 1, 0, c_black, 1);
		draw_sprite_ext(restart, mindFrames, backSideX + 527, 113, 1, 1, 0, c_black, 1);
		draw_text_transformed_color(backSideX + 507, 133, scr_LocalText("menu_QRestart"), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
	
		draw_sprite_ext(obj_CustomSelectKeySpeed.sprite_index, obj_CustomSelectKeySpeed.image_index, backSideX + 510, 80, 1, 1, 0, c_white, 1);
		draw_sprite_ext(restart, mindFrames, backSideX + 530, 110, 1, 1, 0, c_white, 1);
		draw_text_transformed_color(backSideX + 510, 130, scr_LocalText("menu_QRestart"), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	}
#endregion

#region //Choices
	var _choicesNames = "";
	var _choiceLength = overworld;
	var _rushBS = 60;
	var _pauseArrow = spr_PauseArrow;
	var _dir = working_directory + "/saves/" + string(global.PastMindDataFile) + ".sav";
	
	if global.MIND or global.PlayerChar == 0 {
		_pauseArrow = spr_PauseArrowHead;
	}
	
	if !global.Freeplay {
		if instance_exists(obj_StageTrackerSpeed) {
			#region //Choice Names
				if choice == 0 {
					_choicesNames = scr_LocalText("menu_Resume");
				}
				
				if choice == 1 {
					_choicesNames = scr_LocalText("menu_Restart");
				}
				
				if choice == 2 {
					_choicesNames = scr_LocalText("fs_FileSelect");
				}
				
				if choice == 3 {
					_choicesNames = scr_LocalText("title_Options");
				}
				
				if choice == 4 {
					if file_exists(_dir) {
						_choicesNames = scr_LocalText("menu_MainMenu");
					} else {
						_choicesNames = scr_LocalText("title_QuitGame");
					}
				}
				
				if choice == 5 {
					_choicesNames = scr_LocalText("title_QuitGame");
				}
			#endregion
			
			if file_exists(_dir) {
				_choiceLength = speedStg;
			} else {
				_choiceLength = speedMind;
			}
			
			_rushBS = 360 / array_length(_choiceLength);
		} else if instance_exists(obj_StageTrackerAction) {
			_choiceLength = actionStg;
			_rushBS = 60;
			
			#region //Choice Names
				if choice == 0 {
					_choicesNames = scr_LocalText("menu_Resume");
				}
				
				if choice == 1 {
					_choicesNames = scr_LocalText("menu_Restart");
				}
				
				if choice == 2 {
					_choicesNames = scr_LocalText("fs_FileSelect");
				}
				
				if choice == 3 {
					_choicesNames = scr_LocalText("title_Options");
				}
				
				if choice == 4 {
					_choicesNames = scr_LocalText("menu_MainMenu");
				}
				
				if choice == 5 {
					_choicesNames = scr_LocalText("title_QuitGame");
				}
			#endregion
		} else {
			if file_exists(_dir) {
				_choiceLength = overworld;
			} else {
				_choiceLength = overworldMind;
			}
			
			_rushBS = 360 / array_length(_choiceLength);
			
			#region //Choice Names
				if choice == 0 {
					_choicesNames = scr_LocalText("menu_Resume");
				}
				
				if choice == 1 {
					_choicesNames = scr_LocalText("fs_FileSelect");
				}
				
				if choice == 2 {
					_choicesNames = scr_LocalText("title_Options");
				}
				
				if choice == 3 {
					if file_exists(_dir) {
						_choicesNames = scr_LocalText("menu_MainMenu");
					} else {
						_choicesNames = scr_LocalText("title_QuitGame");
					}
				}
				
				if choice == 4 {
					_choicesNames = scr_LocalText("title_QuitGame");
				}
			#endregion
		}
	} else {
		_choiceLength = freeplay;
		_rushBS = 51;
		
		#region //Choice Names
			if choice == 0 {
				_choicesNames = scr_LocalText("menu_Resume");
			}
				
			if choice == 1 {
				_choicesNames = scr_LocalText("menu_Restart");
			}
				
			if choice == 2 {
				_choicesNames = scr_LocalText("title_Freeplay");
			}
				
			if choice == 3 {
				_choicesNames = scr_LocalText("fs_FileSelect");
			}
				
			if choice == 4 {
				_choicesNames = scr_LocalText("title_Options");
			}
				
			if choice == 5 {
				_choicesNames = scr_LocalText("menu_MainMenu");
			}
				
			if choice == 6 {
				_choicesNames = scr_LocalText("title_QuitGame");
			}
		#endregion
	}
	
	var _array = array_length(_choiceLength);

	draw_sprite_ext(spr_CharSelectRushBallWhite, 0, rushBallX - 3, _camHeight - 87, 1, 1, rushBallAngle, c_black, 1);
	draw_sprite_ext(spr_CharSelectRushBall2, 0, rushBallX - 3, _camHeight - 87, 1, 1, 0, c_black, 1);
	draw_sprite_ext(spr_CharSelectRushBallWhite, 0, rushBallX, _camHeight - 90, 1, 1, rushBallAngle, c_white, 1);
	draw_sprite_ext(spr_CharSelectRushBall2, 0, rushBallX, _camHeight - 90, 1, 1, rushBallAngle, global.fullRGB, 1);
	draw_sprite_ext(spr_CharSelectRushBall2, 1, rushBallX, _camHeight - 90, 1, 1, 0, global.fullRGB, 1);
	draw_sprite_ext(global.PlayerSelection[global.PlayerChar][28][3], global.MIND, rushBallX, _camHeight - 90, 1, 1, rushBallAngle, c_white, 1);
	
	draw_sprite_ext(_pauseArrow, mindFrames, rushBallX * 2.55 - 3, _camHeight - 40 + 15, 1, 0.5, 0, c_black, 1);
	draw_text_transformed_color(rushBallX * 2.55 - 3,  - 40 + 3, _choicesNames, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
	draw_sprite_ext(_pauseArrow, mindFrames, rushBallX * 2.55, _camHeight - 40 + 12, 1, 0.5, 0, global.fullRGB, 1);
	draw_text_transformed_color(rushBallX * 2.55, _camHeight - 40, _choicesNames, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	
	for(var i = 0; i < _array; i++) {
		var _extraX = lengthdir_x(120, (rushBallAngle + (_rushBS * i)));
		var _extraY = lengthdir_y(120, (rushBallAngle + (_rushBS * i)));
		var _alpha = 1;
		
		if choice != i {
			_alpha = 0.5;
		}
		
		draw_sprite_ext(_choiceLength[i][1], mindFrames, rushBallX + _extraX - 3, _camHeight - 90 + _extraY + 3, 1.5, 1.5, rushBallAngle + (_rushBS * i), c_black, _alpha);
		draw_sprite_ext(_choiceLength[i][1], mindFrames, rushBallX + _extraX, _camHeight - 90 + _extraY, 1.5, 1.5, rushBallAngle + (_rushBS * i), c_white, _alpha);
	}
#endregion

#region //Character
	var _charX = 550 + charX;
	var _charY = charY + charY2;
	
	draw_sprite_ext(_charSprite, global.PlayerCostume, _charX + 10, _charY + 10, 0.5, 0.5, charAngle, c_black, 1);
	draw_sprite_ext(_charSprite, global.PlayerCostume, _charX, _charY, 0.5, 0.5, charAngle, c_white, 1);
	
	draw_sprite_ext(global.PlayerSelection[global.PlayerChar][12][0], global.MIND, 605, charY2 + 155, 0.75, 0.75, -charAngle, c_black, 1);
	draw_sprite_ext(global.PlayerSelection[global.PlayerChar][12][0], global.MIND, 600, charY2 + 150, 0.75, 0.75, -charAngle, c_white, 1);
#endregion

#region //Character Name
	draw_sprite_ext(sprite_index, image_index, -10, nameCharY + 3, 27, 1, 0, c_black, 1);
	draw_sprite_ext(sprite_index, image_index, -10, nameCharY, 27, 1, 0, c_grey, 1);
	draw_sprite_ext(spr_TextboxTrans, image_index, -10, nameCharY, 27, 1, 0, c_white, 1);

	draw_set_halign(fa_right);
		var _col = c_white;
		var _col2 = c_black;
		var _charName = scr_LocalText(global.PlayerSelection[global.PlayerChar][0][0]);

		draw_text_transformed_color(charNameX + 768, nameCharY + 7, string(_charName), 1, 1, 0, _col2, _col2, _col2, _col2, 1);
		draw_text_transformed_color(charNameX + 768 / 2, nameCharY + 7, string(_charName), 1, 1, 0, _col2, _col2, _col2, _col2, 1);
		draw_text_transformed_color(charNameX + 768, nameCharY + 7, string(_charName), 1, 1, 0, _col2, _col2, _col2, _col2, 1);
		draw_text_transformed_color(charNameX + 768 * 1.5, nameCharY + 7, string(_charName), 1, 1, 0, _col2, _col2, _col2, _col2, 1);
		draw_text_transformed_color(charNameX + 768 * 2, nameCharY + 7, string(_charName), 1, 1, 0, _col2, _col2, _col2, _col2, 1);
	
		draw_text_transformed_color(charNameX + 768, nameCharY + 4, string(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768 / 2, nameCharY + 4, string(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768, nameCharY + 4, string(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768 * 1.5, nameCharY + 4, string(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
		draw_text_transformed_color(charNameX + 768 * 2, nameCharY + 4, string(_charName), 1, 1, 0, _col, _col, _col, _col, 1);
	draw_set_halign(fa_left);
#endregion

#region //Confirm
	var _conCol = c_grey;
	var _conCol2 = c_grey;

	if confirmChoice == 0 {
		_conCol = global.fullRGB;
	} else {
		_conCol2 = global.fullRGB;
	}

	draw_sprite_ext(sprite_index, image_index, 304, confirmY + 5, 5, 5, 0, c_black, 1);
	draw_sprite_ext(sprite_index, image_index, 304, confirmY, 5, 5, 0, #444444, 1);
	draw_sprite_ext(spr_TextboxTrans, image_index, 304, confirmY, 5, 5, 0, c_white, 1);
	
	draw_set_halign(fa_center);
		draw_text_transformed_color(384, confirmY + 8 + 7, scr_LocalText("opt_Yes"), 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(384, confirmY + 8, scr_LocalText("opt_Yes"), 1.5, 1.5, 0, c_white, _conCol, _conCol, _conCol, 1);
		
		draw_text_transformed_color(384, confirmY + 96 + 7, scr_LocalText("opt_No"), 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(384, confirmY + 96 + 4, scr_LocalText("opt_No"), 1.5, 1.5, 0, c_white, _conCol2, _conCol2, _conCol2, 1);
	draw_set_halign(fa_left);
#endregion
