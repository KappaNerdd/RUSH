//Option Saving
function save_options() {
	//Set and save option related stuff
	global.optionsData[0].master = global.MASTER_VOL;
	global.optionsData[0].music = global.MUSIC_VOL;
	global.optionsData[0].sfx = global.SFX_VOL;
	global.optionsData[0].txt = global.TEXT_VOL;
	global.optionsData[0].ambience = global.AMBIENCE_VOL;
	global.optionsData[0].uniquePause = global.UniquePauseTheme;
	global.optionsData[0].footStep = global.Footstep;
	
	global.optionsData[1].extCam = global.ExtendCamera;
	global.optionsData[1].simpVFX = global.SimplifyVFX;
	global.optionsData[1].screenShake = global.ScreenShake;
	global.optionsData[1].part = global.Particles;
	global.optionsData[1].conDis = global.ConDisplay;
	global.optionsData[1].outline = global.Outline;
	global.optionsData[1].squash = global.Squash;
	
	global.optionsData[2].textSpd = global.TextSpd;
	global.optionsData[2].lang = global.Language;
	global.optionsData[2].conRum = global.ConRumble;
	global.optionsData[2].conType = global.ConType;
	global.optionsData[2].musTag = global.SongTag;
	global.optionsData[2].speedrun = global.Speedrun;
	global.optionsData[2].FPS = global.FPSOn;
	
	global.optionsData[3].fullscrn = global.FullScreen;
	global.optionsData[3].windowSize = global.WindowSize;
	global.optionsData[3].vsync = global.VSync;
	
	global.optionsData[4].colorCode = global.ColorCode;
	global.optionsData[4].changeColor = global.ChangeColor;
	global.optionsData[4].focusLoss = global.FocusLoss;
	
	global.optionsData[5].discord = global.DiscordRich;
	global.optionsData[5].ghost = global.ShowGhost;

	//Actual Saving
	var _dir = working_directory + "/options/";
	var _filename = _dir + string(global.OptionsDataFile) + ".sav";
	var _json = json_stringify(global.optionsData);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);

}
	
	
function load_options() {
	//Loading our save data
	var _dir = working_directory + "/options/";
	var _filename = _dir + string(global.OptionsDataFile) + ".sav";
		
	if !file_exists(_filename) {
		exit;
	}
		
	//Load the buffer, get the JSON, delete the buffer from memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
		
	//Unstringify and get the data array
	var _loadArray = json_parse(_json);
	
	for (var i = 0; i < array_length(_loadArray); i++) {
		if (i < array_length(global.optionsData)) {
		    var _saved = _loadArray[i];
		    var _current = global.optionsData[i];
		    var _keys = variable_struct_get_names(_saved);
				
		    for (var k = 0; k < array_length(_keys); k++) {
		        var _key = _keys[k];
				
		        variable_struct_set(_current, _key, variable_struct_get(_saved, _key));
		    }
		} else {
		    array_push(global.optionsData, _loadArray[i]);
		}
	}
		
	global.loadedArray = _loadArray;
		
	global.MASTER_VOL = global.optionsData[0].master;
	global.MUSIC_VOL = global.optionsData[0].music;
	global.SFX_VOL = global.optionsData[0].sfx;
	global.TEXT_VOL = global.optionsData[0].txt;
	global.AMBIENCE_VOL = global.optionsData[0].ambience;
	global.UniquePauseTheme = global.optionsData[0].uniquePause;
	global.Footstep = global.optionsData[0].footStep;
		
	global.ExtendCamera = global.optionsData[1].extCam;
	global.SimplifyVFX = global.optionsData[1].simpVFX;
	global.ScreenShake = global.optionsData[1].screenShake;
	global.Particles = global.optionsData[1].part;
	global.ConDisplay = global.optionsData[1].conDis;
	global.Outline = global.optionsData[1].outline;
	global.Squash = global.optionsData[1].squash;
		
	global.TextSpd = global.optionsData[2].textSpd;
	global.Language = global.optionsData[2].lang;
	global.ConRumble = global.optionsData[2].conRum;
	global.ConType = global.optionsData[2].conType;
	global.SongTag = global.optionsData[2].musTag;
	global.Speedrun = global.optionsData[2].speedrun;
	global.FPSOn = global.optionsData[2].FPS;
		
	global.FullScreen = global.optionsData[3].fullscrn;
	global.WindowSize = global.optionsData[3].windowSize;
	window_set_size(1280 * global.optionsData[3].windowSize, 720 * global.optionsData[3].windowSize);
	window_center();
	global.VSync = global.optionsData[3].vsync;
	display_reset(0, global.optionsData[3].vsync);
	
	global.ColorCode = global.optionsData[4].colorCode;
	global.ChangeColor = global.optionsData[4].changeColor;
	global.FocusLoss = global.optionsData[4].focusLoss;
		
	global.DiscordRich = global.optionsData[5].discord;
	global.ShowGhost = global.optionsData[5].ghost;
}



//Save Controls
function scr_SaveControls() {
	///-----Speed & Menu-----///
	
	//Save Keyboard
	global.optionsControls[0].left = global.LeftKeySpeed;
	global.optionsControls[0].right = global.RightKeySpeed;
	global.optionsControls[0].up = global.UpKeySpeed;
	global.optionsControls[0].down = global.DownKeySpeed;
	
	global.optionsControls[0].jump = global.JumpKeySpeed;
	global.optionsControls[0].act1 = global.ActionKeySpeed;
	global.optionsControls[0].act2 = global.Action1KeySpeed;
	global.optionsControls[0].act3 = global.Action2KeySpeed;
	global.optionsControls[0].act4 = global.Action3KeySpeed;
	global.optionsControls[0].act5 = global.Action4KeySpeed;
	global.optionsControls[0].start = global.PauseKeySpeed;
	global.optionsControls[0].select = global.SelectKeySpeed;
	
	//Save Controller
	global.optionsControls[1].sDead = global.ConDeadZone;
	global.optionsControls[1].tDead = global.TrigDeadZone;
	
	global.optionsControls[1].left = global.LeftPadSpeed;
	global.optionsControls[1].right = global.RightPadSpeed;
	global.optionsControls[1].up = global.UpPadSpeed;
	global.optionsControls[1].down = global.DownPadSpeed;
	
	global.optionsControls[1].jump = global.JumpButtonSpeed;
	global.optionsControls[1].act1 = global.ActionButtonSpeed;
	global.optionsControls[1].act2 = global.Action1ButtonSpeed;
	global.optionsControls[1].act3 = global.Action2ButtonSpeed;
	global.optionsControls[1].act4 = global.Action3ButtonSpeed;
	global.optionsControls[1].act5 = global.Action4ButtonSpeed;
	global.optionsControls[1].start = global.PauseButtonSpeed;
	global.optionsControls[1].select = global.SelectButtonSpeed;
	
	
	///-----Action-----///
	
	//Save Keyboard
	global.optionsControls[2].left = global.LeftKeyAction;
	global.optionsControls[2].right = global.RightKeyAction;
	global.optionsControls[2].up = global.UpKeyAction;
	global.optionsControls[2].down = global.DownKeyAction;
	
	global.optionsControls[2].light = global.LightKeyAction;
	global.optionsControls[2].medium = global.MediumKeyAction;
	global.optionsControls[2].heavy = global.HeavyKeyAction;
	global.optionsControls[2].jump = global.SpecialKeyAction;
	global.optionsControls[2].dash = global.DashKeyAction;
	global.optionsControls[2].superDash = global.SuperDashKeyAction;
	global.optionsControls[2].parry = global.ParryKeyAction;
	global.optionsControls[2].charge = global.ChargeKeyAction;
	
	
	//Save Controller
	global.optionsControls[3].left = global.LeftPadAction;
	global.optionsControls[3].right = global.RightPadAction;
	global.optionsControls[3].up = global.UpPadAction;
	global.optionsControls[3].down = global.DownPadAction;
	
	global.optionsControls[3].light = global.LightButtonAction;
	global.optionsControls[3].medium = global.MediumButtonAction;
	global.optionsControls[3].heavy = global.HeavyButtonAction;
	global.optionsControls[3].jump = global.SpecialButtonAction;
	global.optionsControls[3].dash = global.DashButtonAction;
	global.optionsControls[3].superDash = global.SuperDashButtonAction;
	global.optionsControls[3].parry = global.ParryButtonAction;
	global.optionsControls[3].charge = global.ChargeButtonAction;
	
	//Actual Saving
	var _dir = working_directory + "/options/";
	var _filename = _dir + string(global.ControlsDataFile) + ".sav";
	var _json = json_stringify(global.optionsControls);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);

}

//Load Controls
function scr_LoadControls() {
	//Loading our save data
	var _dir = working_directory + "/options/";
	var _filename = _dir + string(global.ControlsDataFile) + ".sav";
		
	if !file_exists(_filename) {
		exit;
	}
		
	//Load the buffer, get the JSON, delete the buffer from memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
		
	//Unstringify and get the data array
	var _loadArray = json_parse(_json);
	
	for (var i = 0; i < array_length(_loadArray); i++) {
		if (i < array_length(global.optionsControls)) {
		    var _saved = _loadArray[i];
		    var _current = global.optionsControls[i];
		    var _keys = variable_struct_get_names(_saved);
				
		    for (var k = 0; k < array_length(_keys); k++) {
		        var _key = _keys[k];
		        variable_struct_set(_current, _key, variable_struct_get(_saved, _key));
		    }
		} else {
		    array_push(global.optionsControls, _loadArray[i]);
		}
	}
		
		
		///-----Speed & Menu-----///
		
		//Load Keyboard
		global.LeftKeySpeed = global.optionsControls[0].left;
		global.RightKeySpeed = global.optionsControls[0].right;
		global.UpKeySpeed = global.optionsControls[0].up;
		global.DownKeySpeed = global.optionsControls[0].down;
	
		global.JumpKeySpeed = global.optionsControls[0].jump;
		global.ActionKeySpeed = global.optionsControls[0].act1;
		global.Action1KeySpeed = global.optionsControls[0].act2;
		global.Action2KeySpeed = global.optionsControls[0].act3;
		global.Action3KeySpeed = global.optionsControls[0].act4;
		global.Action4KeySpeed = global.optionsControls[0].act5;
		global.PauseKeySpeed = global.optionsControls[0].start;
		global.SelectKeySpeed = global.optionsControls[0].select;
		
		//Load Controller
		global.ConDeadZone = global.optionsControls[1].sDead;
		global.TrigDeadZone = global.optionsControls[1].tDead;
		
		global.LeftPadSpeed = global.optionsControls[1].left;
		global.RightPadSpeed = global.optionsControls[1].right;
		global.UpPadSpeed = global.optionsControls[1].up;
		global.DownPadSpeed = global.optionsControls[1].down;
	
		global.JumpButtonSpeed = global.optionsControls[1].jump;
		global.ActionButtonSpeed = global.optionsControls[1].act1;
		global.Action1ButtonSpeed = global.optionsControls[1].act2;
		global.Action2ButtonSpeed = global.optionsControls[1].act3;
		global.Action3ButtonSpeed = global.optionsControls[1].act4;
		global.Action4ButtonSpeed = global.optionsControls[1].act5;
		global.PauseButtonSpeed = global.optionsControls[1].start;
		global.SelectButtonSpeed = global.optionsControls[1].select;
		
		
		///-----Action-----///
		
		//Load Keyboard
		global.LeftKeyAction = global.optionsControls[2].left;
		global.RightKeyAction = global.optionsControls[2].right;
		global.UpKeyAction = global.optionsControls[2].up;
		global.DownKeyAction = global.optionsControls[2].down;
		
		global.LightKeyAction = global.optionsControls[2].light;
		global.MediumKeyAction = global.optionsControls[2].medium;
		global.HeavyKeyAction = global.optionsControls[2].heavy;
		global.SpecialKeyAction = global.optionsControls[2].jump;
		global.DashKeyAction = global.optionsControls[2].dash;
		global.SuperDashKeyAction = global.optionsControls[2].superDash;
		global.ParryKeyAction = global.optionsControls[2].parry;
		global.ChargeKeyAction = global.optionsControls[2].charge;
		
		//Load Controller
		global.LeftPadAction = global.optionsControls[3].left;
		global.RightPadAction = global.optionsControls[3].right;
		global.UpPadAction = global.optionsControls[3].up;
		global.DownPadAction = global.optionsControls[3].down;
		
		global.LightButtonAction = global.optionsControls[3].light;
		global.MediumButtonAction = global.optionsControls[3].medium;
		global.HeavyButtonAction = global.optionsControls[3].heavy;
		global.SpecialButtonAction = global.optionsControls[3].jump;
		global.DashButtonAction = global.optionsControls[3].dash;
		global.SuperDashButtonAction = global.optionsControls[3].superDash;
		global.ParryButtonAction = global.optionsControls[3].parry;
		global.ChargeButtonAction = global.optionsControls[3].charge;
}
	
	
	
//Save Custom Jukebox Playlist
function scr_SaveJuke() {
	var _saveArray = array_create(0);
	
	global.JukeOptions[0].loop = global.JukeboxLoop;
	global.JukeOptions[0].shuffle = global.JukeboxShuffle;
	
	//Save Arrays
	array_push(_saveArray, global.CustomJukeboxPlaylist);
	array_push(_saveArray, global.CustomJukeShuffled);
	array_push(_saveArray, global.JukeOptions);
	
	//Actual Saving
	var _dir = working_directory + "/saves/";
	var _filename = _dir + string(global.JukeboxDataFile) + ".sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function scr_LoadJuke() {
	//Loading our save data
	var _dir = working_directory + "/saves/"
	var _filename = _dir + string(global.JukeboxDataFile) + ".sav";
	
	if !file_exists(_filename) {
		exit;
	}
		
	//Load the buffer, get the JSON, delete the buffer from memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	
	buffer_delete(_buffer);
		
	//Unstringify and get the data array
	var _loadArray = json_parse(_json);
		
	//Set the data in our game to match our loaded data
	global.CustomJukeboxPlaylist = array_get(_loadArray, 0);
	global.CustomJukeShuffled = array_get(_loadArray, 1);
	global.JukeOptions = array_get(_loadArray, 2);
	
	global.JukeboxLoop = global.JukeOptions[0].loop;
	global.JukeboxShuffle = global.JukeOptions[0].shuffle;
}

