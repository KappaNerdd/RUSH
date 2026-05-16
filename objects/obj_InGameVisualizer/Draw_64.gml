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

#region //Main Menu
	draw_sprite_ext(spr_SideBar, 0, menuX + 160 - (25 * extraScale), -160, 1, 1, -12.5, charShit[nerd][2], 1);
	draw_sprite_ext(spr_SideBar, 0, -menuX + 608 + (25 * extraScale), 446, -1, -1, -12.5, charShit[1 - nerd][2], 1);
	
	draw_sprite_ext(spr_TitleLogoNormal, 0, -menuX + 80, 60, 0.3 * _scale, 0.3 * _scale, 0, c_white, 1);
	draw_sprite_ext(spr_TitleNewEN, 0, -menuX + 80, 60, 1 * (_scale + extraScale / 8), 1 * (_scale + extraScale / 8), 0, c_white, 1);
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

