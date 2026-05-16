display_set_gui_size(768, 432);

var _sprCol = c_white;

if !global.MIND && global.PlayerChar != 0 {
	_sprCol = sprColor;
}

draw_sprite_ext(sprite_index, image_index, moveX, moveY, image_xscale, image_yscale, 0, _sprCol, image_alpha);