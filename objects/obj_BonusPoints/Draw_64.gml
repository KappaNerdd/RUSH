display_set_gui_size(768, 432);

var _arrow = spr_PauseArrow;

if global.MIND or global.PlayerChar == 0 {
	_arrow = spr_PauseArrowHead;
}

if !global.DisableHUD {
	draw_sprite_ext(_arrow, image_index, sprX - 80, sprY - 7, 1, 0.5, 0, c_black, image_alpha * altAlpha);
	draw_sprite_ext(sprite_index, image_index, sprX - 4, sprY - 37, 1, 1, 0, c_black, image_alpha * altAlpha);

	draw_sprite_ext(_arrow, image_index, sprX - 80, sprY - 10, 1, 0.5, 0, global.fullRGB, image_alpha * altAlpha);
	draw_sprite_ext(sprite_index, image_index, sprX - 4, sprY - 40, 1, 1, 0, c_white, image_alpha * altAlpha);
}

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _playX = 0;
var _playY = 0;

if instance_exists(obj_Player) {
	_playX = obj_Player.x;
	_playY = obj_Player.y;
}

var _relX = _playX - _camX;
var _relY = _playY - _camY;


if _relY >= 330 {
	altAlpha = lerp(altAlpha, 0.5, 0.5);
} else {
	altAlpha = lerp(altAlpha, 1, 0.25);
}

var _col = c_white;
var _add = 1;
if abs(fullScore) >= 10 && abs(fullScore) < 100 {
	_add = 10;
} else if abs(fullScore) >= 100 && abs(fullScore) < 1000 {
	_add = 50;
} else if abs(fullScore) >= 1000 && abs(fullScore) < 10000 {
	_add = 100;
} else if abs(fullScore) >= 10000 && abs(fullScore) < 100000 {
	_add = 1000;
} else if abs(fullScore) >= 100000 && abs(fullScore) < 1000000 {
	_add = 10000;
} else if abs(fullScore) >= 1000000 {
	_add = 50000;
}

if kysTimer <= 120 {
	if fullScore > 0 {
		fullScore -= _add;
		global.GameScore += _add;
		
		soundWait -= 1;
		
		if soundWait <= 0 {
			obj_SFXManager.menuTap = true;
			soundWait = 2;
		}
	} else if fullScore < 0 {
		fullScore += _add;
		global.GameScore -= _add;
		
		soundWait -= 1;
		
		if soundWait <= 0 {
			obj_SFXManager.menuTap = true;
			soundWait = 2;
		}
	} else {
		if !soundDone {
			soundDone = true;
			obj_SFXManager.funkinCheckpoint = true;
		}
		
		kysTimer -= 1;
	}
}

if kysTimer > 90 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	image_alpha -= 0.05;
	sprYScale += 0.05;
} else {
	sprYScale = lerp(sprYScale, 1, 0.2);
}

if image_alpha <= 0 {
	instance_destroy();
}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(global.LifeFont);
	var _plus = "+";
	
	if fullScore < 0 {
		_plus = "";
	}
	
	if !global.DisableHUD {
		draw_text_transformed_color(sprX, sprY, string(_plus) + string(fullScore), 1, sprYScale, 0, c_white, c_white, global.fullRGB, global.fullRGB, image_alpha * altAlpha);
	}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.font_main);

