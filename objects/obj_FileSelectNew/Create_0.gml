scr_RoomCheckerCreate();
scr_MusicTag();

fileChoice = 0;
copyFile = 0
eraseFile = 0;
fileMove = 0;

subChoice = 0;
confirmTextOpacity = 0;

fileChosen = false;
fileChosenTimer = 60;
confirm = false;

copy = false;
copying = false;
copiedFile = noone;
overwrite = false;
copyShitAlpha = 0;
copyShitTimer = 0;

erase = false;
erasing = false;

chooseTimer = 0;
chooseFrames = 12;

ballXScale = 1;
ballAngle = 1200;
charAngle = 360;
charOpacity = 0;

boxExtraScale = 0;

boxAnim = 0;
boxFrames = 1 / 12;

arrowed = false;
arrowDown = false;
arrowUp = false;
arrowAnim = 0;

red = 255;
green = 255;
blue = 255;

newRed = 0;
newGreen = 0;
newBlue = 0;

fullCol = 0;

var _dir = working_directory + "/saves/";

if file_exists(_dir + string(global.PastMindDataFile) + ".sav") {
	srSpikes = spr_SonicRushSpikesNorm;
	srBlock = spr_CharSelectTop;
	srBall = spr_CharSelectRushBall2;
	set_song_ingame(mus_CestLaVie);
} else {
	srSpikes = spr_SonicRush_Spikes_Head;
	srBlock = spr_CharSelectTopHead;
	srBall = spr_CharSelectRushBossBallHead;
	sprite_index = spr_SonicRushBGHead;
	set_song_ingame(mus_MindnBody);
}

srSpikeFrames = 0;

global.FileInfos = [
	{ //File 1
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 2
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 3
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 4
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 5
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 6
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
	
	{ //File 7
		player_Char : -1,
		player_Costume : 0,
	
		partner_Char : -1,
		partner_Costume : 0,
	
		partner2_Char : -1,
		partner2_Costume : 0,
	
		player_Name : "fs_Empty",
		player_Seconds : 0,
		player_Minutes : 0,
		player_Hours : 0,
	
		save_rm : "fs_Empty",
	},
]