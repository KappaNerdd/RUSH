if instance_number(object_index) > 1 {
    instance_destroy();
}

x = -100000;

//Keys Enum
enum eKey {
    LeftPressed,
    RightPressed,
    UpPressed,
    DownPressed,
	
	LeftReleased,
    RightReleased,
    UpReleased,
    DownReleased,
	
	
    JumpPressed,
	JumpHeld,
	JumpReleased,
	
	ActionPressed,
	ActionHeld,
	ActionReleased,
	
	BoostPressed,
	BoostHeld,
	BoostReleased,
	
	SwapPressed,
	
	Special1Pressed,
	Special1Held,
	Special1Released,
	
	Special2Pressed,

    NUM_KEYS
}

//Variables
fileName = string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav";

//Check if currently recording or playing
if !global.Replay {
	isRecording = false;
	isPlaying = false;
} else {
	scr_ReadInputRecording(fileName);
	
	isRecording = false;
	isPlaying = false;
}

confirmPlay = false;

//Variables to keep track of the frames
frame = 0;
index = 0;

//Arrays to store the keys to record, and the recorded values and frames
input = array_create(eKey.NUM_KEYS, false);
inputSequence = [0, 0];

holdSpec1 = false;
reSpec1 = false;

if global.MIND or global.PlayerChar == 0 {
	sprite_index = spr_ReplayHead;
}

visibleTimer = 30;
