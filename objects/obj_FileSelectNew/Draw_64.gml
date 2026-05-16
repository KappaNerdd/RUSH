display_set_gui_size(768, 432);
draw_sprite_ext(sprite_index, image_index, 0, 0, 13, 13, 0, fullCol, 0.35);

var _angleLimit = 360 / global.FileLimit;

var _gapY = 120;

var _dirMind = working_directory + "/saves/" + string(fileChoice + 1) + "/";
var _fileMind = _dirMind + string(global.NoMindDataFile) + string(fileChoice + 1) + ".sav";
var _ballAlpha = 0.5;

if file_exists(_fileMind) {
	_ballAlpha = 1;
}

draw_sprite_ext(srBall, 0, 150, 216, 1.5, 1.5, ballAngle, fullCol, _ballAlpha);

var _arrowUp = 0;
var _arrowDown = 0;

if arrowDown {
	_arrowDown = arrowAnim;
}

if arrowUp {
	_arrowUp = arrowAnim;
}

if arrowed {
	arrowAnim += 1 / 3;
	
	if arrowAnim >= 5 {
		arrowed = false;
		arrowAnim = 0;
		
		arrowDown = false;
		arrowUp = false;
	}
}

draw_sprite_ext(spr_CharSelectArrow, _arrowUp, 150, 216 - 135, 1.5, -1.5, 90, fullCol, 1);
draw_sprite_ext(spr_CharSelectArrow, _arrowUp, 150, 216 - 135, 1.5, -1.5, 90, c_white, 0.5);
draw_sprite_ext(spr_CharSelectArrow, _arrowDown, 150, 216 + 135, 1.5, 1.5, -90, fullCol, 1);
draw_sprite_ext(spr_CharSelectArrow, _arrowDown, 150, 216 + 135, 1.5, 1.5, -90, c_white, 0.5);

for (var i = 1; i <= global.FileLimit; i++) {
	var _dir = working_directory + "/saves/" + string(i) + "/";
	var _filename = _dir + string(global.MainDataFile) + string(i) + ".sav";
	var _chosenCol = c_grey;
	var _extraX = 0;
	var _changeX = -140 + lengthdir_x(400, ballAngle + (_angleLimit * -(i - 1)));
	var _changeY = 168 + lengthdir_y(500, ballAngle + (_angleLimit * -(i - 1)));
	var _changeAngle = ballAngle + (_angleLimit * -(i - 1));
	
	if file_exists(_filename) {
		var _localArray = [];
		
		#region //Open File
			//Load the buffer, get the JSON, delete the buffer from memory
			var _buffer = buffer_load(_filename);
			var _json = buffer_read(_buffer, buffer_string);
	
			buffer_delete(_buffer);
		
			//Unstringify and get the data array
			var _loadArray = json_parse(_json);
			
			_localArray = array_get(_loadArray, 0);
		#endregion
		
		var _playerShit = global.PlayerSelection[_localArray.player_Char];
		
		if fileChoice + 1 == i {
			newRed = _playerShit[5][0];
			newGreen = _playerShit[5][1];
			newBlue = _playerShit[5][2];
			
			fullCol = make_colour_rgb(red, green, blue);
			
			_chosenCol = fullCol;
			
			draw_sprite_ext(_playerShit[9][0], _localArray.player_Costume, 350 + (charAngle / 4), -50, 0.75, 0.75, 0, c_white, charOpacity * 1.5);
			draw_sprite_ext(_playerShit[28][3], 0, 150, 216, 1.5 * (charOpacity * 2), 1.5 * (charOpacity * 2), charAngle, c_white, 1);
		} else {
			_chosenCol = c_white;
		}
		
		var _maxAnim = sprite_get_number(asset_get_index(_playerShit[6][0]));
		
		if !global.SimplifyVFX {
			boxAnim += boxFrames;
		}
		
		if boxAnim >= _maxAnim {
			boxAnim = 0;
		}
		
		draw_sprite_ext(_playerShit[6][0], boxAnim, _changeX, _changeY, 14, 3 + boxExtraScale, _changeAngle, #303030, 0.5);
		draw_sprite_ext(spr_TextboxTrans, 0, _changeX, _changeY, 14, 3 + boxExtraScale, _changeAngle, _chosenCol, 1);
		
		draw_set_halign(fa_right);
			if !erase && !overwrite {
				draw_text_transformed_color(_changeX + 380, _changeY + 64, string(_localArray.player_ExtraLives) + "x", 1, 1, _changeAngle, c_white, c_white, _chosenCol, _chosenCol, 1);
			}
		draw_set_halign(fa_left);
		
		if !erase && !overwrite {
			for(var f = 0; f <= 3; f++) {
				var _chosen = c_dkgrey;
				var _text = "title_Continue";
				var _extraXs = 0;
				var _origin = fa_left;
			
				if subChoice == f {
					_chosen = fullCol;
				}
			
				if f == 1 {
					_text = "fs_Copy";
					_extraXs = 130;
				} else if f == 2 {
					_text = "fs_Delete";
					_extraXs = 250;
				} else if f == 3 {
					_text = "fs_Back";
					_origin = fa_right;
					_extraXs = 416;
				}
			
				draw_set_halign(_origin);
					if boxExtraScale >= 0.95 {
						confirmTextOpacity = lerp(confirmTextOpacity, 1, 0.1);
						draw_text_transformed_color(_changeX + _extraXs + 16, _changeY + 96, scr_LocalText(_text), 1, 1, _changeAngle, c_white, c_white, _chosen, _chosen, confirmTextOpacity);
					} else {
						confirmTextOpacity = lerp(confirmTextOpacity, 0, 0.2);
					}
				draw_set_halign(fa_left);
			}
		
			draw_set_halign(fa_right);
				var _extraMinute = "0";
				var _extraSecond = "0";
			
				if _localArray.player_TimeMinutes >= 10 {
					_extraMinute = "";
				}
			
				if _localArray.player_TimeSeconds >= 10 {
					_extraSecond = "";
				}
			
				var _fullTime = string(_localArray.player_TimeHours) + ":" + _extraMinute + string(_localArray.player_TimeMinutes) + ":" + _extraSecond + string(ceil(_localArray.player_TimeSeconds));
		
				draw_text_transformed_color(_changeX + 432, _changeY + 12, _fullTime, 1, 1, _changeAngle, c_white, c_white, c_white, c_white, 1);
			draw_set_halign(fa_left);
		
			draw_text_transformed_color(_changeX + 16, _changeY + 12, "[" + string(_localArray.player_Name) + "]", 1, 1, _changeAngle, c_white, c_white, c_white, c_white, 1);
		
			scr_RoomCheckerDraw();
			savedRoom = _localArray.save_rm;
		
			draw_text_transformed_color(_changeX + 16, _changeY + 36, string(_rmName), 1, 1, _changeAngle, c_white, c_white, c_white, c_white, 1);
		
			draw_sprite_ext(_playerShit[17][0], _localArray.player_Costume, _changeX + 382, _changeY + 36, 1, 1, _changeAngle, c_white, 1);
		} else if overwrite {
			var _copyText = "fs_Overwrite";
			
			draw_set_halign(fa_middle);
				draw_text_transformed_color(_changeX + 224, _changeY + 36, scr_LocalText(_copyText), 1, 1, 0, c_yellow, c_yellow, c_red, c_red, 1);
			draw_set_halign(fa_left);
		} else if erase {
			var _eraseText = "fs_Erase";
			
			if erasing {
				_eraseText = "fs_Erasing";
			}
			
			draw_set_halign(fa_middle);
				draw_text_transformed_color(_changeX + 224, _changeY + 36, scr_LocalText(_eraseText), 1, 1, 0, c_yellow, c_yellow, c_red, c_red, 1);
			draw_set_halign(fa_left);
			
			for(var e = 0; e <= 1; e++) {
				var _chosen = c_dkgrey;
				var _text = "opt_No";
				var _extraXs = 0;
				var _origin = fa_left;
			
				if subChoice == e {
					_chosen = fullCol;
				}
			
				if e == 1 {
					_text = "opt_Yes";
					_extraXs = 416;
					_origin = fa_right;
				}
			
				draw_set_halign(_origin);
					draw_text_transformed_color(_changeX + _extraXs + 16, _changeY + 96, scr_LocalText(_text), 1, 1, _changeAngle, c_white, c_white, _chosen, _chosen, confirmTextOpacity);
				draw_set_halign(fa_left);
			}
		}
	} else {
		if fileChoice + 1 == i {
			_chosenCol = c_white;
			newRed = 255;
			newGreen = 255;
			newBlue = 255;
			
			fullCol = make_colour_rgb(red, green, blue);
		}
		
		draw_sprite_ext(spr_TextboxHead, 0, _changeX, _changeY, 14, 3 + boxExtraScale, _changeAngle, c_white, 0.5);
		draw_sprite_ext(spr_TextboxTrans, 0, _changeX, _changeY, 14, 3 + boxExtraScale, _changeAngle, _chosenCol, 1);
		
		draw_set_halign(fa_right);
			if !erase && !overwrite {
				draw_text_transformed_color(_changeX + 380, _changeY + 64, "0x", 1, 1, _changeAngle, c_white, c_white, _chosenCol, _chosenCol, 1);
			}
		draw_set_halign(fa_left);
		
		for(var f = 0; f <= 3; f++) {
			var _chosen = c_grey;
			var _text = "level_Go";
			var _extraXs = 0;
			var _origin = fa_left;
			
			if subChoice == f {
				if f != 1 && f != 2 {
					_chosen = c_white;
				} else {
					_chosen = c_dkgrey;
				}
			}
			
			if f == 1 {
				_text = "fs_Copy";
				_extraXs = 130;
			} else if f == 2 {
				_text = "fs_Delete";
				_extraXs = 250;
			} else if f == 3 {
				_text = "fs_Back";
				_origin = fa_right;
				_extraXs = 416;
			}
			
			draw_set_halign(_origin);
				draw_text_transformed_color(_changeX + _extraXs + 16, _changeY + 96, scr_LocalText(_text), 1, 1, _changeAngle, _chosen, _chosen, _chosen, _chosen, confirmTextOpacity);
			draw_set_halign(fa_left);
		}
		
		draw_text_transformed_color(_changeX + 16, _changeY + 12, "[" + scr_LocalText("fs_Empty") + "]", 1, 1, _changeAngle, c_white, c_white, _chosenCol, _chosenCol, 1);
		draw_text_transformed_color(_changeX + 16, _changeY + 36, "---------------", 1, 1, _changeAngle, c_white, c_white, _chosenCol, _chosenCol, 1);
		
		draw_set_halign(fa_right);
			draw_text_transformed_color(_changeX + 432, _changeY + 12, "--:--:--", 1, 1, _changeAngle, c_white, c_white, _chosenCol, _chosenCol, 1);
		draw_set_halign(fa_left);
		
		draw_sprite_ext(spr_StageCharNone, 0, _changeX + 384, _changeY + 36, 1, 1, _changeAngle, _chosenCol, 1);
	}
}

if !global.SimplifyVFX {
	srSpikeFrames++;
}

if srSpikeFrames >= 20 {
	srSpikeFrames = 0;
}


draw_sprite_ext(srSpikes, srSpikeFrames, 0, 0, 2, 2, 0, fullCol, 1);
draw_sprite_ext(srSpikes, -srSpikeFrames + (20), 768, 0, -2, 2, 0, fullCol, 1);

draw_sprite_ext(srBlock, 0, 0, -70, 1.2, 1, 0, fullCol, 1);
draw_sprite_ext(srBlock, 0, 0, 502, 1.2, -1, 0, fullCol, 1);

draw_set_halign(fa_middle);
	draw_text_transformed_color(384, 5, scr_LocalText("fs_FileSelect"), 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
	
	if copy {
		var _copyShit = "fs_ChooseFile";
		var _copyShitCol = c_green;
	
		draw_text_transformed_color(384, 390, scr_LocalText(_copyShit), 1, 1.5, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(384, 390, scr_LocalText(_copyShit), 1, 1.5, 0, _copyShitCol, _copyShitCol, _copyShitCol, _copyShitCol, copyShitAlpha);
	}
draw_set_halign(fa_left);

draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, 700, 410, 1, 1, 0, c_white, 1);

if copy or erase or confirm {
	draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, -5, 410, 1, 1, 0, c_white, 1);
}

draw_set_valign(fa_center);
	var _confirm = "fs_Select";
	var _back = "fs_Back";
	
	if overwrite {
		_confirm = "opt_Yes";
		_back = "opt_No";
	}

	if copy or erase or confirm {
		draw_text_transformed_color(60, 410, scr_LocalText(_back), 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	}
	
	draw_set_halign(fa_right);
		draw_text_transformed(710, 410, scr_LocalText(_confirm), 1, 1, 0);
	draw_set_halign(fa_left);
draw_set_valign(fa_top);

if boxExtraScale >= 0.98 {
	confirmTextOpacity = lerp(confirmTextOpacity, 1, 0.1);
} else {
	confirmTextOpacity = lerp(confirmTextOpacity, 0, 0.25);
}