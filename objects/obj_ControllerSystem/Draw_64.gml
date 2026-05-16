display_set_gui_size(768, 432);
getCharacterControls();

var _scale = 0.5;
var _y = 420;
var _conX = 700;
var _conY = 370;
var _size = 1.25;

//Player 1
if !global.KeyboardP1 {
	if gamepad_is_connected(global.Player1Con) {
		draw_text_transformed_color(0, _y, "PLAYER 1: " + string(gamepad_get_description(global.Player1Con)) + " CONNECTED", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP1);
		
		if global.ConDisplay {
			draw_sprite_ext(spr_InputController, 0, _conX, _conY, _size, _size, 0, c_white, 0.5);
			
			for(var i = 0; i < array_length(conInputs); i++) {
				var _frame = 0;
				var _col = c_white;
				
				if gamepad_button_check(global.Player1Con, conInputs[i][0]) {
					_frame = 1;
					_col = global.fullRGB;
				}
				
				draw_sprite_ext(conInputs[i][1], _frame, _conX, _conY, _size, _size, 0, _col, 1);
			}
			
			var _deadLH = gamepad_axis_value(global.Player1Con, gp_axislh);
			var _deadLV = gamepad_axis_value(global.Player1Con, gp_axislv);
			var _deadRH = gamepad_axis_value(global.Player1Con, gp_axisrh);
			var _deadRV = gamepad_axis_value(global.Player1Con, gp_axisrv);
			var _extraX = 2 * _deadLH;
			var _extraY = 2 * _deadLV;
			var _extraX2 = 2 * _deadRH;
			var _extraY2 = 2 * _deadRV;
			
			draw_sprite_ext(spr_InputLStick, 0, _conX + _extraX - 2, _conY + _extraY, _size, _size, 0, c_white, 1);
			draw_sprite_ext(spr_InputRStick, 0, _conX + _extraX2, _conY + _extraY2, _size, _size, 0, c_white, 1);
		}
	} else {
		draw_text_transformed_color(0, _y, "PLAYER 1: CONTROLLER UNDETECTED", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP1);
		
		if global.ConDisplay {
			var _extraSize = 0.5;
			var _alpharad = 0.5;
			
			#region //Directional
				draw_sprite_ext(spr_InputDirVerti, up_Key, 650, 380, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputDirVerti, down_Key, 650, 400, _size * _extraSize, _size * _extraSize, 180, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputDirHori, right_Key, 660, 390, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputDirHori, left_Key, 640, 390, _size * _extraSize * -1, _size * _extraSize, 0, global.fullRGB, _alpharad);
			#endregion
			
			#region //Face
				draw_sprite_ext(spr_InputButton, jump_Key_Held, 710, 370, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 0, 710, 370 + (2 * jump_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
				draw_sprite_ext(spr_InputButton, action3_Key_Held, 710, 410, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 3, 710, 410 + (2 * action3_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
				draw_sprite_ext(spr_InputButton, action_Key_Held, 690, 390, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 1, 690, 390 + (2 * action_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
				draw_sprite_ext(spr_InputButton, action1_Key_Held, 730, 390, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 2, 730, 390 + (2 * action1_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
			#endregion
			
			#region //Shoulders & Pause
				draw_sprite_ext(spr_InputButton, action2_Key_Held, 640, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 4, 640, 350 + (2 * action2_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
				draw_sprite_ext(spr_InputButton, action4_Key_Held, 730, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 5, 730, 350 + (2 * action4_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
				draw_sprite_ext(spr_InputButton, pause_Key_Held, 670, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 8, 670, 350 + (2 * pause_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
				draw_sprite_ext(spr_InputButton, select_Key_Held, 700, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
				draw_sprite_ext(spr_InputText, 9, 700, 350 + (2 * select_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
			#endregion
		}
	}
} else {
	draw_text_transformed_color(0, _y, "PLAYER 1 CONTROLLER UNAVAILABLE", _scale, _scale, 0, c_red, c_red, c_red, c_red, textAlphaP1);
	
	if global.ConDisplay {
		var _extraSize = 0.5;
		var _alpharad = 0.5;
			
		#region //Directional
			draw_sprite_ext(spr_InputDirVerti, up_Key, 650, 380, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputDirVerti, down_Key, 650, 400, _size * _extraSize, _size * _extraSize, 180, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputDirHori, right_Key, 660, 390, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputDirHori, left_Key, 640, 390, _size * _extraSize * -1, _size * _extraSize, 0, global.fullRGB, _alpharad);
		#endregion
			
		#region //Face
			draw_sprite_ext(spr_InputButton, jump_Key_Held, 710, 370, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 0, 710, 370 + (2 * jump_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
			draw_sprite_ext(spr_InputButton, action3_Key_Held, 710, 410, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 3, 710, 410 + (2 * action3_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
			draw_sprite_ext(spr_InputButton, action_Key_Held, 690, 390, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 1, 690, 390 + (2 * action_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
			draw_sprite_ext(spr_InputButton, action1_Key_Held, 730, 390, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 2, 730, 390 + (2 * action1_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
		#endregion
			
		#region //Shoulders & Pause
			draw_sprite_ext(spr_InputButton, action2_Key_Held, 640, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 4, 640, 350 + (2 * action2_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
			draw_sprite_ext(spr_InputButton, action4_Key_Held, 730, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 5, 730, 350 + (2 * action4_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
			draw_sprite_ext(spr_InputButton, pause_Key_Held, 670, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 8, 670, 350 + (2 * pause_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
				
			draw_sprite_ext(spr_InputButton, select_Key_Held, 700, 350, _size * _extraSize, _size * _extraSize, 0, global.fullRGB, _alpharad);
			draw_sprite_ext(spr_InputText, 9, 700, 350 + (2 * select_Key_Held), _size * _extraSize, _size * _extraSize, 0, c_white, _alpharad);
		#endregion
	}
}


/*//Player 2
if gamepad_is_connected(global.Player2Con) {
	draw_text_transformed_color(0, 340, "Player 2: " + string(gamepad_get_description(global.Player2Con)) + " Connected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP2);
} else {
	draw_text_transformed_color(0, 340, "Player 2: Controller Disconnected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP2);
}


//Player 3
if gamepad_is_connected(global.Player3Con) {
	draw_text_transformed_color(0, 350, "Player 3: " + string(gamepad_get_description(global.Player3Con)) + " Connected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP3);
} else {
	draw_text_transformed_color(0, 350, "Player 3: Controller Disconnected", _scale, _scale, 0, c_white, c_white, c_white, c_white, textAlphaP3);
}*/


//Speedrun Timer
if global.SpeedCount {
	global.SpeedSec += 1 / 60;
	
	if global.SpeedSec >= 60 {
		global.SpeedSec = 0;
		global.SpeedMin++;
	}
	
	if global.SpeedMin >= 60 {
		global.SpeedMin = 0;
		global.SpeedHour++;
	}
}

if global.Speedrun {
	draw_set_halign(fa_right);
		var _extraSec = ":0";
		var _extraMin = ":0";
		
		if global.SpeedSec >= 10 {
			_extraSec = ":";
		}
		
		if global.SpeedMin >= 10 {
			_extraMin = ":";
		}
	
		draw_text_transformed_color(768, 420, string(global.SpeedHour) + _extraMin + string(global.SpeedMin) + _extraSec + string(global.SpeedSec), 0.65, 0.65, 0, c_white, c_white, c_white, c_white, 1);
	draw_set_halign(fa_left)
}