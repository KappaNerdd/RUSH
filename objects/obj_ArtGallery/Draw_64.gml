display_set_gui_size(768, 432);

var _col = merge_colour(c_blue, c_fuchsia, colNum);
var _menu = gallArt;
	
switch(galleries[galleryChoice]) {
	case "gall_Art":
		_menu = gallArt;
	break;
	
	case "gall_FanArt":
		_menu = gallFanArt;
	break;
	
	case "gall_Concept":
		_menu = gallConcept;
	break;
	
	case "gall_Unused":
		_menu = gallUnused;
	break;
	
	case "gall_Cats":
		_menu = gallCats;
	break;
}

var _array = array_length(_menu);

#region //Background
	draw_sprite_ext(sprite_index, image_index, 0, 0, 12, 12, 0, _col, 0.5);
#endregion

#region //Art
	for(var a = 0; a < _array; a++) {
		var _scaleArt = 0.3;
		var _alphaArt = zoomAlpha / 2;
		var _moveX = 400 * a;
		var _actualX = 384 + _moveX + moveX - extraX;
		
		if artChoice == a {
			_scaleArt = 0.4 + zoomed;
			_alphaArt = 1;
			
			if _menu[a][0] == spr_FanMIND or _menu[a][0] == spr_FanDSCase or _menu[a][0] == spr_GallSplash030SAGE25 {
				_scaleArt = 0.2 + zoomed;
			}
		} else {
			if _menu[a][0] == spr_FanMIND or _menu[a][0] == spr_FanDSCase or _menu[a][0] == spr_GallSplash030SAGE25 {
				_scaleArt = 0.1;
			}
		}
		
		if _actualX > -200 && _actualX < room_width + 200 {
			draw_sprite_ext(_menu[a][0], 0, _actualX, 216 + moveY, _scaleArt, _scaleArt, 0, c_white, _alphaArt);
		}
	}
#endregion

#region //Foreground
	draw_sprite_ext(spr_CharSelectTop, 0, 0, -72, 1.2, 1, 0, _col, zoomAlpha);
	draw_sprite_ext(spr_CharSelectTop, 0, 0, 502, 1.2, -1, 0, _col, zoomAlpha);
	
	for(var i = 0; i < array_length(galleries); i++) {
		var _scale = 1;
		var _alpha = 0.5;
		var _gapX = 330;
		var _y = 20;
		
		if galleryChoice == i {
			_scale = 2;
			_alpha = 1;
			_y = 0;
		}
		
		if chosenGallery {
			_alpha = 0.5;
		} else {
			draw_set_halign(fa_middle);
				draw_text_transformed_color(384 + (_gapX * i) + gallX, _y, scr_LocalText(galleries[i]), _scale, _scale, 0, c_white, c_white, c_white, c_white, _alpha * zoomAlpha);
			draw_set_halign(fa_left);
		}
	}
	
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
		if chosenGallery {
			var _spriteWidth = sprite_get_width(_menu[artChoice][0]) / 4;
			
			draw_text_transformed_color(384, 25, scr_LocalText(_menu[artChoice][1]), 1.5, 1.5, 0, c_white, c_white, c_white, c_white, zoomAlpha);
			draw_sprite_ext(spr_TextboxULTRAKILL, 0, 384, 380, 11, 1, 0, c_white, 0.5 * zoomAlpha);
			draw_text_ext_transformed_color(384, 380, scr_LocalText(_menu[artChoice][1] + "Desc"), 20, 600, 1, 1, 0, c_white, c_white, c_white, c_white, zoomAlpha);
			
			draw_sprite_ext(spr_CharSelectArrow, rightFrames, 384 + _spriteWidth + 20, 216, 1.5, 1.5, 0, c_white, zoomAlpha);
			draw_sprite_ext(spr_CharSelectArrow, leftFrames, 384 - _spriteWidth - 20, 216, -1.5, 1.5, 0, c_white, zoomAlpha);
		} else {
			draw_sprite_ext(spr_CharSelectArrow, rightFrames, 384 + 230, 25, 1, 1, 0, c_white, zoomAlpha);
			draw_sprite_ext(spr_CharSelectArrow, leftFrames, 384 - 230, 25, -1, 1, 0, c_white, zoomAlpha);
		}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var _butt = obj_CustomAct1KeySpeed.sprite_index;
	var _jumpIndex = obj_CustomJumpKeySpeed.image_index;
	var _act1Index = obj_CustomAct1KeySpeed.image_index;
	var _otherButt = spr_BoomboxButts;
	var _confirmIndex = 3;
	var _backIndex = 2;
	
	if zoomChoice {
		_jumpIndex = obj_CustomAct2KeySpeed.image_index;
		_act1Index = obj_CustomAct4KeySpeed.image_index;
		_otherButt = spr_GalleryMag;
		_confirmIndex = 0;
		_backIndex = 1;
		
		draw_sprite_ext(_butt, obj_CustomAct1KeySpeed.image_index, 700, 170, 1, 1, 0, c_white, 1);
		draw_sprite_ext(spr_BoomboxButts, 2, 732, 210, 1, 1, 0, c_white, 1);
	}
	
	draw_sprite_ext(_butt, _jumpIndex, 640, 120, 1, 1, 0, c_white, 1);
	draw_sprite_ext(_otherButt, _confirmIndex, 672, 80, 1, 1, 0, c_white, 1);
	
	draw_sprite_ext(_butt, _act1Index, 700, 120, 1, 1, 0, c_white, 1);
	draw_sprite_ext(_otherButt, _backIndex, 732, 80, 1, 1, 0, c_white, 1);
#endregion