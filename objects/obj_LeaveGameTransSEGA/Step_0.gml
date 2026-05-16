if !transComplete {
	if colorRed < 255 {
	    colorRed += 20 / division;
	}

	if colorGreen < 255 && colorRed > 255 / 2.5 {
	    colorGreen += 20 / division;
	}

	if colorBlue < 255 && colorGreen > 255 / 2.5 {
		colorBlue += 20 / division;
	}

	//End the transition:
	if colorBlue == 255 {
	    if image_alpha < 1 {
	       image_alpha += 0.20 / division;
	    } else {
		    transComplete = true;
			game_end();
		}
	}
} else {
	if colorRed > 0 && colorGreen <= 0 {
	    colorRed -= 20 / division;
	}

	if colorGreen > 0 && colorBlue <= 0 {
	    colorGreen -= 20 / division;
	}

	if colorBlue > 0 {
		colorBlue -= 20 / division;
	}
	
	if colorRed == 0 {
		if image_alpha > 0 {
			image_alpha -= 0.20 / division;
		}
	}
	
	if image_alpha <= 0 {
		if instance_exists(obj_Player) {
			obj_Player.can_Move = true;
		}
		
		instance_destroy();
	}
}