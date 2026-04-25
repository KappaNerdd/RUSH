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

draw_sprite_ext(spr_Static, image_index / 5, _camX2, _camY2, 2, 1.75, 0, c_black, 1);

if !global.SimplifyVFX {
	draw_sprite_ext(spr_Static, image_index / 5, _camX2, _camY2, 2, 1.75, 0, merge_color(mergedCol, #111111, 0.5), 0.25);
} else {
	draw_sprite_ext(spr_Static, 0, _camX2, _camY2, 2, 1.75, 0, merge_color(mergedCol, #111111, 0.5), 0.25);
}

if !global.SimplifyVFX {
	draw_sprite_ext(spr_RainSplash, image_index, _camX2, _camY2, global.CamWidth / 2, global.CamHeight / 2, 0, merge_color(mergedCol, c_white, 0), global.ThunderOpacity / 3);
}

draw_sprite_tiled_ext(spr_HeadBlockBG, 2, _camX * _p2, _camY * _p2, -0.25, 0.25, merge_color(mergedCol, #555555, 0.5), 0.75);
draw_sprite_tiled_ext(spr_HeadBlockBG, 1, _camX * _p4, _camY * _p4 + 50, 0.5, 0.5, merge_color(mergedCol, #888888, 0.5), 1);

