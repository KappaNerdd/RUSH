depth = -2;

randomize();
set_song_ingame(mus_FunknRushNew);

beats = 140;
conBPM = 1000000 * (60 / beats);
realBPM = 0;

global.Freeplay = false;

nerd = round(random(1));

charShit = [
	[spr_MenuButtonSonic, spr_CharSelectKappaIcon, c_blue],
	[spr_MenuButtonBlaze, spr_CharSelectLuciferIcon, c_fuchsia],
]

menu = [
	["title_Gameplay", spr_GameplayRender],
	["fs_FileSelect", spr_GameplayRender],
	["title_Extras", spr_GameplayRender],
	["title_Options", spr_GameplayRender],
	["title_QuitGame", spr_GameplayRender],
]

menuX = 250;
menuY = -250;
menuAngle = -720;
iconScale = 0;

renderX = -800;

gameplay = [
	["title_StoryMode", spr_GameplayRender],
	["title_Freeplay", spr_GameplayRender],
]

story = [
	["title_NewGame", spr_GameplayRender],
	["title_Continue", spr_GameplayRender],
]

extra = [
	["title_Boombox", spr_GameplayRender],
	["title_Gallery", spr_GameplayRender],
	["title_Bios", spr_GameplayRender],
]

gameplayChosen = false;
moveGameplay = false;

storyChosen = false;
moveStory = false;

extraChosen = false;
moveExtra = false;

menuChoice = 0;
subMenuChoice = 0;
storyMenuChoice = 0;

menuMoveTimer = 1;
menuMoveFrames = 9;

menuChosen = false;
cancelMenu = false;
waitTimer = 60;
waitFrames = 60;
retTimer = 5;

confirm = false;

extraScale = 0;

backTextX = 384;
otherBackTextX = -384;

baseTextX = 384;
otherBaseTextX = -384;

menuRet = false;

srSpikesIndex = 0;

charX = 0;

changedAngle = 0;
anotherAngle = 5;

goFreeplay = false
goContinue = false;
goFileSelect = false;

goBio = false;
goGallery = false;

newGameWarning = false;
goNewGame = false;
newGameAlpha = 0;
newGameAlpha2 = 0;
newGameWait = 2;
newGameFrame = 2;