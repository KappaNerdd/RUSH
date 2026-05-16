image_alpha -= changeAlpha;
image_angle += changeAlpha * 5;

if image_alpha <= 0 {
	instance_destroy();
}