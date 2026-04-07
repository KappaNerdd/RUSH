display_set_gui_size(768, 432);

draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 240, 11, 3, 0, c_white, 0.65 * charAlpha);

draw_set_valign(fa_middle);
	var _button = obj_CustomJumpKeySpeed.sprite_index;
	var _nameCheck = "";
	var _conCol = c_grey;
	
	if string_length(global.PlayerName) > 0 { //Ignore there being 2 of these. I'm codin' this at 3 in the mornin', man. I'm tired.
		#region //Name Checking
			_nameCheck = "check_Name";
			confirmName = true;
		#endregion
	}
	
	if string_length(global.PlayerName) > 0 && confirmName {
		_conCol = c_white;
	}

	draw_sprite_ext(_button, obj_CustomPauseKeySpeed.image_index, 500, 90, 1, 1, 0, _conCol, charAlpha);

	draw_sprite_ext(_button, obj_CustomJumpKeySpeed.image_index, 20, 410, 1, 1, 0, c_white, charAlpha);
	draw_sprite_ext(_button, obj_CustomAct1KeySpeed.image_index, 270, 410, 1, 1, 0, c_white, charAlpha);
	draw_sprite_ext(_button, obj_CustomAct2KeySpeed.image_index, 520, 410, 1, 1, 0, c_white, charAlpha);
	
	draw_text_color(80, 410, scr_LocalText("menu_ConLetter"), c_white, c_white, c_white, c_white, charAlpha);
	draw_text_color(330, 410, scr_LocalText("menu_ReLetter"), c_white, c_white, c_white, c_white, charAlpha);
	draw_text_color(580, 410, scr_LocalText("menu_AddSpace"), c_white, c_white, c_white, c_white, charAlpha);
	
	if nameChosen {
		draw_text(300, 300, scr_LocalText("opt_Yes"));
		draw_text(480, 300, scr_LocalText("opt_No"));
		
		draw_sprite_ext(_button, obj_CustomJumpKeySpeed.image_index, 240, 300, 1, 1, 0, c_white, 1);
		draw_sprite_ext(_button, obj_CustomAct1KeySpeed.image_index, 420, 300, 1, 1, 0, c_white, 1);
	} else {
		draw_sprite_ext(spr_CharSelectArrow, leftFrames, 40, 360, -1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_CharSelectArrow, rightFrames, 720, 360, 1, 1, 0, c_white, 1);
		
		draw_sprite_ext(_button, obj_CustomAct5KeySpeed.image_index, 80, 360, 1, 1, 0, c_white, 1);
		draw_sprite_ext(_button, obj_CustomAct3KeySpeed.image_index, 620, 360, 1, 1, 0, c_white, 1);
	}
draw_set_valign(fa_top);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	var _name = string(global.PlayerName);
	var _nameWidth = string_width(_name);
	var _extraX = 768;

	draw_text_transformed_color(384, 40, scr_LocalText("menu_NameAsk"), 2, 2, 0, c_white, c_white, c_white, c_white, charAlpha);
	draw_text_transformed(384, 90 + nameY, _name, nameScale, nameScale, nameAngle);
	
	if visibleNameUnder && !nameChosen && string_length(_name) < 15 {
		draw_text_transformed(390 + (_nameWidth / 2), 90 + nameY, "_", nameScale, nameScale, 0);
	}
	
	draw_text_transformed_color(384, 120, "-----------------------------------------------------------------------", 1, 1, 0, c_white, c_white, c_white, c_white, charAlpha);
	
	if nameChosen {
		draw_text_ext_transformed(384, 380, scr_LocalText(string(_nameCheck)), 20, 300, 1, 1, 0);
	}
	
	#region //Name Bar 0
		for(var i = 0; i < array_length(charArray[0][0]); i++) {
			var _xGap = 25;
			var _scale = 1.5;
			var _alpha = 1 * charAlpha;
			var _col = c_grey;
		
			if nameChar == i && nameColumn == 0 {
				_scale = charScale;
				_col = c_white;
			}
		
			draw_text_transformed_color(70 + (_xGap * i) + charX, 200, string(charArray[0][0][i]), _scale, _scale, 0, _col, _col, _col, _col, _alpha);
		}
		
		for(var i = 0; i < array_length(charArray[0][1]); i++) {
			var _xGap = 25;
			var _scale = 1.5;
			var _alpha = 1 * charAlpha;
			var _col = c_grey;
		
			if nameChar == i && nameColumn == 1 {
				_scale = charScale;
				_col = c_white;
			}
		
			draw_text_transformed_color(70 + (_xGap * i) + charX, 235, string(charArray[0][1][i]), _scale, _scale, 0, _col, _col, _col, _col, _alpha);
		}
		
		for(var i = 0; i < array_length(charArray[0][2]); i++) {
			var _xGap = 25;
			var _scale = 1.5;
			var _alpha = 1 * charAlpha;
			var _col = c_grey;
		
			if nameChar == i && nameColumn == 2 {
				_scale = charScale;
				_col = c_white;
			}
		
			draw_text_transformed_color(70 + (_xGap * i) + charX, 270, string(charArray[0][2][i]), _scale, _scale, 0, _col, _col, _col, _col, _alpha);
		}
	#endregion
	
	#region //Name Bar 1
		for(var i = 0; i < array_length(charArray[1][0]); i++) {
			var _xGap = 25;
			var _scale = 1.5;
			var _alpha = 1 * charAlpha;
			var _col = c_grey;
		
			if nameChar == i && nameColumn == 0 {
				_scale = charScale;
				_col = c_white;
			}
		
			draw_text_transformed_color(70 + (_xGap * i) + charX + (_extraX), 200, string(charArray[1][0][i]), _scale, _scale, 0, _col, _col, _col, _col, _alpha);
		}
		
		for(var i = 0; i < array_length(charArray[1][1]); i++) {
			var _xGap = 25;
			var _scale = 1.5;
			var _alpha = 1 * charAlpha;
			var _col = c_grey;
		
			if nameChar == i && nameColumn == 1 {
				_scale = charScale;
				_col = c_white;
			}
		
			draw_text_transformed_color(70 + (_xGap * i) + charX + (_extraX), 235, string(charArray[1][1][i]), _scale, _scale, 0, _col, _col, _col, _col, _alpha);
		}
		
		for(var i = 0; i < array_length(charArray[1][2]); i++) {
			var _xGap = 25;
			var _scale = 1.5;
			var _alpha = 1 * charAlpha;
			var _col = c_grey;
		
			if nameChar == i && nameColumn == 2 {
				_scale = charScale;
				_col = c_white;
			}
		
			draw_text_transformed_color(70 + (_xGap * i) + charX + (_extraX), 270, string(charArray[1][2][i]), _scale, _scale, 0, _col, _col, _col, _col, _alpha);
		}
	#endregion

draw_set_halign(fa_left);
draw_set_valign(fa_top);
