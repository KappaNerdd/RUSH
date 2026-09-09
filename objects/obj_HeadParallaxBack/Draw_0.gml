var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]) + changeY;

var _camX2 = camera_get_view_x(view_camera[0]);
var _camY2 = camera_get_view_y(view_camera[0]);

var _camWidth = camera_get_view_width(view_camera[0]) / 2;
var _camHeight = camera_get_view_height(view_camera[0]) / 2;

var _p1 = 0.9;
var _p2 = 0.8;
var _p3 = 0.6;
var _p4 = 0.4;

var _mergeCol = 0.75;

if room == rm_HeadSpeedBoss or room == rm_HeadSpeedBossP2 {
	_mergeCol = 0.5;
}

draw_sprite_ext(spr_RainSplash, image_index, _camX2, _camY2, global.CamWidth / 2, global.CamHeight / 2, 0, c_black, 1);
draw_sprite_tiled_ext(spr_HeadMainBG, image_index / 5, _camX2 + moveBGX, _camY2 + moveBGY, 1, 1, merge_color(mergedCol, c_white, _mergeCol), 0.225);

if !global.SimplifyVFX {
	draw_sprite_ext(spr_RainSplash, image_index, _camX2, _camY2, global.CamWidth / 2, global.CamHeight / 2, 0, merge_color(mergedCol, c_white, _mergeCol), global.ThunderOpacity / 2);
}

if !global.SimpleBackground {
	draw_sprite_tiled_ext(spr_HeadParallax1, 2, _camX * _p2 - moveBGX, _camY * _p2 - moveBGY, 0.5, 0.5, merge_color(mergedCol, #666666, _mergeCol), 1);
	draw_sprite_tiled_ext(spr_HeadParallax1, 0, _camX * _p3, _camY * _p3, 0.75, 0.75, merge_color(mergedCol, #999999, _mergeCol), 1);
	
	draw_sprite_ext(spr_RainSplash, image_index, _camX2, _camY2, global.CamWidth / 2, global.CamHeight / 2, 0, merge_color(mergedCol, c_dkgrey, _mergeCol), 0.25);
	
	if room != rm_HeadSpeedBossP2 && room != rm_NameMakerNew {
		draw_sprite_ext(spr_HeadParallax3, 0, _camX2 * _p4, _camY2 * _p4, room_width / 300, 1, 0, merge_color(mergedCol, c_white, _mergeCol), 1);
	}
}