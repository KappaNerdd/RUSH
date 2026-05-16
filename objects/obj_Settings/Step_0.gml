if instance_exists(obj_Textbox) && !global.SimplifyVFX {	
	global.ColTime++;
}

//GIF Recording
/*if keyboard_check_pressed(vk_f2) {
	if !recordGIF {
		recordGIF = true;
		gifID = gif_open(global.WinX, global.WinY);
	} else {
		recordGIF = false;
		gif_save(gifID, string(room) + ".gif");
	}
}