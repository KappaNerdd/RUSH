display_set_gui_size(768, 432);

draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 240, 11, 3, 0, c_white, 0.65 * charAlpha);

draw_set_valign(fa_middle);
	var _button = obj_CustomJumpKeySpeed.sprite_index;
	var _nameCheck = "";
	var _conCol = c_grey;
	
	if string_length(global.PlayerName) > 0 {
		#region //Name Checking
			switch(string_lower(global.PlayerName)) {
				#region //Char Names
					case "kappa":
						_nameCheck = "check_Kappa";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "sarah":
						_nameCheck = "check_Sarah";
						confirmName = true;
						charName = true;
						famName = false;
					break;
				
					case "alone": 
					case "lone":
						_nameCheck = "check_Lone";
						confirmName = true;
						charName = true;
						famName = false;
					break;
				
					case "brock":
						_nameCheck = "check_Brock";
						confirmName = true;
						charName = true;
						famName = false;
					break;
				
					case "neegi":
						_nameCheck = "check_Neegi";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "cloee":
						_nameCheck = "check_Cloee";
						confirmName = true;
						charName = true;
						famName = false;
					break;
				
					case "akira":
					case "ak":
					case "a.k.":
						_nameCheck = "check_Akira";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "taylor":
					case "tj":
					case "t.j.":
						_nameCheck = "check_Taylor";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "ayana":
					case "aa":
					case "a.a.":
						_nameCheck = "check_Ayana";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "rush":
					case "blur":
						_nameCheck = "check_Rush";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "edge":
						_nameCheck = "check_Edge";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				
					case "ivy":
						_nameCheck = "check_Ivy";
						confirmName = false;
						charName = true;
						famName = false;
					break;
				#endregion
				
				#region //Other Names
					case "aaaaaaaaaaaaaaa":
					case "a":
					case " ":
						_nameCheck = "check_AAAAAA";
						confirmName = true;
						charName = false;
						famName = false;
					break;
					
					case "mercy":
					case "fight":
					case "kill":
					case "adrenaline":
					case "tension":
						_nameCheck = "check_OnTheNose";
						confirmName = true;
						charName = false;
						famName = false;
					break;
				
					case "nerd":
					case "kappanerd":
					case "kappanerdd":
						_nameCheck = "check_Nerd";
						confirmName = true;
						charName = false;
						famName = false;
					break;
				
					/*case "kira":
					case "kira_nk":
						_nameCheck = "check_Kira";
						confirmName = true;
						charName = true;
						famName = false;
					break;*/
				
					case "frisk":
						_nameCheck = "check_Frisk";
						confirmName = true;
						charName = false;
						famName = true;
					break;
				
					case "chara":
						_nameCheck = "check_Chara";
						confirmName = true;
						charName = false;
						famName = true;
					break;
				
					case "sonic":
						_nameCheck = "check_Sonic";
						confirmName = true;
						charName = false;
						famName = true;
					break;
				
					case "blaze":
						_nameCheck = "check_Blaze";
						confirmName = true;
						charName = false;
						famName = true;
					break;
				
					case "gaster":
						game_end();
					break;
				#endregion
				
				default:
					_nameCheck = "check_Name";
					confirmName = true;
					charName = false;
					famName = false;
				break;
			}
		#endregion
		
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
		var _col = c_white;
		
		if !confirmName {
			_col = c_grey;
		}
		
		draw_text_color(300, 300, scr_LocalText("opt_Yes"), _col, _col, _col, _col, otherCharAlpha);
		draw_text_color(480, 300, scr_LocalText("opt_No"), c_white, c_white, c_white, c_white, otherCharAlpha);
		
		draw_sprite_ext(_button, obj_CustomJumpKeySpeed.image_index, 240, 300, 1, 1, 0, _col, otherCharAlpha);
		draw_sprite_ext(_button, obj_CustomAct1KeySpeed.image_index, 420, 300, 1, 1, 0, c_white, otherCharAlpha);
	} else {
		draw_sprite_ext(spr_CharSelectArrow, leftFrames, 40, 360, -1, 1, 0, c_white, charAlpha);
		draw_sprite_ext(spr_CharSelectArrow, rightFrames, 720, 360, 1, 1, 0, c_white, charAlpha);
		
		draw_sprite_ext(_button, obj_CustomAct5KeySpeed.image_index, 80, 360, 1, 1, 0, c_white, charAlpha);
		draw_sprite_ext(_button, obj_CustomAct3KeySpeed.image_index, 620, 360, 1, 1, 0, c_white, charAlpha);
	}
draw_set_valign(fa_top);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	var _name = string(global.PlayerName);
	var _nameWidth = string_width(_name);
	var _extraX = 768;

	draw_text_transformed_color(384, 40, scr_LocalText("menu_NameAsk"), 2, 2, 0, c_white, c_white, c_white, c_white, charAlpha);
	draw_text_transformed_color(384, 90 + nameY, _name, nameScale, nameScale, nameAngle, c_white, c_white, c_white, c_white, charAlpha + otherCharAlpha);
	
	if visibleNameUnder && !nameChosen && string_length(_name) < 15 {
		draw_text_transformed_color(390 + (_nameWidth / 2), 90 + nameY, "_", nameScale, nameScale, 0, c_white, c_white, c_white, c_white, charAlpha);
	}
	
	draw_text_transformed_color(384, 120, "-----------------------------------------------------------------------", 1, 1, 0, c_white, c_white, c_white, c_white, charAlpha);
	
	if nameChosen {
		draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 370, 8, 1.5, 0, c_white, 0.5);
		draw_text_ext_transformed_color(384, 370, scr_LocalText(string(_nameCheck)), 20, 350, 1, 1, 0, c_white, c_white, c_white, c_white, otherCharAlpha);
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
