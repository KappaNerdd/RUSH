x = -100000;

if file_exists("ARLANGCHECK.sav") {
	room_goto(rm_FileSelectNew);
}

langArray = [
	[spr_OptionEnglishHead, spr_OptionEnglish],
	[spr_OptionSpanishHead, spr_OptionSpanish],
]

langCheck = 0;

normAlph = 1;
headAlph = 0;

chooseTimer = 0;
chooseFrames = 8;

chosen = false;

flashAlpha = 0;

leftArrow = false;
leftFrames = 0;

rightArrow = false;
rightFrames = 0;

scaleChange = 1;

fadeTimer = 120;