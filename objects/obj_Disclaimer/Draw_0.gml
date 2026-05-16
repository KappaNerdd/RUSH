display_set_gui_size(768, 432);

draw_set_halign(fa_middle);
	if !instance_exists(obj_NewOptions) && !createOpt {
		draw_text_transformed(384, 10, scr_LocalText("game_Disc") + "\n-----------------------------------------------", 1.5, 1.5, 0);
		
		//draw_set_valign(fa_center);
			draw_text_ext_transformed(384, 80, scr_LocalText("game_MainDisc"), 20, 650, 1, 1, 0);
		//draw_set_valign(fa_top);
		
		for(var i = 0; i < 2; i++) {
			var _text = scr_LocalText("opt_Yes");
			var _x = 100;
			var _y = 400;
			var _align = fa_left;
			var _index = obj_CustomJumpKeyAction.image_index;
			var _xScale = 1;
			var _minusX = 0;
	
			if i == 1 {
				_text = scr_LocalText("opt_No");
				_align = fa_right;
				_index = obj_CustomAct1KeySpeed.image_index;
				_xScale = -1;
				_minusX = -65;
			}
	
			var _textWidth = string_width(_text);
	
			draw_set_halign(_align);
				draw_text_transformed(_x + (568 * i), _y, _text, 1, 1, 0);
				draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, _index, _x + ((_textWidth + 5) * _xScale) + ((568 + _minusX) * i), _y + 12, 1, 1, 0, c_white, 1);
		}
	}	
draw_set_halign(fa_left);