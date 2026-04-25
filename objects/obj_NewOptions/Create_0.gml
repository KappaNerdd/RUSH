if !global.MIND && global.PlayerChar != 0 {
	sprite_index = global.PlayerSelection[global.PlayerChar][6][0]
} else {
	sprite_index = spr_PauseMenuBGBasic;
}

startX = 768;
endX = -32;

setX = -32;
setY = 456;

optX = 0;

done = false;

opt = 0;
choice = 0;

animatedArrow = false;
arrowAnim2 = 1 / 4;
arrowFrames2 = 0;
arrowFrames3 = 0;
arrowRight = false;
arrowLeft = false;
arrowUp = false;
arrowDown = false;

leftSpikesX = 0;
rightSpikesX = 0;
spikesAnim = 1;
spikesFrames = 0;

scr_GetCharShitCreate();
iconAnim = 1 / 8;
iconFrames = 0;
iconX = 0;
iconY = 0;

scr_GlobalControls();
conChange = false;
waiting = false;
waitFrames = 5;
waitTimer = 0;

arrowAnim = 1 / 12;
arrowFrames = 0;
changeBindY = 500;

x = -10000000;
depth = -4;

if instance_exists(obj_TitleCursor) {
	instance_destroy(obj_TitleCursor);
}

allOpts = [
	["opt_Audio"],
	["opt_Visual"],
	["opt_Misc"],
	["opt_Pref"],
	["opt_Display"],
	["opt_Online"],
	["opt_ConGen"],
	["opt_ConSpeed1"],
	["opt_ConSpeed2"],
	["opt_ConAction1"],
	["opt_ConAction2"],
]

audio = [
	["opt_Master", "desc_Master"],
	["opt_Music", "desc_Music"],
	["opt_SFX", "desc_SFX"],
	["opt_Text", "desc_Text"],
	["opt_Ambiance", "desc_Ambiance"],
	["opt_Pause", "desc_Pause"],
	["opt_Footstep", "desc_Footstep"],
	["opt_Invincible", "desc_Invincible"]
]

visual = [
	["opt_ExtCam", "desc_ExtCam"],
	["opt_ScrShk", "desc_ScrShk"],
	["opt_SimpVFX", "desc_SimpVFX"],
	["opt_Part", "desc_Part"],
	["opt_Outline", "desc_Outline"],
	["opt_Squash", "desc_Squash"],
	["opt_ConDis", "desc_ConDis"],
]

misc = [
	["opt_Lang", "desc_Lang"],
	["opt_TextSpd", "desc_TextSpd"],
	["opt_MusTag", "desc_MusTag"],
	["opt_ConType", "desc_ConType"],
	["opt_ConRum", "desc_ConRum"],
	["opt_Speedrun", "desc_Speedrun"],
	["opt_FPS", "desc_FPS"],
]

display = [
	["opt_Fullscr", "desc_Fullscr"],
	["opt_WindowSize", "desc_WindowSize"],
	["opt_VSync", "desc_VSync"],
]

pref = [
	["opt_ColorCode", "desc_ColorCode"],
	["opt_ChangeColor", "desc_ChangeColor"],
	["opt_FocusLoss", "desc_FocusLoss"],
]

online = [
	["opt_Ghost", "desc_Ghost"],
]

conGeneral = [
	["opt_ConStart", "desc_Control"],
	["opt_ConSelect", "desc_Control"],
	["opt_JoyDead", "desc_JoyDead"],
	["opt_TrigDead", "desc_TrigDead"],
]

conSpeed1 = [
	["opt_ConLeft"],
	["opt_ConRight"],
	["opt_ConUp"],
	["opt_ConDown"],
	["opt_ConJump"],
	["opt_ConAct1"],
]

conSpeed2 = [
	["opt_Boost"],
	["opt_Spec1"],
	["opt_Swap"],
	["opt_Spec2"],
]

conAct1 = [
	["opt_ActLeft"],
	["opt_ActRight"],
	["opt_ActUp"],
	["opt_ActDown"],
	["opt_ActLight"],
	["opt_ActMedium"],
]

conAct2 = [
	["opt_ActHeavy"],
	["opt_ActDash"],
	["opt_ActSuper"],
	["opt_ActParry"],
	["opt_ActCharge"],
]

desc = "";
