window_set_fullscreen(global.FullScreen);

if keyboard_check_pressed(vk_f4) {
	global.FullScreen = !global.FullScreen;
}
