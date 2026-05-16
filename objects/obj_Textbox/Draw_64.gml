getCharacterControls();

display_set_gui_size(768, 432);

confirm_key = jump_Key;
skip_key = action_Key;
wrist_key = action1_Key_Held;

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if setGUI {
	_camX = 0;
	_camY = 0;
} else {
	depth = -10000;
}

textbox_x = _camX;
textbox_y = _camY + 300;

txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
txtb_XFull = textbox_width / txtb_spr_w + 0.15;

var _finalVol = global.TEXT_VOL * global.MASTER_VOL;

scr_Defaults_for_Text();

#region //Setup
	if !setup && !setupComplete {
		setup = true;
		
		if instance_exists(obj_Player) {
			obj_Player.can_MoveFULL = false;
		}
	
		draw_set_font(global.font_main);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	
		//Loop through pages
		for (var p = 0; p < page_number; p++) {
			//Find how many characters are on each page and store the number in text length array.
			text_length[p] = string_length(text[p]);
		
			//Get x position for textbox
			text_x_offset[p] = 17;
			
			#region //Check Special Chars
				var _wordIndex = 0;
				var _vIndex = 0;
				var _topCol = c_white;
				var _botCol = c_white;
				var _lastSpace = 0;
				var _lineWidthCheck = 0;
				
				var _rainbowText = false;
				var _rainbowTop = false;
				var _shakeText = false;
				var _wavyText = false;
				var _circleText = false;
				var _scaleText = false;
				var _pauseText = false;
				var _stopText = false;
				
				var _raw = string_length(text[p]);
				var _speaker = speakerSprites[p];
				var _cIndex = 0;
				var _cSprite = _speaker[0];
			
				if !speaker2Char[page] {
					sprite_index = _speaker[0];
				} else {
					_speakerChar = _speaker[0];
				}
				
				for(var c = 0; c < _raw; c++) {
					var _char_pos = c + 1;
			
					#region //Store individual character in "char" array
					    var _char = string_char_at(text[p], c + 1);
						
					    if _char == "<" {
					        var _tag = string_char_at(text[p], c + 2);
							var _gradCheck = string_char_at(text[p], c + 3);

					        switch (_tag) {
								#region //Change Speaker Sprite
									case "0":
										_cSprite = _speaker[0];
									break;
								
									case "1":
										_cSprite = _speaker[1];
									break;
									
									case "2":
										_cSprite = _speaker[2];
									break;
									
									case "3":
										_cSprite = _speaker[3];
									break;
									
									case "4":
										_cSprite = _speaker[4];
									break;
									
									case "5":
										_cSprite = _speaker[5];
									break;
									
									case "6":
										_cSprite = _speaker[6];
									break;
									
									case "7":
										_cSprite = _speaker[7];
									break;
									
									case "8":
										_cSprite = _speaker[8];
									break;
									
									case "9":
										_cSprite = _speaker[9];
									break;
								#endregion
								
								#region //Moving Text Effects
									//Wavy
									case "~":
										_wavyText = true;
									break;
									
									//Shake
									case "^":
										_shakeText = true;
									break;
									
									//Circle
									case "@":
										_circleText = true;
									break;
									
									//Scale
									case "*":
										_scaleText = true;
									break;
									
									//Stop
									case "-":
										_stopText = true;
									break;
									
									//Pause
									case "_":
										_pauseText = true;
									break;
								#endregion
								
								#region //Colors
									//Rainbow
									case ";":
										if _gradCheck != "`" {
											_rainbowTop = true;
										} else {
											c++;
										}
									
										_rainbowText = true;
									break;
									
									//Gray
									case ":":
										if _gradCheck != "`" {
											_topCol = c_gray;
										} else {
											c++;
										}
									
										_botCol = c_gray;
									break;
									
									//Black
									case "'":
										if _gradCheck != "`" {
											_topCol = c_black;
										} else {
											c++;
										}
									
										_botCol = c_black;
									break;
									
									//White
						            case "w": 
										_topCol = c_white; 
										_botCol = c_white; 
									break;
									
									
									//Red
						            case "r":
										if _gradCheck != "`" {
											_topCol = c_red;
										} else {
											c++;
										}
									
										_botCol = c_red; 
									break;
									
									//Orange
									case "o":
										if _gradCheck != "`" {
											_topCol = c_orange; 
										} else {
											c++;
										}
									
										_botCol = c_orange; 
									break;
									
									//Yellow
									case "y":
										if _gradCheck != "`" {
											_topCol = c_yellow; 
										} else {
											c++;
										}
									
										_botCol = c_yellow; 
									break;
									
									//Green
									case "g":
										if _gradCheck != "`" {
											_topCol = c_green;
										} else {
											c++;
										}
									
										_botCol = c_green;
									break;
									
									//Cyan
									case "a":
										if _gradCheck != "`" {
											_topCol = c_aqua;
										} else {
											c++;
										}
									
										_botCol = c_aqua;
									break;
									
									//Blue
									case "b":
										if _gradCheck != "`" {
											_topCol = c_blue;
										} else {
											c++;
										}
									
										_botCol = c_blue;
									break;
									
									//Purple
									case "p":
										if _gradCheck != "`" {
											_topCol = c_purple;
										} else {
											c++;
										}
									
										_botCol = c_purple;
									break;
									
									//Magenta (I'm not calling it "Fuchsia")
									case "m":
										if _gradCheck != "`" {
											_topCol = c_fuchsia;
										} else {
											c++;
										}
									
										_botCol = c_fuchsia;
									break;
								#endregion
					        }
							
					        c++;
					        continue;
					    }
						
					    if _char == ">" {
							_wavyText = false;
							_shakeText = false;
							_circleText = false;
							_scaleText = false;
							_stopText = false;
							_pauseText = false;
							
							_rainbowText = false;
							_rainbowTop = false;
					        _topCol = c_white;
							_botCol = c_white;
					        continue;
					    }
						
						//Get current width of the line
						var _char_w = string_width(_char);
						
						_lineWidthCheck += _char_w;
			
						//Get the last free space
						if _char == " " {
							_lastSpace = _vIndex + 1;
							_wordIndex++;
						}
				
						//Get the line breaks
						if _lineWidthCheck > line_width or _char == "\n" or _char == "\\n" {
						    line_break_pos[line_break_num[p], p] = _lastSpace;
						    line_break_num[p]++;
						    _lineWidthCheck = 0;
						}

					    char[_vIndex, p] = _char;

						col_1[_vIndex, p] = _topCol;
						col_2[_vIndex, p] = _topCol;
						col_3[_vIndex, p] = _botCol;
						col_4[_vIndex, p] = _botCol;
						
						rainbowText[_vIndex, p] = _rainbowText;
						rainbowTop[_vIndex, p] = _rainbowTop;
						
						scaleText[_vIndex, p] = _scaleText;
						circleText[_vIndex, p] = _circleText;
						shake_text[_vIndex, p] = _shakeText;
						float_text[_vIndex, p] = _wavyText;
						
						speakerSpriteAt[_vIndex, p] = _cSprite;
						
					    _vIndex++;

						text_length[p] = _vIndex;
					#endregion
			
				}
			#endregion
			
			#region //Getting each characters' coords
				var _cLine = 0;
				var _lineX = 0;

				for (var c = 0; c < text_length[p]; c++) {
				    var _char_pos = c + 1;

				    if line_break_num[p] > 0 {
				        for (var lb = 0; lb < line_break_num[p]; lb++) {
				            if c >= line_break_pos[lb, p] {
				                _cLine = lb + 1;
				            }
				        }
				    }

				    if c == 0 or (_cLine > 0 && c == line_break_pos[_cLine - 1, p]) {
				        _lineX = 0;
				    }

				    char_x[c, p] = _lineX;
				    char_y[c, p] = _cLine * line_sep;

				    _lineX += string_width(char[c, p]);
				}
			#endregion
		}
	}
	
	//Finish Setup
	if setupComplete {
		setup = false;
	}
#endregion

#region //Expand Textbox
	var _textboxWidth = 0;

	if setup {
		_textboxWidth = 728;
	
		if instance_exists(obj_Player) {
			obj_Player.can_MoveFULL = false;
		}
	} else if !setup && setupComplete {
		_textboxWidth = 0;
	
		if starterText_Width <= 0.5 {
			instance_destroy();
		
			if instance_exists(obj_Player) {
				obj_Player.can_MoveFULL = true;
			}
		}
	}

	starterText_Width = lerp(starterText_Width, _textboxWidth, 0.25);
#endregion

#region //Type Writer Effect
	if text_pause_timer <= 0 && !stopText {
		if draw_char < text_length[page] {
			if !speaker2Char[page] {
				if speakerChecker == speaker_Name[page] && xChange >= xChangeFinish {
					draw_char += text_spd;
				}
			} else {
				if speakerChecker2 == speaker_Name[page] && xChange2 <= -xChangeFinish + 120 {
					draw_char += text_spd;
				}
			}
		
			draw_char = clamp(draw_char, 0, text_length[page]);
		
			var _check_char = string_char_at(text[page], draw_char);
		
			if !speaker2Char[page] && speakerChecker == speaker_Name[page] && xChange >= xChangeFinish {
				if _check_char == "." or _check_char == "," {
					text_pause_timer = text_pause_time;
					
					if _check_char == " " {
						if !audio_is_playing(snd[page]) {
							audio_play_sound(snd[page], 8, false, _finalVol);
						}
					}
				} else {
					if snd_count < snd_delay && _check_char != " " {
						snd_count++;
					} else {
						snd_count = 0;
						audio_play_sound(snd[page], 8, false, _finalVol);
					}
				}
			} else if speaker2Char[page] && speakerChecker2 == speaker_Name[page] && xChange2 <= -xChangeFinish + 120 {
				if _check_char == "." or _check_char == "," {
					text_pause_timer = text_pause_time;
					
					if _check_char == " " {
						if !audio_is_playing(snd[page]) {
							audio_play_sound(snd[page], 8, false, _finalVol);
						}
					}
				} else {
					if snd_count < snd_delay && _check_char != " " {
						snd_count++;
					} else {
						snd_count = 0;
						audio_play_sound(snd[page], 8, false, _finalVol);
					}
				}
			}
		}
	} else {
		text_pause_timer--;
	}
#endregion

#region //Force Page Flip without Input
	if forceLine[page] && draw_char == text_length[page] && option_number == 0 {
		//Next Page
		if page < page_number - 1 {
			page++;
			draw_char = 0;
		} else {
			setupComplete = true;
		}
	} else if forceLine[page] && draw_char == text_length[page] && option_number != 0 {
		//Next Page
		if page < page_number - 1 {
			page++;
			draw_char = 0;
		} else {
			//Link text for option
			if option_number > 0 {
				create_textbox(option_link_id[option_pos]);
				
				if global.PlayerChar == 0 {
					draw_sprite_ext(spr_CursorHead, image_index / 6, x, y, 1, 1, 0, c_white, 1);
				}
			}
		
			setupComplete = true;
		}
	}
#endregion

#region //Flip Through Pages
	if setup && !setupComplete {
		if confirm_key && !forceLine[page] {
			//If typing is done
			if draw_char == text_length[page] {
				obj_SFXManager.funkinFav = true;
				textboxYChange = 10;
		
				//Next Page
				if page < page_number - 1 {
					page++;
					draw_char = 0;
				} else {
					//Link text for option
					if option_number > 0 {
						create_textbox(option_link_id[option_pos]);
				
						if global.PlayerChar == 0 {
							draw_sprite_ext(spr_CursorHead, image_index / 6, x, y, 1, 1, 0, c_white, 1);
						}
					}
			
					setupComplete = true;
				}
			}
		} else if skip_key && draw_char != text_length[page] && !forceLine[page] {
			//Skip Text for Page
			draw_char = text_length[page];
		
			if !speaker2Char[page] {
				speakerChecker = speaker_Name[page];
				xChange = xChangeFinish;
			} else {
				speakerChecker2 = speaker_Name[page];
				xChange2 = -xChangeFinish + 120;
			}
		}

		//Deltarune Wrist Protector Mechanic
		if wrist_key && !forceLine[page] {
			if draw_char != text_length[page] {
				//Skip Text for Page
				draw_char = text_length[page];
		
				if !speaker2Char[page] {
					speakerChecker = speaker_Name[page];
					xChange = xChangeFinish;
				} else {
					speakerChecker2 = speaker_Name[page];
					xChange2 = -xChangeFinish + 120;
				}
			} else {
				//If typing is done
				if draw_char == text_length[page] {
		
					//Next Page
					if page < page_number - 1 {
						page++;
						draw_char = 0;
					} else {
						//Link text for option
						if option_number == 0 {
							setupComplete = true;
						
							/*create_textbox(option_link_id[option_pos]);
				
							if global.PlayerChar == 0 {
								draw_sprite_ext(spr_CursorHead, image_index / 6, x, y, 1, 1, 0, c_white, 1);
							}*/
						}
					}
				}
			}
		}
	}
#endregion

#region //Drawing the actual textbox
	var _txtb_x = textbox_x + text_x_offset[page];
	var _txtb_y = textbox_y;

	txtb_img += txtb_img_spd;

	//Stop Speaker Xs
	if xChange >= xChangeFinish {
		xChange = xChangeFinish;
	}

	if xChange2 <= -xChangeFinish {
		xChange2 = -xChangeFinish;
	}

	//Speaker X Bullshit
	if !speaker2Char[page] {
		//Speaker 1
		if xChange < xChangeFinish && !setupComplete && speakerChecker == speaker_Name[page] {
			xChange += 20;
			sprite_index = speakerSpriteAt[0, page];
		}

		if speakerChecker != speaker_Name[page] {
			if xChange > -xChangeStart {
				xChange -= 20;
			} else if xChange <= -xChangeStart {
				speakerChecker = speaker_Name[page];
				
				if draw_char > 0 {
					var i = draw_char - 1;
					
					if i >= 0 && i < text_length[page] {
						sprite_index = speakerSpriteAt[i, page];
					}
				}
			}
		} else {
			if draw_char > 0 {
				var i = draw_char - 1;
				
				if i >= 0 && i < text_length[page] {
					if i < array_length(speakerSpriteAt) {
						show_debug_message("Sprite at i: " + string(speakerSpriteAt[i, page]));
						
						if sprite_index != speakerSpriteAt[i, page] {
							sprite_index = speakerSpriteAt[i, page];
							increaseY = true;
						}
					}
				}
			}
		}
	} else {
		//Speaker 2
		if xChange2 > -xChangeFinish + 120 && !setupComplete && speakerChecker2 == speaker_Name[page] {
			xChange2 -= 20;
			_speakerChar = speakerSpriteAt[0, page];
		}

		if speakerChecker2 != speaker_Name[page] {
			if xChange2 < xChangeStart {
				xChange2 += 20;
			} else if xChange2 >= xChangeStart {
				speakerChecker2 = speaker_Name[page];
				
				if draw_char > 0 {
					var i = draw_char - 1;

					if i >= 0 && i < text_length[page] {
						_speakerChar = speakerSpriteAt[i, page];
					}
				}
			}
		} else {
			if draw_char > 0 {
				var i = draw_char - 1;
				
				if i >= 0 && i < text_length[page] {
					if i < array_length(speakerSpriteAt) {
						show_debug_message("Sprite at i: " + string(speakerSpriteAt[i, page]));
						
						if _speakerChar != speakerSpriteAt[i, page] {
							_speakerChar = speakerSpriteAt[i, page];
							increaseY = true;
						}
					}
				}
			}
		}
	}

	//Reset positions after text is done.
	if setupComplete {
		if xChange > -xChangeStart {
			xChange -= 20;
		}
	
		if xChange2 < xChangeStart {
			xChange2 += 20;
		}
	}

	//Draw speaker
	if speaker_sprite[page] != noone && !speaker2Char[page] {
		if draw_char == text_length[page] {
			image_index = 0;
		}
	}

	//Draw 2nd Speaker
	if speaker_sprite[page] != noone && speaker2Char[page] {
		if draw_char == text_length[page] {
			image_index = 0;
		}
	}

	//Set Character Color
	if !speaker2Char[page] {
		if _charCol < 1 {
			_charCol += 0.05;
		}
	 
		if _charCol2 > 0.75 {
			_charCol2 -= 0.05; 
		}
	} else {
		if _charCol > 0.75 {
			_charCol -= 0.05;
		}
	 
		if _charCol2 < 1 {
			_charCol2 += 0.05; 
		}
	}


	//Apply Gravity
	if !increaseY {
		if yChange < 0 {
			yChange += grav;
		} else if yChange >= 0 {
			yChange = 0;
		}

		if yChange2 < 0 {
			yChange2 += grav;
		} else if yChange2 >= 0 {
			yChange2 = 0;
		}
	} else {
		if !speaker2Char[page] {
			if yChange > yingEverywhere {
				yChange -= grav;
			} else if yChange <= yingEverywhere {
				increaseY = false;
			}
		} else {
			if yChange2 > yingEverywhere {
				yChange2 -= grav;
			} else if yChange2 <= yingEverywhere {
				increaseY = false;
			}
		}
	}
#endregion

#region //Draw actual speaker
	var _speaker_x = textbox_x + xChange;
	var _index = 0;

	if !speaker2Char[page] {
		_index = image_index;
	}

	draw_sprite_ext(sprite_index, _index, _speaker_x + 100, textbox_y + 15 + yChange, 0.25, 0.25, 0, c_white, _charCol);

	//Draw actual speaker 2
	var _speaker2_x = textbox_x + xChange2;
	var _index2 = 0;

	if speaker2Char[page] {
		_index2 = image_index;
	}
	
	draw_sprite_ext(_speakerChar, _index2, _speaker2_x + 540, textbox_y + 15 + yChange2, -0.25, 0.25, 0, c_white, _charCol2);

	//Go up on confirm
	if textboxYChange > 0 {
		textboxYChange -= 1;
	} else if textboxYChange <= 0 {
		textboxYChange = 0;
	}
#endregion

#region //Back of textbox
	draw_sprite_ext(spr_TextboxHead, 0, _txtb_x, _txtb_y + textboxYChange, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 1);
	draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y + textboxYChange, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 0.5);
	draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x, _txtb_y + textboxYChange, starterText_Width/txtb_spr_w + 0.15, textbox_height/txtb_spr_h, 0, c_white, 1);

	//Options
	up_key = up_Key_Once;
	down_key = down_Key_Once;

	if draw_char == text_length[page] && page == page_number - 1 {
		//Option selection
		option_pos += down_key - up_key;
		option_pos = clamp(option_pos, 0, option_number - 1);
	
		if (down_Key_Once or up_Key_Once) && !clamp(option_pos, 0, option_number - 1) {
			obj_SFXManager.menuTap = true;
		}
	
	
		//Drawing options
		var _op_space = 30;
		var _op_bord = 8;
	
		for(var op = 0; op < option_number; op++;) {
			//Option box
			var _o_w = string_width(option[op]) + _op_bord * 2;
		
			draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 370, _txtb_y - _op_space * option_number + _op_space * op - 3, _o_w/txtb_spr_w, (_op_space - 2)/txtb_spr_h + 0.05, 0, c_white, 1);
		
			//Draw Cursor
			if option_pos == op {
				draw_sprite_ext(spr_CursorHead, image_index / 6, _txtb_x + 320, _txtb_y - 15 - _op_space * option_number + _op_space * op + 5, 0.75, 0.75, 0, c_white, 1);
			}
		
			//Option text
			draw_text(_txtb_x + 370 + _op_bord, _txtb_y - 4 - _op_space * option_number + _op_space * op + 2, option[op]);
		}
	}
#endregion

#region //Drawing the actual text
	for(var c = 0; c < draw_char; c++) {
		///-----Special Stuffs-----///
		
		//Rainbow
		if rainbowText[c, page] {
			var _speed = 25;
									
			if global.SimplifyVFX {
				_speed = 1;
			}
									
			var _hue = (c * _speed + global.ColTime) mod 360;
			var _col = make_color_hsv(_hue, 175, 255);
		
			//Colors
			if rainbowTop[c, page] {
				col_1[c, page] = _col;
				col_2[c, page] = _col;
			}
			
			col_3[c, page] = _col;
			col_4[c, page] = _col;
		}
		
		//Circle Text
		var _cirX = 0;
		var _cirY = 0;
		
		if circleText[c, page] && !global.SimplifyVFX {
			circleDir[c, page] += -6;
			_cirX = dcos(circleDir[c, page]) * 2;
			_cirY = dsin(circleDir[c, page]) * 2;
		}
		
		//Scale Text
		var _tScale = 1;
		
		if scaleText[c, page] && !global.SimplifyVFX {
			scaleDir[c, page] += 4;
			_tScale = abs(lengthdir_x(1, scaleDir[c, page]));
		}
		
		//Wavy text
		var _float_y = 0;
	
		if float_text[c, page] && !global.SimplifyVFX {
			float_dir[c, page] += -8;
			_float_y = dsin(float_dir[c, page]) * 2;
		}
	
		//Shake text
		var _shake_x = 0;
		var _shake_y = 0;
	
		if shake_text[c, page] && !global.SimplifyVFX {
			shake_timer[c, page]--;
		
			if shake_timer[c, page] <= 0 {
				shake_timer[c, page] = irandom_range(4, 8);
				shake_dir[c, page] = irandom(360);
			}
		
			if shake_timer[c, page] <= 2 {
				_shake_x = lengthdir_x(1, shake_dir[c, page]);
				_shake_y = lengthdir_y(1, shake_dir[c, page]);
			}
		}
	
	
		//Change Text Alpha
		if setup && !setupComplete {
			if text_Alpha[c, page] < 1 {
				text_Alpha[c, page] += text_AlphaAdd[c, page];
			}
		} else if !setup && setupComplete {
			text_Alpha[c, page] = 0;
		}
	
	
		//Change Text Size
		if text_Size[c, page] > 1 {
			text_Size[c, page] -= text_SizeRemove[c, page];
		}
	
		//The text
		draw_text_transformed_color(_camX + 47 + char_x[c, page] - 10 + _shake_x + _cirX, _camY + 331 + char_y[c, page] - 17 + _float_y + _shake_y + _cirY, char[c, page], text_Size[c, page] * _tScale, text_Size[c, page] * _tScale, 0, col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], text_Alpha[c, page]);
	}
	
	if draw_char == text_length[page] && !setupComplete {
		scr_GetCharRushBoostIcon();
		var _sprIndex = sprite_get_number(_charCheck3);
		
		if iconIndex < _sprIndex {
			iconIndex += 1 / 10;
		} else {
			iconIndex = 0;
		}
		
		draw_sprite_ext(_charCheck3, iconIndex, _camX + 720, _camY + 395, 1, 1, 0, c_white, 1);
	}
	
	//Character Name
	draw_set_halign(fa_center);
		/*sprTextbox = txtb_spr[page];
	
		if !speaker2Char[page] {
			if speakerChecker == speaker_Name[page] && speakerChecker != "No One" {
				draw_sprite_ext(sprTextbox, txtb_img, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_grey, 1);
				draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_white, 1);
				draw_text(_txtb_x + 200 + 70, _txtb_y - 32 + 4, string(speakerChecker));
			}
		} else {
			if speakerChecker2 == speaker_Name[page] && speakerChecker2 != "No One" {
				draw_sprite_ext(sprTextbox, txtb_img, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_grey, 1);
				draw_sprite_ext(spr_TextboxTrans, 0, _txtb_x + 190, _txtb_y - 32, 5, 1, 0, c_white, 1);
				draw_text(_txtb_x + 200 + 70, _txtb_y - 32 + 4, string(speakerChecker2));
			}
		}*/
	draw_set_halign(fa_left);
#endregion

