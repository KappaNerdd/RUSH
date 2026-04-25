var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 400;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

var _xscale = visXScale;

if leftTrick or rightTrick or backTrick {
	draw_sprite_ext(spr_KappaHummingVFX, image_index, x, y - 16, _xscale, 1, angle, c_white, 1);
}

if railGrind {
	/*var _changeX = 20;
	var _changeY = 0;
	
	if drawAngle == 22.5 {
		_changeY = 10;
	}
	
	if drawAngle == 337.5 or drawAngle == -22.5 {
		
	}*/
	
	draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x + angleSin * 10, y + angleCos * 10, 1, 0.25, drawAngle, c_white, 1);
	//draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x + _changeX, bbox_bottom - _changeY, 0.5, 0.5, 0, c_white, 1);
}

if global.DEBUG {
	draw_text(_camX + _camXAdd, _camY + 20, "ground: " + string(ground));
	draw_text(_camX + _camXAdd, _camY + 40, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 60, "groundSpeed: " + string(groundSpeed));
	draw_text(_camX + _camXAdd, _camY + 80, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 100, "groundAngle: " + string(groundAngle));
	draw_text(_camX + _camXAdd, _camY + 120, "edgeColl: " + string(edgeCollision));
	draw_text(_camX + _camXAdd, _camY + 140, "bottomColl: " + string(bottomCollision));
	draw_text(_camX + _camXAdd, _camY + 160, "collisionTest: " + string(collisionTest));
}