image_alpha = 0;
x = -1000000;

global.Freeplay = true;
global.MIND = false;
global.Health = global.MaxHealth;
global.CustomMus = false
global.CustomMusic = noone;

if global.PlayerChar == 0 {
	global.PlayerChar = 1;
	global.SelectedPlayer = 1;
}

stages = [
	["freeplay_Speed", true, spr_SpeedStageIcon],
	["freeplay_Action", false, spr_ActionStageIcon],
]

ranks = [
	spr_RankFNew,
	spr_RankDNew,
	spr_RankCNew,
	spr_RankBNew,
	spr_RankANew,
	spr_RankSNew,
	spr_RankPNew,
	
	spr_RankFHead,
	spr_RankDHead,
	spr_RankCHead,
	spr_RankBHead,
	spr_RankAHead,
	spr_RankSHead,
	spr_RankPHead,
]

choice = 0;
choiceX = 0;
cursorY = 0;

chosenSpeed = global.SpeedSelected;
choiceSpeedX = 0;
choiceSpeedY = 500;

choiceTimer = 0;
choiceFrames = 12;

chosenAction = 0;
choiceActionX = 0;
choiceActionY = 500;

chosen = false;
chosenYScale = 0;
chosenTextAlpha = 0;

textboxAnim = 1 / 2;
textboxFrames = 0;

yes = false;
yesTimer = 80;

confirm = false;
confirmTimer = 10;
levelChosen = false;
levelAlphas = 0.5;

info = false;
changeChar = false;
changeCharTimer = 60;
changeCharAlpha = 0.25;
changeAlpha = true;

jukebox = false;
jukeChoice = false;

speedStage = false;
actionStage = false;

horiFloatAmplitude = 0.05;
horiFloatSpeed = 0.01;
horiFloatingOffset = 0;

floatAmplitude = 0.1;
floatSpeed = 0.01;
floatingOffset = 0;

rotationAmplitude = 0.1;
rotationSpeed = 0.025;
rotationOffset = 0;

charX = 0;
charX2 = -300;
charY = 0;
charY2 = 200;
changingY = 0;
charAngle = 0;

charNameX = 0;
charBoxY = -300;

scr_GetCharFreeplayPortLocal();

charBoxFrames = 0;

srSpikesAnim = 1;
srSpikesFrames = 0;

bottomY = 100;
srSpikesX = 100;

srBoxAnim = 1 / 2;
srBoxFrames = 0;

lock = false;
lockAnim = 1 / 3;
lockFrames = 0;

mindAnim = 1 / 12;
mindFrames = 0;

if global.MIND or global.PlayerChar == 0 {
	rankAnim = 1 / 12;
} else {
	rankAnim = 1 / 4;
}

rankFrames = 0;

custMusFile = "";

jukeCheck = false;