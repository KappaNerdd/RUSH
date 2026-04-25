display_set_gui_size(640, 360);

global.ThunderCountdown++;

if removeFade {
	image_alpha -= 0.005;
	
	if image_alpha <= 0 {
		with(instance_create_depth(x, y, depth, obj_FadeIntroText)) {
			textArray = [
				"new_Intro2-1",
				"new_Intro2-2",
				"new_Intro2-3",
				"new_Intro2-4",
				"new_Intro2-5",
				"new_Intro2-6",
				"new_Intro2-7",
				"new_Intro2-8",
				"new_Intro2-9",
				"new_Intro2-10",
				"new_Intro2-11",
				"new_Intro2-12",
				"new_Intro2-13",
				"new_Intro2-14",
				"new_Intro2-15",
			];
			
			createChars = true;
		}
		
		instance_destroy();
	}
}

draw_sprite_ext(spr_WhiteTrans, 0, 0, 0, 20, 12, 0, c_black, image_alpha);