display_set_gui_size(global.CamWidth, global.CamHeight);

if instance_exists(obj_SonicRushIntroCard) {
	if obj_SonicRushIntroCard.kysTimer < 180 {
		charX = lerp(charX, 0, 0.025);
	}
} else {
	instance_destroy();
}

var _mainCol2 = c_black;

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

gpu_set_fog(true, _mainCol2, 0, 1);
	if instance_exists(obj_SonicRushIntroCard) {
		draw_sprite_ext(obj_Player.sprite_index, obj_Player.image_index, charX + _relX, _relY, obj_Player.visXScale * obj_SonicRushIntroCard.charScale, obj_Player.image_yscale * obj_SonicRushIntroCard.charScale, obj_Player.drawAngle, c_black, obj_SonicRushIntroCard.mainAlpha);
	}
gpu_set_fog(false, c_black, 0, 1);