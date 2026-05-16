scr_GetCharBoostIcon();
scr_GetCharRushBoostIcon();

textX = 678;
textY = 80;
addedY = 0;

if instance_exists(obj_Player) {
	if obj_Player.getScore {
		giveScore = true;
	} else {
		giveScore = false;
	}
}
	

numberScale = 1;

personalTrick = 0;

completed = false;
completeSpinTimer = 30;
completeTimer = 15;

died = false;
dyingTimer = 1;
diedTimer = 60;

changeAngle = 0;

//Icons
icon1Angle = 150;
startI1X = 0;
startI1Y = textY;
icon1Boost = false;

icon2Angle = 210;
startI2X = 0;
startI2Y = textY;
icon2Boost = false;

icon3Angle = 270;
startI3X = 0;
startI3Y = textY;
icon3Boost = false;

icon4Angle = 330;
startI4X = 0;
startI4Y = textY;
icon4Boost = false;

icon5Angle = 390;
startI5X = 0;
startI5Y = textY;
icon5Boost = false;

icon6Angle = 450;
startI6X = 0;
startI6Y = textY;
icon6Boost = false;

iconAnim = 1 / 12;
iconFrames = 0;
