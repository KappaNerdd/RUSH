display_set_gui_size(768, 432);

var _pauseArrow = spr_PauseArrow;
var _arrowCol = global.fullRGB;

if global.MIND or global.PlayerChar == 0 {
	_pauseArrow = spr_PauseArrowHead;
	_arrowCol = c_white;
}

var _spr = global.PlayerSelection[global.PlayerChar][16][0];

draw_sprite_ext(sprite_index, image_index, setX, setY, 26, 12.5, 0, #232323, 1);
draw_sprite_ext(spr_TextboxTrans, image_index, setX, setY, 26, 12.5, 0, c_white, 1);

#region //Options
	for(var i = 0; i < array_length(allOpts); i++) {
		var _opt = allOpts[i][0];
		var _gap = 800;
		var _alpha = 0.5;
		var _drawX = optX + 413 + (_gap * i);
	
		if opt == i {
			_alpha = 1;
		}
	
		draw_set_halign(fa_center);
			if _drawX > -100 && _drawX < 800 {
				draw_text_transformed_color(setX + optX + 413 + (_gap * i), setY + 7, scr_LocalText(_opt), 1, 1, 0, c_black, c_black, c_black, c_black, _alpha);
				draw_text_transformed_color(setX + optX + 416 + (_gap * i), setY + 4, scr_LocalText(_opt), 1, 1, 0, c_white, c_white, c_white, c_white, _alpha);
			}
		draw_set_halign(fa_left);
		
		draw_sprite_ext(spr_CharSelectArrow, arrowFrames2, setX + 110, setY + 21, -0.75, 0.75, 0, c_black, 1);
		draw_sprite_ext(spr_CharSelectArrow, arrowFrames3, setX + 716, setY + 21, 0.75, 0.75, 0, c_black, 1);
		draw_sprite_ext(spr_CharSelectArrow, arrowFrames2, setX + 113, setY + 18, -0.75, 0.75, 0, global.fullRGB, 1);
		draw_sprite_ext(spr_CharSelectArrow, arrowFrames3, setX + 713, setY + 18, 0.75, 0.75, 0, global.fullRGB, 1);
	}
#endregion

#region //Audio
	for(var a = 0; a < array_length(audio); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX);
		var _gapY = 32;
		var _choice = audio[a][0];
		var _choice2 = "opt_Music";
		var _choice3 = "opt_SFX";
		var _choice4 = "opt_Text";
		var _choice5 = "opt_Ambiance";
		var _choice6 = "opt_Pause";
		var _choice7 = "opt_Footstep"
		var _choice8 = "opt_Invincible";
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 5 && a == 5 {
			_chosenCol2 = c_white;
		}
		
		if choice == 6 && a == 6 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(spr_AudioSlider, global.MASTER_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.MASTER_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(spr_AudioSlider, global.MUSIC_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.MUSIC_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(spr_AudioSlider, global.SFX_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.SFX_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(spr_AudioSlider, global.TEXT_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.TEXT_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			} else if a == 4 {
				_choice = _choice5;
				draw_sprite_ext(spr_AudioSlider, global.AMBIENCE_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice5)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.AMBIENCE_VOL * 10, setX + _gapX + string_width(scr_LocalText(_choice5)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			} else if a == 5 {
				_choice = _choice6;
				draw_sprite_ext(spr_OptionCheckbox, global.UniquePauseTheme, setX + _gapX + string_width(scr_LocalText(_choice6)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.UniquePauseTheme, setX + _gapX + string_width(scr_LocalText(_choice6)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 6 {
				_choice = _choice7;
				draw_sprite_ext(spr_OptionCheckbox, global.Footstep, setX + _gapX + string_width(scr_LocalText(_choice7)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.Footstep, setX + _gapX + string_width(scr_LocalText(_choice7)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 7 {
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 14, setY + 67 + (_gapY * a), "x" + string(global.TextSpd), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 64 + (_gapY * a), "x" + string(global.TextSpd), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
			}
		
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_spr, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_spr, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Visual
	for(var a = 0; a < array_length(visual); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + 800);
		var _gapY = 32;
		var _choice = visual[a][0];
		var _choice2 = "opt_ScrShk";
		var _choice3 = "opt_SimpVFX";
		var _choice4 = "opt_Part";
		var _choice5 = "opt_Outline";
		var _choice6 = "opt_Squash";
		var _choice7 = "opt_ConDis";
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		} else if choice == 4 && a == 4 {
			_chosenCol2 = c_white;
		} else if choice == 5 && a == 5 {
			_chosenCol2 = c_white;
		} else if choice == 6 && a == 6 {
			_chosenCol2 = c_white;
		} else if choice == 7 && a == 7 {
			_chosenCol2 = c_white;
		} else if choice == 8 && a == 8 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
		
			if a == 0 {
				draw_sprite_ext(spr_OptionCheckbox, global.ExtendCamera, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.ExtendCamera, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(spr_OptionCheckbox, global.ScreenShake, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.ScreenShake, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(spr_OptionCheckbox, global.SimplifyVFX, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.SimplifyVFX, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(spr_OptionCheckbox, global.Particles, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.Particles, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 4 {
				_choice = _choice5;
				draw_sprite_ext(spr_OptionCheckbox, global.Outline, setX + _gapX + string_width(scr_LocalText(_choice5)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.Outline, setX + _gapX + string_width(scr_LocalText(_choice5)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 5 {
				_choice = _choice6;
				draw_sprite_ext(spr_OptionCheckbox, global.Squash, setX + _gapX + string_width(scr_LocalText(_choice6)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.Squash, setX + _gapX + string_width(scr_LocalText(_choice6)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 6 {
					draw_sprite_ext(spr_OptionCheckbox, global.ConDisplay, setX + _gapX + string_width(scr_LocalText(_choice7)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.ConDisplay, setX + _gapX + string_width(scr_LocalText(_choice7)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Misc
	for(var a = 0; a < array_length(misc); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 2));
		var _gapY = 32;
		var _choice = misc[a][0];
		var _choice2 = "opt_TextSpd";
		var _choice3 = "opt_MusTag";
		var _choice4 = "opt_ConType";
		var _choice5 = "opt_ConRum";
		var _choice6 = "opt_Speedrun";
		var _choice7 = "opt_FPS";
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		} else if choice == 4 && a == 4 {
			_chosenCol2 = c_white;
		} else if choice == 5 && a == 5 {
			_chosenCol2 = c_white;
		} else if choice == 6 && a == 6 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
			
			if a == 0 {
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice)) + 14, setY + 67 + (_gapY * a), scr_LocalText("I might swerve-"), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 64 + (_gapY * a), scr_LocalText("I might swerve-"), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 14, setY + 67 + (_gapY * a), "x" + string(global.TextSpd), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 64 + (_gapY * a), "x" + string(global.TextSpd), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(spr_OptionCheckbox, global.SongTag, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.SongTag, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(spr_ConsoleLogos, global.ConType, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_ConsoleLogos, global.ConType, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 4 {
				_choice = _choice5;
				draw_sprite_ext(spr_OptionCheckbox, global.ConRumble, setX + _gapX + string_width(scr_LocalText(_choice5)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.ConRumble, setX + _gapX + string_width(scr_LocalText(_choice5)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 5 {
				_choice = _choice6;
				draw_sprite_ext(spr_OptionCheckbox, global.Speedrun, setX + _gapX + string_width(scr_LocalText(_choice6)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.Speedrun, setX + _gapX + string_width(scr_LocalText(_choice6)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 6 {
				_choice = _choice7;
				draw_sprite_ext(spr_OptionCheckbox, global.FPSOn, setX + _gapX + string_width(scr_LocalText(_choice7)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.FPSOn, setX + _gapX + string_width(scr_LocalText(_choice7)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Preferences
	for(var a = 0; a < array_length(pref); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 3));
		var _gapY = 32;
		var _choice = pref[a][0];
		var _choice2 = "opt_ChangeColor";
		var _choice3 = "opt_FocusLoss";
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(spr_OptionCheckbox, global.ColorCode, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.ColorCode, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 14, setY + 67 + (_gapY * a), "-  " + scr_LocalText(global.ColorBase[global.ChangeColor][1]), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 64 + (_gapY * a), "-  " + scr_LocalText(global.ColorBase[global.ChangeColor][1]), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(spr_OptionCheckbox, global.FocusLoss, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.FocusLoss, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Display
	for(var a = 0; a < array_length(display); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 4));
		var _gapY = 32;
		var _choice = display[a][0];
		var _choice2 = "opt_WindowSize";
		var _choice3 = "opt_VSync";
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(spr_OptionCheckbox, global.FullScreen, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.FullScreen, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 14, setY + 67 + (_gapY * a), "x" + string(global.WindowSize), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
				draw_text_transformed_color(setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 64 + (_gapY * a), "x" + string(global.WindowSize), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(spr_OptionCheckbox, global.VSync, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.VSync, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}

	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Online
	for(var a = 0; a < array_length(online); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 5));
		var _gapY = 32;
		var _choice = online[a][0];
		var _choice2 = "opt_Ghost";
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(spr_OptionCheckbox, global.ShowGhost, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 61 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_OptionCheckbox, global.ShowGhost, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 58 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Con General
	for(var a = 0; a < array_length(conGeneral); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 6));
		var _gapY = 32;
		var _choice = "opt_ConStart";
		var _choice2 = "opt_ConSelect";
		var _choice3 = "opt_JoyDead";
		var _choice4 = "opt_TrigDead";
		var _conSprite = obj_CustomJumpKeySpeed.sprite_index;
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(_conSprite, obj_CustomPauseKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomPauseKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(_conSprite, obj_CustomSelectKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomSelectKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(spr_AudioSlider, global.ConDeadZone * 10, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.ConDeadZone * 10, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(spr_AudioSlider, global.TrigDeadZone * 10, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 55 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(spr_AudioSlider, global.TrigDeadZone * 10, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 52 + (_gapY * a), 1, 1, 0, _chosenCol, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Con Speed 1
	for(var a = 0; a < array_length(conSpeed1); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 7));
		var _gapY = 32;
		var _choice = "opt_ConLeft";
		var _choice2 = "opt_ConRight";
		var _choice3 = "opt_ConUp";
		var _choice4 = "opt_ConDown";
		var _choice5 = "opt_ConJump";
		var _choice6 = "opt_ConAct1";
		var _conSprite = obj_CustomJumpKeySpeed.sprite_index;
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		} else if choice == 4 && a == 4 {
			_chosenCol2 = c_white;
		} else if choice == 5 && a == 5 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(_conSprite, obj_CustomLeftKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomLeftKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(_conSprite, obj_CustomRightKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomRightKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(_conSprite, obj_CustomUpKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomUpKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(_conSprite, obj_CustomDownKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomDownKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 4 {
				_choice = _choice5;
				draw_sprite_ext(_conSprite, obj_CustomJumpKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice5)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomJumpKeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice5)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 5 {
				_choice = _choice6;
				draw_sprite_ext(_conSprite, obj_CustomAct1KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice6)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomAct1KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice6)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Con Speed 2
	for(var a = 0; a < array_length(conSpeed2); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 8));
		var _gapY = 32;
		var _choice = "opt_ConBoost";
		var _choice2 = "opt_ConSpec1";
		var _choice3 = "opt_ConSwap";
		var _choice4 = "opt_ConSpec2";
		var _conSprite = obj_CustomJumpKeySpeed.sprite_index;
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 75 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(_conSprite, obj_CustomAct2KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomAct2KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(_conSprite, obj_CustomAct3KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomAct3KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(_conSprite, obj_CustomAct4KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomAct4KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(_conSprite, obj_CustomAct5KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomAct5KeySpeed.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Con Action 1
	for(var a = 0; a < array_length(conAct1); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 9));
		var _gapY = 32;
		var _choice = "opt_ActLeft";
		var _choice2 = "opt_ActRight";
		var _choice3 = "opt_ActUp";
		var _choice4 = "opt_ActDown";
		var _choice5 = "opt_ActLight";
		var _choice6 = "opt_ActMedium";
		var _conSprite = obj_CustomJumpKeySpeed.sprite_index;
		var _drawX = setX + _gapX - 3;
	
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		} else if choice == 4 && a == 4 {
			_chosenCol2 = c_white;
		} else if choice == 5 && a == 5 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 78 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(_conSprite, obj_CustomLeftKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomLeftKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(_conSprite, obj_CustomRightKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomRightKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(_conSprite, obj_CustomUpKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomUpKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(_conSprite, obj_CustomDownKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomDownKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 4 {
				_choice = _choice5;
				draw_sprite_ext(_conSprite, obj_CustomLightKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice5)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomLightKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice5)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 5 {
				_choice = _choice6;
				draw_sprite_ext(_conSprite, obj_CustomMediumKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice6)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomMediumKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice6)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Con Action 2
	for(var a = 0; a < array_length(conAct2); a++) {
		var _chosenCol = c_grey;
		var _chosenCol2 = c_grey;
		var _gapX = (96 + optX + (800 * 10));
		var _gapY = 32;
		var _choice = "opt_ActHeavy";
		var _choice2 = "opt_ActDash";
		var _choice3 = "opt_ActSuper";
		var _choice4 = "opt_Parry";
		var _choice5 = "opt_Charge";
		var _conSprite = obj_CustomJumpKeySpeed.sprite_index;
		var _drawX = setX + _gapX - 3;
		
		if choice == a {
			_chosenCol = global.fullRGB;
		}
		
		if choice == 0 && a == 0 {
			_chosenCol2 = c_white;
		} else if choice == 1 && a == 1 {
			_chosenCol2 = c_white;
		} else if choice == 2 && a == 2 {
			_chosenCol2 = c_white;
		} else if choice == 3 && a == 3 {
			_chosenCol2 = c_white;
		} else if choice == 4 && a == 4 {
			_chosenCol2 = c_white;
		}
		
		if _drawX > -400 && _drawX < 800 {
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX - 3, setY + 75 + (_gapY * a), 1, 0.5, 0, c_black, 1);
			draw_sprite_ext(_pauseArrow, arrowFrames, setX + _gapX, setY + 75 + (_gapY * a), 1, 0.5, 0, _chosenCol, 1);
	
			if a == 0 {
				draw_sprite_ext(_conSprite, obj_CustomHeavyKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomHeavyKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 1 {
				_choice = _choice2;
				draw_sprite_ext(_conSprite, obj_CustomDashKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomDashKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice2)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 2 {
				_choice = _choice3;
				draw_sprite_ext(_conSprite, obj_CustomSuperKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomSuperKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice3)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 3 {
				_choice = _choice4;
				draw_sprite_ext(_conSprite, obj_CustomParryKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomParryKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice4)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			} else if a == 4 {
				_choice = _choice5;
				draw_sprite_ext(_conSprite, obj_CustomChargeKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice5)) + 17, setY + 77 + (_gapY * a), 1, 1, 0, c_black, 1);
				draw_sprite_ext(_conSprite, obj_CustomChargeKeyAction.image_index, setX + _gapX + string_width(scr_LocalText(_choice5)) + 20, setY + 74 + (_gapY * a), 1, 1, 0, _chosenCol2, 1);
			}
	
			draw_text_transformed_color(setX + _gapX - 3, setY + 67 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
			draw_text_transformed_color(setX + _gapX, setY + 64 + (_gapY * a), scr_LocalText(_choice), 1, 1, 0, c_white, c_white, _chosenCol, _chosenCol, 1);
		
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 27, setY + 71 + iconY, 1, 1, 0, c_black, 1);
			draw_sprite_ext(_charCheck3, iconFrames, setX + _gapX - 24, setY + 68 + iconY, 1, 1, 0, c_white, 1);
		}
	}
#endregion

#region //Opt Description
	var _optDesc = audio;
	
	if opt == 0 {
		_optDesc = audio[choice][1];
	} else if opt == 1 {
		_optDesc = visual[choice][1];
	} else if opt == 2 {
		_optDesc = misc[choice][1];
	} else if opt == 3 {
		_optDesc = pref[choice][1];
	} else if opt == 4 {
		_optDesc = display[choice][1];
	} else if opt == 5 {
		_optDesc = online[choice][1];
	} else if opt == 6 {
		_optDesc = conGeneral[choice][1];
	} else {
		_optDesc = "desc_Control";
	}
	
	draw_sprite_ext(sprite_index, image_index, setX + 509, setY + 35, 10, 9.5, 0, c_black, 1);
	draw_sprite_ext(sprite_index, image_index, setX + 512, setY + 32, 10, 9.5, 0, #232323, 1);
	draw_sprite_ext(spr_TextboxTrans, image_index, setX + 512, setY + 32, 10, 9.5, 0, c_white, 1);
	
	draw_text_ext_transformed_color(setX + 517, setY + 39, scr_LocalText(_optDesc), 25, 250, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_ext_transformed_color(setX + 520, setY + 36, scr_LocalText(_optDesc), 25, 250, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
#endregion

#region //Buttons
	var _select = scr_LocalText("fs_Select");
	var _default = scr_LocalText("opt_Default");
	var _save = scr_LocalText("fs_Save");
	
	draw_text_color(setX + 80, setY + 361, _select, c_black, c_black, c_black, c_black, 1);
	draw_sprite_ext(obj_CustomLeftKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, setX + 77 + string_width(_select) + 10, setY + 373, 1, 1, 0, c_black, 1);
	draw_text(setX + 80, setY + 358, _select);
	draw_sprite_ext(obj_CustomLeftKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, setX + 80 + string_width(_select) + 10, setY + 370, 1, 1, 0, c_white, 1);
	
	draw_text_color(setX + 80 + string_width(_select) + 77, setY + 361, _default, c_black, c_black, c_black, c_black, 1);
	draw_sprite_ext(obj_CustomLeftKeySpeed.sprite_index, obj_CustomAct4KeySpeed.image_index, setX + 77 + string_width(_select) + string_width(_default) + 93, setY + 373, 1, 1, 0, c_black, 1);
	draw_text(setX + 80 + string_width(_select) + 80, setY + 358, _default);
	draw_sprite_ext(obj_CustomLeftKeySpeed.sprite_index, obj_CustomAct4KeySpeed.image_index, setX + 80 + string_width(_select) + string_width(_default) + 90, setY + 370, 1, 1, 0, c_white, 1);
	
	draw_text_color(setX + 547, setY + 361, _save, c_black, c_black, c_black, c_black, 1);
	draw_sprite_ext(obj_CustomLeftKeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, setX + 547 + string_width(_save) + 10, setY + 373, 1, 1, 0, c_black, 1);
	draw_text(setX + 550, setY + 358, _save);
	draw_sprite_ext(obj_CustomLeftKeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, setX + 550 + string_width(_save) + 10, setY + 370, 1, 1, 0, c_white, 1);
	
	draw_sprite_ext(sprite_index, image_index, setX + 128, setY + changeBindY + 5, 18.5, 10, 0, c_black, 1);
	draw_sprite_ext(sprite_index, image_index, setX + 128, setY + changeBindY, 18.5, 10, 0, #232323, 1);
	draw_sprite_ext(spr_TextboxTrans, image_index, setX + 128, setY + changeBindY, 18.5, 10, 0, c_white, 1);
	
	draw_set_halign(fa_center);
		draw_text_transformed_color(setX + 416, setY + changeBindY + 14, scr_LocalText("opt_ChangeBind"), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(setX + 416, setY + changeBindY + 8, scr_LocalText("opt_ChangeBind"), 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left);
#endregion

#region //Sonic Rush Spikes
	var _spikes = spr_SonicRushSpikesNorm;
	var _col = global.fullRGB;

	if global.MIND or global.PlayerChar == 0 {
		_spikes = spr_SonicRush_Spikes_Head;
		_col = c_white;
	}

	draw_sprite_ext(_spikes, spikesFrames, leftSpikesX - 200, 0, 2, 2, 0, _col, 1);
	draw_sprite_ext(_spikes, 20 - spikesFrames, -leftSpikesX + 968, 0, -2, 2, 0, _col, 1);
#endregion
