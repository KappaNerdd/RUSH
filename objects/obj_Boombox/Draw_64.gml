display_set_gui_size(640, 360);

var _col = c_yellow;
var _altButtCol = c_grey;
var _boomCol = c_grey;
var _right = 0;
var _left = 0;
var _bruhRight = rightArrow;
var _bruhLeft = leftArrow;

if chosenBoom {
	_boomCol = c_white;
	_right = rightArrow;
	_left = leftArrow;
	_bruhRight = 0;
	_bruhLeft = 0;
}

if chosenPlay && !chosenBoom {
	_altButtCol = c_white;
}

if boomChoice == 1 {
	_col = c_lime;
}

draw_sprite_ext(spr_TextboxBlack, 0, boxX - 20, boxY - 40, 5, 3, 0, c_black, 1);
draw_sprite_ext(spr_TextboxBlack, 0, 0, 0, 40, 26, 0, c_black, bgAlph);

var _text = "freeplay_NormJuke";
	
if boomChoice == 1 {
	if !chosenBoom {
		_text = "freeplay_CustJuke";
	}
}

if boomChoice == 0 && chosenBoom {
	draw_set_halign(fa_center);
		gpu_set_fog(true, c_white, 0, 1);
			draw_sprite_ext(global.JukeboxPlaylist[global.JukeBoxChoice][2][0], 0, boxX + 330, 190 * (bgAlph * 2) + albumY * 2.5, 0.25, 0.25, -15, c_white, bgAlph * 2);
		gpu_set_fog(false, c_black, 0, 1);
		
		draw_sprite_ext(global.JukeboxPlaylist[global.JukeBoxChoice][2][0], 0, boxX + 320, 180 * (bgAlph * 2) + albumY, 0.25, 0.25, -5, c_white, bgAlph * 2);
	draw_set_halign(fa_left);
} else if boomChoice == 1 && chosenBoom {
	gpu_set_fog(true, c_white, 0, 1);
		draw_sprite_ext(custAlbum, 0, boxX + 330, 190 * (bgAlph * 2) + albumY * 2.5, 0.25, 0.25, -15, c_white, bgAlph * 2);
	gpu_set_fog(false, c_black, 0, 1);
		
	draw_sprite_ext(custAlbum, 0, boxX + 320, 180 * (bgAlph * 2) + albumY, 0.25, 0.25, -5, c_white, bgAlph * 2);
}

if chosenBoom {
	var _altText = global.JukeboxPlaylist[global.JukeBoxChoice][2][1];
	
	if boomChoice == 1 {
		_altText = string(filename_name(global.NewJukes[playChoice]));
	}
	
	draw_set_halign(fa_center);
		draw_sprite_ext(spr_MusTagIcon, 0, boxX + moveTextX - 45, boxY - 56, 1, 1, 0, _col, 1);
		draw_text_ext_transformed_color(boxX + 310, 180 * (bgAlph * 2) + albumY + 100, scr_LocalText(_altText), 20, 200, 1, 1, -5, c_white, c_white, c_white, c_white, bgAlph * 2);
	draw_set_halign(fa_left);
}

gpu_set_scissor(0, 0, 96 * 8, 64 * 15);
	var _track = global.JukeboxPlaylist[global.JukeBoxChoice][1];

	if boomChoice == 1 {
		if chosenPlay {
			if !chosenBoom {
				if array_length(global.NewJukes) > 0 {
					_track = string(filename_name(global.NewJukes[playChoice]));
				} else {
					_track = "juke_NoFolders";
				}
			} else {
				if array_length(global.CustomJukeboxPlaylist) > 0 {
					_track = string(filename_name(global.CustomJukeboxPlaylist[global.CustomJukeChoice]));
				} else {
					_track = "juke_NoTracks";
				}
			}
		} else {
			_track = _text;
		}
	} else {
		if !chosenBoom {
			_track = _text;
		}
	}

	draw_text_transformed_color(boxX + moveTextX - 25, boxY - 68, scr_LocalText(_track), 1, 1, 0, _col, _col, _col, _col, 1);
gpu_set_scissor(0, 0, display_get_width(), display_get_height());

draw_sprite_ext(sprite_index, boomChoice, boxX, boxY, image_xscale, image_yscale, 0, _boomCol, 1);
draw_sprite_ext(spr_BoomboxArrows, _right + (2 * boomChoice), boxX + 50, boxY - 16, 1, 1, 0, _boomCol, bgAlph * 2);
draw_sprite_ext(spr_BoomboxArrows, _left + (2 * boomChoice), boxX - 50, boxY - 16, -1, 1, 0, _boomCol, bgAlph * 2);

if boomChoice == 1 {
	draw_sprite_ext(spr_BoomboxArrows, _bruhRight + (2 * boomChoice), boxX + 82, boxY - 58, 1, 1, 0, _altButtCol, bgAlph * 2);
	draw_sprite_ext(spr_BoomboxArrows, _bruhLeft + (2 * boomChoice), boxX - 82, boxY - 58, -1, 1, 0, _altButtCol, bgAlph * 2);
}

if !chosenBoom && !chosenPlay {
	draw_sprite_ext(spr_CharSelectArrow, upFrames, boxX, boxY - 120, 1, 1, 90, c_white, bgAlph * 2);
	draw_sprite_ext(spr_CharSelectArrow, downFrames, boxX, boxY + 120, -1, 1, 90, c_white, bgAlph * 2);
}

draw_sprite_ext(spr_BoomboxSpeaker, 0, boxX - 125, boxY, speakerScale / 4, speakerScale / 4, 0, _boomCol, 1);
draw_sprite_ext(spr_BoomboxSpeaker, 0, boxX + 125, boxY, speakerScale / 4, speakerScale / 4, 0, _boomCol, 1);
draw_sprite_ext(spr_BoomboxSpeaker, 1, boxX - 125, boxY, 1, 1, 0, _boomCol, 1);
draw_sprite_ext(spr_BoomboxSpeaker, 1, boxX + 125, boxY, 1, 1, 0, _boomCol, 1);

draw_sprite_ext(spr_BoomboxSpeakerChar, 1 - boomChoice, boxX - 125, boxY, 1, 1, 0, _boomCol, 1);
draw_sprite_ext(spr_BoomboxSpeakerChar, boomChoice, boxX + 125, boxY, 1, 1, 0, _boomCol, 1);


draw_set_valign(fa_middle);
draw_set_font(global.BoomboxFont);
	var _hund = "0";
	var _ten = "0";
	var _int = global.JukeBoxChoice + 1;
	
	if boomChoice == 1 {
		_int = global.CustomJukeChoice + 1;
	}
	
	if _int >= 10 {
		_ten = "";
		
		if _int >= 100 {
			_hund = "";
		}
	}
	
	var _num = _hund + _ten + string(_int);
	
	if boomChoice == 1 {
		if !chosenBoom {
			_num = "CU5";
		}
	}

	draw_text_transformed_color(boxX - 25, boxY - 16, _num, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_set_font(global.font_main);
draw_set_valign(fa_left);

var _buttSprite = obj_CustomJumpKeySpeed.sprite_index;
var _playIndex = 0;
var _buttScale = 1;

if chosenBoom {
	if boomChoice == 0 {
		if audio_is_playing(global.JukeboxPlaylist[global.JukeBoxChoice][0]) {
			_playIndex = 1;
		}
	} else {
		if custNum == global.CustomJukeChoice {
			_playIndex = 1;
		}
	}
} else {
	_playIndex = 3;
}

draw_sprite_ext(_buttSprite, obj_CustomJumpKeySpeed.image_index, boxX - 160, boxY + 110, _buttScale, _buttScale, 0, c_white, 1);
draw_sprite_ext(spr_BoomboxButts, _playIndex, boxX - 128, boxY + 145, _buttScale, _buttScale, 0, c_white, 1);

draw_sprite_ext(_buttSprite, obj_CustomAct1KeySpeed.image_index, boxX + 80, boxY + 110, _buttScale, _buttScale, 0, c_white, 1);
draw_sprite_ext(spr_BoomboxButts, 2, boxX + 112, boxY + 145, _buttScale, _buttScale, 0, c_white, 1);