grav = 0.25;
sprColor = c_white;
image_alpha = 1;

image_xscale = 1;
image_yscale = 1;

randomize();

xspd = random_range(-10, 10);
yspd = random_range(0.1, 9);
yspd2 = random_range(-5, -13);


horiFloatAmplitude = 0.05;
horiFloatSpeed = 0.1;
horiFloatingOffset = 0;

moveX = random_range(0, 640);
moveY = 440;

kysTimer = 120;

image_speed = random_range(-2, 2);
image_index = random_range(0, 5);


randomize();

var _colRandom = ceil(random(7));

if _colRandom == 1 {
	sprColor = global.colRed;
} else if _colRandom == 2 {
	sprColor = global.colOrange;
} else if _colRandom == 3 {
	sprColor = global.colYellow;
} else if _colRandom == 4 {
	sprColor = global.colGreen;
} else if _colRandom == 5 {
	sprColor = global.colBlue;
} else if _colRandom == 6 {
	sprColor = global.colPurple;
} else if _colRandom == 7 {
	sprColor = global.colPink;
}