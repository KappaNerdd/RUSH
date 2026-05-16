kysTimer -= 1;

if kysTimer <= 75 {
	moveY += yspd;
	yspd2 = moveY + 3;
} else {
	yspd2 += grav;
	moveY += yspd2;
}

moveX += ((horiFloatAmplitude) * sin(horiFloatingOffset)) + xspd;
horiFloatingOffset += horiFloatSpeed;

if kysTimer <= 0 {
	image_alpha -= 0.05;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}