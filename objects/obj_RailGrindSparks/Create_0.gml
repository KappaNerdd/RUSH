depth = obj_Player.depth + 1;

changeAlpha = random_range(0.005, 0.1);

if global.MIND {
	cols = [c_white, c_ltgray, c_grey, c_dkgray, c_black];
} else {
	cols = [c_red, c_orange, c_yellow];
}

vspeed = random_range(-1, -4);
image_blend = cols[random(array_length(cols))];
image_angle = random(360);

changeScale = random_range(2, 4);
image_xscale = changeScale;
image_yscale = changeScale;