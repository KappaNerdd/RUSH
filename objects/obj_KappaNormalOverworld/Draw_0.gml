var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 400;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

var _xscale = visXScale;
var _humming = spr_KappaHummingVFX;

if global.MIND {
	_humming = spr_HeadHummingVFX;
}

if leftTrick or rightTrick or backTrick {
	draw_sprite_ext(_humming, image_index, x, y - 16, _xscale, 1, angle, c_white, 1);
}

if railGrind {
	var _rail = spr_RailGrindCentSparksVFX;
	
	if global.MIND {
		_rail = spr_RailGrindCentHeadVFX;
	}
	
	draw_sprite_ext(_rail, railGrindSprFrames, x + angleSin * 13, y + angleCos * 13, 1.25 * _xscale, 0.25, drawAngle, c_white, 1);
}

if global.DEBUG {
	draw_text(_camX + _camXAdd, _camY + 20, "ground: " + string(ground));
	draw_text(_camX + _camXAdd, _camY + 40, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 60, "groundSpeed: " + string(groundSpeed));
	draw_text(_camX + _camXAdd, _camY + 80, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 100, "groundAngle: " + string(angle));
	draw_text(_camX + _camXAdd, _camY + 120, "edgeColl: " + string(edgeCollision));
	draw_text(_camX + _camXAdd, _camY + 140, "bottomColl: " + string(bottomCollision));
	draw_text(_camX + _camXAdd, _camY + 160, "collisionTest: " + string(collisionTest));
}