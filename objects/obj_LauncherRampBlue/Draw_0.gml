var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < global.CamSafeArea {
	scr_Outline();

	draw_self();
}
