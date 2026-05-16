display_set_gui_size(768, 432);

#region //Menu Check
	var _menu = menu;
	var _scale = 1 + extraScale / 8;
		
	if moveGameplay {
		if moveStory {
			_menu = story;
		} else {
			_menu = gameplay;
		}
	}
		
	if moveExtra {
		_menu = extra;
	}
#endregion

#region //Background
	draw_sprite_ext(sprite_index, image_index, 0, 0, 38.5, 22, 0, c_white, 1);
	
	for(var i = 0; i < 20; i++) {
		var _gapX = 60;
		var _text = "level_Rush";
		var _change = backTextX;
		
		if i % 2 == 0 {
			_text = "level_Adrenaline";
			_change = otherBackTextX;
		}
		
		var _newX = -_change + (_gapX * i);
		var _jacobAlpharad = 0.75;
		
		draw_text_transformed_color(_newX, _change, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		
		draw_text_transformed_color(_newX + baseTextX * 0.25, _change - baseTextX * 0.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 0.5, _change - baseTextX * 0.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 0.75, _change - baseTextX * 0.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX, _change - baseTextX, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 1.25, _change - baseTextX * 1.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 1.5, _change - baseTextX * 1.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 1.75, _change - baseTextX * 1.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 2, _change - baseTextX * 2, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX + baseTextX * 2.25, _change - baseTextX * 2.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		
		draw_text_transformed_color(_newX - baseTextX * 0.25, _change + baseTextX * 0.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 0.5, _change + baseTextX * 0.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 0.75, _change + baseTextX * 0.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX, _change + baseTextX, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 1.25, _change + baseTextX * 1.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 1.5, _change + baseTextX * 1.5, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 1.75, _change + baseTextX * 1.75, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 2, _change + baseTextX * 2, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
		draw_text_transformed_color(_newX - baseTextX * 2.25, _change + baseTextX * 2.25, scr_LocalText(_text), 1, 1, 45, c_white, c_white, c_white, c_white, _jacobAlpharad);
	}
	
	draw_sprite_ext(spr_MainMenuBall, 3 * extraScale, -menuX + 100, menuY + 100, 2 + extraScale / 1.5, 2 + extraScale / 1.5, 0, charShit[nerd][2], 0.75);
	draw_sprite_ext(spr_MainMenuBall, 4, -menuX + 100, menuY + 100, 2 + extraScale / 4, 2 + extraScale / 4, 0, c_white, 1);
	
	draw_sprite_ext(spr_MainMenuBall, 3 * extraScale, menuX + 650, menuY + 200, 2 + extraScale / 1.5, 2 + extraScale / 1.5, 0, charShit[1 - nerd][2], 0.75);
	draw_sprite_ext(spr_MainMenuBall, 4, menuX + 650, menuY + 200, 2 + extraScale / 4, 2 + extraScale / 4, 0, c_white, 1);
#endregion

#region //Button Renders
	for(var c = 0; c < array_length(_menu); c++) {
		var _changeGap = 800;
		var _moveX = menuX + 280 + renderX + (_changeGap * c);
		var _otherScale = 0.75;
		
		gpu_set_fog(true, charShit[1 - nerd][2], 0, 1);
			draw_sprite_ext(_menu[c][1], nerd, _moveX - 15 - (extraScale * 15), -menuY + 235 + (extraScale * 10), _otherScale, _otherScale, 0, c_white, 1);
		gpu_set_fog(false, c_black, 0, 1);
		
		draw_sprite_ext(_menu[c][1], nerd, _moveX, -menuY + 220 + (extraScale * 5), _otherScale, _otherScale, 0, c_white, 1);
	}
#endregion

#region //Main Menu
	draw_sprite_ext(spr_SideBar, 0, menuX + 160 - (25 * extraScale), -160, 1, 1, -12.5, charShit[nerd][2], 1);
	draw_sprite_ext(spr_SideBar, 0, -menuX + 608 + (25 * extraScale), 446, -1, -1, -12.5, charShit[1 - nerd][2], 1);
	
	draw_sprite_ext(spr_TitleLogoNormal, 0, -menuX + 80, 60, 0.3 * _scale, 0.3 * _scale, 0, c_white, 1);
	draw_sprite_ext(spr_TitleNewEN, 0, -menuX + 80, 60, 1 * (_scale + extraScale / 8), 1 * (_scale + extraScale / 8), 0, c_white, 1);

	draw_sprite_ext(spr_CharSelectRushBall2, 1, menuX + 665, menuY + 330, _scale + (extraScale / 8), _scale + (extraScale / 8), menuAngle, c_white, 1);
	draw_sprite_ext(spr_CharSelectRushBall2, 0, menuX + 665, menuY + 330, _scale, _scale, menuAngle, charShit[nerd][2], 1);
	draw_sprite_ext(charShit[nerd][1], 0, menuX + 665, menuY + 330, iconScale + extraScale / 2, iconScale + extraScale / 2, menuAngle, c_white, 1);
	
	for(var i = 0; i < array_length(_menu); i++) {
		var _angleX = lengthdir_x(115 + (extraScale * 5), menuAngle + ((360 / array_length(_menu)) * i) + 180 - 45);
		var _angleY = lengthdir_y(115 + (extraScale * 5), menuAngle + ((360 / array_length(_menu)) * i) + 180 - 45);
		
		var _textX = lengthdir_x(215 + (extraScale * 5), menuAngle + ((360 / array_length(_menu)) * i) + 180 - 45);
		var _textY = lengthdir_y(215 + (extraScale * 5), menuAngle + ((360 / array_length(_menu)) * i) + 180 - 45);
		
		var _index = 1;
		var _col = c_grey;
		var _yScale = 1;
		
		if menuChoice == i {
			_index = 0;
			_col = c_white;
			
			if menuRet {
				draw_sprite_ext(spr_MenuReticle, nerd, menuX + _angleX + 647, menuY + _angleY + 312, 4.5, _yScale, menuAngle - 45 + ((360 / array_length(_menu)) * i), c_white, 1);
			}
		}
		
		if _menu == story {
			if i == 1 {
				var _dir = working_directory + "/saves/" + string(global.saveFile) + "/";
				var _filename = _dir + string(global.MainDataFile) + string(global.saveFile) + ".sav";
				
				if !file_exists(_filename) {
					_col = c_dkgray;
					_index = 1;
				}
			}
		}
		
		draw_sprite_ext(charShit[nerd][0], _index, menuX + _angleX + 665, menuY + _angleY + 330, 6, _yScale, menuAngle - 45 + ((360 / array_length(_menu)) * i), c_white, 1);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
			draw_text_transformed_color(menuX + _textX + 665, menuY + _textY + 332, scr_LocalText(_menu[i][0]), 1 * _yScale, 1 * _yScale, menuAngle - 45 + ((360 / array_length(_menu)) * i), c_black, c_black, c_black, c_black, 0.5);
			draw_text_transformed_color(menuX + _textX + 665, menuY + _textY + 330, scr_LocalText(_menu[i][0]), 1 * _yScale, 1 * _yScale, menuAngle - 45 + ((360 / array_length(_menu)) * i), _col, _col, _col, _col, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
#endregion

#region //Extra Overlays
	var _menuText = "menu_MainMenu";
	
	if moveGameplay {
		if !moveStory {
			_menuText = "title_Gameplay";
		} else {
			_menuText = "title_StoryMode";
		}
	}
	
	if moveExtra {
		_menuText = "title_Extras";
	}
	
	gpu_set_fog(true, charShit[1 - nerd][2], 0, 1);
		draw_sprite_ext(spr_TextboxRushMenu, 0, menuX + 556 + (-20 * extraScale), 36, 5, 1, 0, c_white, 1);
	gpu_set_fog(false, c_black, 0, 1);
	
	draw_sprite_ext(spr_TextboxRushMenu, 0, menuX + 550 + (-20 * extraScale), 30, 5, 1, 0, c_white, 1);
	draw_text_transformed_color(menuX + 566 + (-20 * extraScale), 48, scr_LocalText(_menuText), 1, 1, 0, c_white, c_white, c_white, charShit[nerd][2], 1);

	draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, 820, 50, 3 + extraScale / 2, 3 + extraScale / 2, -135, charShit[1 - nerd][2], 1);
	draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, -52, 382, 3 + extraScale / 2, 3 + extraScale / 2, 45, charShit[1 - nerd][2], 1);
#endregion

#region //New Game Warning
	if newGameWarning {
		if newGameAlpha < 1 {
			newGameAlpha += 0.1;
		} else {
			if newGameAlpha2 < 1 {
				newGameAlpha2 += 0.1;
			}
		}
	} else {
		if newGameAlpha > 0 {
			newGameAlpha -= 0.2;
		}
		
		if newGameAlpha2 > 0 {
			newGameAlpha2 -= 0.2;
		}
	}
	
	draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 216, 4, 5, 0, c_white, newGameAlpha / 2);
	
	draw_set_halign(fa_middle);
		draw_text_transformed_color(384, 80, scr_LocalText("new_Warning") + "\n--------------------------", 1, 1, 0, c_white, c_white, c_white, c_white, newGameAlpha2);
		draw_text_ext_transformed_color(384, 130, scr_LocalText("new_WarnDisc"), 20, 230, 1, 1, 0, c_white, c_white, c_white, c_white, newGameAlpha2);
	draw_set_halign(fa_right);
		draw_text_color(480, 335, scr_LocalText("opt_Yes"), c_white, c_white, c_white, c_white, newGameAlpha2);
		draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, 430, 305, 1, 1, 0, c_white, newGameAlpha2);
	draw_set_halign(fa_left);
		draw_text_color(300, 335, scr_LocalText("opt_No"), c_white, c_white, c_white, c_white, newGameAlpha2);
		draw_sprite_ext(obj_CustomAct1KeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, 280, 305, 1, 1, 0, c_white, newGameAlpha2);
#endregion
