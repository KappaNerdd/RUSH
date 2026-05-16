x = -1000000;
depth = -2;
image_alpha = 0;

mindAnim = 1 / 12;
mindFrames = 0;

backSideX = -1000;

rushBallBGX = -300;

rushBallX = -200;
rushBallAngle = 1080;

charNameX = -768;
nameCharY = -40;

choice = 0;
confirm = false;
confirmChoice = 0;

confirmY = 500;

done = false;

endGame = false;
endGameTimer = 20;

scr_GetCharFreeplayPortLocal();

horiFloatAmplitude = 0.1;
horiFloatSpeed = 0.1;
horiFloatingOffset = 0;

floatAmplitude = 0.1;
floatSpeed = 0.01;
floatingOffset = 0;

rotationAmplitude = 0.01;
rotationSpeed = 0.025;
rotationOffset = 0;

charX = 0;
charY = 0;
charY2 = -1000;
charAngle = 0;

changeFrames = 15;

changeLeft = false;
changeLeftTimer = 5;

changeRight = false;
changeRightTimer = 5;

if !global.MIND && global.PlayerChar != 0 {
	scr_GetCharTextboxes();
	sideBar = spr_SideBarR;
	
	resume = spr_PauseResumeNew;
	restart = spr_PauseRestartNew;
	hub = spr_PauseHUBNew;
	fileSelect = spr_PauseFileNew;
	freeplayS = spr_PauseFreeplayNew;
	options = spr_PauseOptionsNew;
	mainMenu = spr_PauseMainNew;
	quitGame = spr_PauseQuitNew;
} else {
	sideBar = spr_SideBarHeadR;
	
	resume = spr_PauseResumeHead;
	restart = spr_PauseRestartHead;
	hub = spr_PauseHUBHead;
	fileSelect = spr_PauseFileSelectHead;
	freeplayS = spr_PauseFreeplayHead;
	options = spr_PauseOptionsHead;
	mainMenu = spr_PauseMainMenuHead;
	quitGame = spr_PauseQuitGameHead;
}

//Overworld
overworld = [
	["resume", resume],
	["fileSelect", fileSelect],
	["options", options],
	["mainMenu", mainMenu],
	["quitGame", quitGame],
]

overworldMind = [
	["resume", resume],
	["fileSelect", fileSelect],
	["options", options],
	["quitGame", quitGame],
]

//Speed
speedStg = [
	["resume", resume],
	["restart", restart],
	["fileSelect", fileSelect],
	["options", options],
	["mainMenu", mainMenu],
	["quitGame", quitGame],
]

speedMind = [
	["resume", resume],
	["restart", restart],
	["fileSelect", fileSelect],
	["options", options],
	["quitGame", quitGame],
]

//Action
actionStg = [
	["resume", resume],
	["restart", restart],
	["fileSelect", fileSelect],
	["options", options],
	["mainMenu", mainMenu],
	["quitGame", quitGame],
]

//Freeplay
freeplay = [
	["resume", resume],
	["restart", restart],
	["freeplay", freeplayS],
	["fileSelect", fileSelect],
	["options", options],
	["mainMenu", mainMenu],
	["quitGame", quitGame],
]

pause = noone;

if global.UniquePauseTheme {
	pause = global.PlayerSelection[global.PlayerChar][21];
}

scr_ControllerRumble(0, 0);

//Deactivate everything
instance_deactivate_all(true);

//Reactivate some other shit
instance_activate_object(obj_PROTOTYPEMessage);
instance_activate_object(obj_Debug);
instance_activate_object(obj_Settings);
instance_activate_object(obj_GlobalControls);
instance_activate_object(obj_MusicManager);
instance_activate_object(obj_SFXManager);
instance_activate_object(obj_AmbienceManager);
instance_activate_object(obj_ConRumbleSystem);
instance_activate_object(obj_SaveNLoad);
instance_activate_object(obj_FullScreen);
instance_activate_object(obj_RoomTransParent);
instance_activate_object(obj_ParaBGParent);
instance_activate_object(obj_Solid);
instance_activate_object(obj_StageTrackerSpeed);
instance_activate_object(obj_NekoPresenceDemo);
instance_activate_object(obj_ControllerSystem);

instance_activate_object(obj_CustomLeftKeySpeed);
instance_activate_object(obj_CustomRightKeySpeed);
instance_activate_object(obj_CustomUpKeySpeed);
instance_activate_object(obj_CustomDownKeySpeed);
instance_activate_object(obj_CustomJumpKeySpeed);
instance_activate_object(obj_CustomAct1KeySpeed);
instance_activate_object(obj_CustomAct2KeySpeed);
instance_activate_object(obj_CustomAct3KeySpeed);
instance_activate_object(obj_CustomAct4KeySpeed);
instance_activate_object(obj_CustomAct5KeySpeed);
instance_activate_object(obj_CustomPauseKeySpeed);
instance_activate_object(obj_CustomSelectKeySpeed);

instance_activate_object(obj_CustomLeftKeyAction);
instance_activate_object(obj_CustomRightKeyAction);
instance_activate_object(obj_CustomUpKeyAction);
instance_activate_object(obj_CustomDownKeyAction);
instance_activate_object(obj_CustomLightKeyAction);
instance_activate_object(obj_CustomMediumKeyAction);
instance_activate_object(obj_CustomHeavyKeyAction);
instance_activate_object(obj_CustomJumpKeyAction);
instance_activate_object(obj_CustomDashKeyAction);
instance_activate_object(obj_CustomSuperKeyAction);
instance_activate_object(obj_CustomParryKeyAction);
instance_activate_object(obj_CustomChargeKeyAction);

obj_SFXManager.menuConfirm = true;

