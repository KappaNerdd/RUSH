var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 450;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

if leftTrick or rightTrick or backTrick {
	var _xscale = visXScale;
	
	draw_sprite_ext(spr_HeadHummingVFX, image_index, x, y - 16, _xscale, 1, 0, c_white, 1);
}

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX + _camXAdd, _camY + 20, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 40, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 60, "x: " + string(x));
	draw_text(_camX + _camXAdd, _camY + 80, "y: " + string(y));
	draw_text(_camX + _camXAdd, _camY + 100, "ground: " + string(ground));
	draw_text(_camX + _camXAdd, _camY + 120, "isSlope: " + string(isSlope));
	draw_text(_camX + _camXAdd, _camY + 140, "myFloorPlat " + string(myFloorPlat));
	draw_text(_camX + _camXAdd, _camY + 160, "can_MoveFULL: " + string(can_MoveFULL));
	draw_text(_camX + _camXAdd, _camY + 180, "collideTimer: " + string(collideTimer));


	draw_sprite_ext(mask_index, 0, x, y, 1, 1, image_angle, c_red, 0.5);
	
	draw_sprite_ext(mask_index, 0, x, y + 4, 1, 1, image_angle, c_green, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y - abs(vel) - 30, 1, 1, image_angle, c_blue, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y + 50, 1, 1, image_angle, c_yellow, 0.5);
	
}