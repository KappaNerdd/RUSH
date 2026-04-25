
	var _ringBack = spr_GoalRingBackHalf;
	var _ringFront = spr_GoalRingFrontHalf;
	var _ringWhole = spr_GoalRingWhole;
	var _change = 1;
	var _change2 = 2;
	var _col1 = c_white;
	var _col2 = c_black;
	
	if global.MIND or global.PlayerChar == 0 {
		_col1 = c_black;
		_col2 = c_white;
		_ringBack = spr_GoalRingBackHalfHead;
		_ringFront = spr_GoalRingFrontHalfHead;
		_ringWhole = spr_GoalRingWholeStillHead
	}
	
	var _spr = _ringBack;
	var _spr2 = _ringFront;
	var _spr3 = _ringWhole;
	var _spr4 = iconSprite;

	if goalTimer > 0 or image_speed != 0 {
		/*if global.Outline {
			gpu_set_fog(true, _col2, 0, 1);
				draw_sprite_ext(_spr, image_index, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr, image_index, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr, image_index, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr, image_index, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
	
			gpu_set_fog(true, _col1, 0, 1);
				draw_sprite_ext(_spr, image_index, round(x) + _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr, image_index, round(x) - _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr, image_index, round(x), round(y) + _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr, image_index, round(x), round(y) - _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		}*/
	
		draw_sprite_ext(_ringBack, image_index, x, y, image_xscale, image_yscale, 0, global.fullRGB, image_alpha);
		draw_sprite_ext(_ringBack, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5);
	}

	if goalTimer > 0 {
		/*if global.Outline {
			gpu_set_fog(true, _col2, 0, 1);
				draw_sprite_ext(_spr4, 0, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
	
			gpu_set_fog(true, _col1, 0, 1);
				draw_sprite_ext(_spr4, 0, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		}*/
	
		draw_sprite_ext(iconSprite, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
	}

	if goalTimer <= 0 && image_speed > 0 {
		/*if global.Outline {
			gpu_set_fog(true, _col2, 0, 1);
				draw_sprite_ext(_spr4, 0, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
	
			gpu_set_fog(true, _col1, 0, 1);
				draw_sprite_ext(_spr4, 0, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 0, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		}*/
	
		draw_sprite_ext(iconSprite, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
	}

	if goalTimer > 0 or image_speed != 0 {
		/*if global.Outline {
			gpu_set_fog(true, _col2, 0, 1);
				draw_sprite_ext(_spr2, image_index, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr2, image_index, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr2, image_index, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr2, image_index, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
	
			gpu_set_fog(true, _col1, 0, 1);
				draw_sprite_ext(_spr2, image_index, round(x) + _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr2, image_index, round(x) - _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr2, image_index, round(x), round(y) + _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr2, image_index, round(x), round(y) - _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		}*/
	
		draw_sprite_ext(_ringFront, image_index, x, y, image_xscale, image_yscale, 0, global.fullRGB, image_alpha);
		draw_sprite_ext(_ringFront, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5);
	} else if goalTimer <= 0 && image_speed == 0 {
		/*if global.Outline {
			gpu_set_fog(true, _col2, 0, 1);
				draw_sprite_ext(_spr3, image_index, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr3, image_index, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr3, image_index, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr3, image_index, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
	
			gpu_set_fog(true, _col1, 0, 1);
				draw_sprite_ext(_spr3, image_index, round(x) + _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr3, image_index, round(x) - _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr3, image_index, round(x), round(y) + _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
				draw_sprite_ext(_spr3, image_index, round(x), round(y) - _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		}*/
	
		draw_sprite_ext(_ringWhole, mindFrames, x, y, image_xscale, image_yscale, 0, global.fullRGB, image_alpha);
	
		/*if global.Outline {
			gpu_set_fog(true, _col2, 0, 1);
				draw_sprite_ext(_spr4, 1, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 1, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 1, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 1, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
	
			gpu_set_fog(true, _col1, 0, 1);
				draw_sprite_ext(_spr4, 1, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 1, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 1, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
				draw_sprite_ext(_spr4, 1, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		}*/
	
		draw_sprite_ext(iconSprite, 1, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
	}

