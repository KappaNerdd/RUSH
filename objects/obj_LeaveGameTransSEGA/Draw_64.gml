display_set_gui_size(640, 360);

var _camX = 0;
var _camY = 0;

draw_set_alpha(1) {
	if color == c_black {
		gpu_set_blendmode(bm_subtract);
	} else {
		gpu_set_blendmode(bm_add);
	}
	
	var _col = make_color_rgb(colorRed, colorGreen, colorBlue);
	
	draw_sprite_ext(sprite_index, 0, _camX, _camY, 321, 181, 0, _col, image_alpha);
	gpu_set_blendmode(bm_normal);
}