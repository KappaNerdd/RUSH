var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camXAdd = 600;

scr_RushModeColorDraw();

if backTrick or hover {
	var _xscale = 1;
	
	draw_sprite_ext(spr_SarahTwirlVFX, image_index, x, y - 16, _xscale, 1, drawAngle, c_white, 1);
}

if railGrind {
	draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x + angleSin * 10, y + angleCos * 10, 0.5, 0.5, drawAngle, c_white, 1);
}

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX + _camXAdd, _camY + 20, "ground: " + string(ground));
	draw_text(_camX + _camXAdd, _camY + 40, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 60, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 80, "angle: " + string(angle));
	draw_text(_camX + _camXAdd, _camY + 100, "angleSin: " + string(angleSin));
	draw_text(_camX + _camXAdd, _camY + 120, "angleCos: " + string(angleCos));
	draw_text(_camX + _camXAdd, _camY + 140, "sensorSin: " + string(sensorSin));
	draw_text(_camX + _camXAdd, _camY + 160, "sensorX: " + string(sensorX));
	draw_text(_camX + _camXAdd, _camY + 180, "sensorY: " + string(sensorY));
	draw_text(_camX + _camXAdd, _camY + 200, "sensorCos: " + string(sensorCos));
	draw_text(_camX + _camXAdd, _camY + 220, "bottomColl: " + string(bottomCollision));
	draw_text(_camX + _camXAdd, _camY + 240, "edgeColl: " + string(edgeCollision));
	draw_text(_camX + _camXAdd, _camY + 260, "repFactor: " + string(pushingWall));

	draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_red, 0.5);
	
}