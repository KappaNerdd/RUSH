///Overall Saving
function save_game(_fileNum = 0) {
	save_Speed_Stage(_fileNum);
	
	//Save player position and room (Very big thanks to PeytonBurnham for his many tutorials)
	if instance_exists(obj_Player) {
		global.statData[0].save_x = obj_Player.x;
		global.statData[0].save_y = obj_Player.y;
		global.statData[0].save_rm = room_get_name(room);
	}
	
	//Save player technical info
	global.statData[0].player_Char = global.PlayerChar;
	global.statData[0].player_Costume = global.PlayerCostume;
	global.statData[0].player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
	
	global.statData[0].player_Name = global.PlayerName;
	global.statData[0].player_TimeSeconds = global.PlayerTimeSeconds;
	global.statData[0].player_TimeMinutes = global.PlayerTimeMinutes;
	global.statData[0].player_TimeHours = global.PlayerTimeHours;
	global.statData[0].player_ExtraLives = global.PlayerExtraLives;
	global.statData[0].player_Health = global.Health;

	
	//Actual Saving
	var _dir = working_directory + "/saves/" + string(_fileNum) + "/";
	var _filename = _dir + string(global.MainDataFile) + string(_fileNum) + ".sav";
	var _json = json_stringify(global.statData);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}
	
//Overall Loading
function load_game(_fileNum = 0) {
	//Loading our save data
	var _dir = working_directory + "/saves/" + string(_fileNum) + "/";
	var _filename = _dir + string(global.MainDataFile) + string(_fileNum) + ".sav";
	
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
	    if (i < array_length(global.statData)) {
	        var _saved = _loadArray[i];
	        var _current = global.statData[i];
	        var _keys = variable_struct_get_names(_saved);
			
			for (var k = 0; k < array_length(_keys); k++) {
				var _key = _keys[k];
				
				variable_struct_set(_current, _key, variable_struct_get(_saved, _key));
			}
		} else {
			array_push(global.statData, _loadArray[i]);
		}
	}
	
	//Use our new data to get back where we need to be
	//Go to the correct room
	var _loadRoom = asset_get_index(global.statData[0].save_rm);
		
	scr_RoomTrans(obj_RoomTransitionSEGALoad, _loadRoom);
		
	//Change player info if the player exists
	if instance_exists(obj_Player) {
		obj_Player.x = global.statData[0].save_x;
		obj_Player.y = global.statData[0].save_y;
	}
		
	global.PlayerChar = global.statData[0].player_Char;
	global.PlayerCostume = global.statData[0].player_Costume;
		
	global.PlayerName = global.statData[0].player_Name;
	global.PlayerTimeSeconds = global.statData[0].player_TimeSeconds;
	global.PlayerTimeMinutes = global.statData[0].player_TimeMinutes;
	global.PlayerTimeHours = global.statData[0].player_TimeHours;
	global.PlayerExtraLives = global.statData[0].player_ExtraLives;
}

function scr_GameReset() {
	//Resets Other Shit
	global.PlayerName = "";
	
	global.PlayerChar = 0;
	global.PlayerCostume = 0;
	
	global.PartnerChar = -1;
	global.PartnerCostume = 0;
	
	global.PlayerExtraLives = 2;
	global.CollectedLives = 0;
	
	global.PlayerTimeSeconds = 0;
	global.PlayerTimeMinutes = 0;
	global.PlayerTimeHours = 0;
	
	global.Health = global.MaxHealth;
	
	global.Death = false;
	global.RespawnX = 0;
	global.RespawnY = 0;
	
	global.SpeedSelected = 0;
	global.SelectedPlayer = 0;
	global.SelectedCostume = 0;
	global.Girly = false;
	global.MIND = false;
	
	//Reset Player Position & Room
	global.statData[0].save_x = 0;
	global.statData[0].save_y = 0;
	global.statData[0].save_rm = "fs_Empty";
	
	//Reset Player Stats & Time
	global.statData[0].player_Char = 0;
	global.statData[0].player_Costume = 0;
	global.statData[0].player_Sprite = spr_StageCharNone;
	
	global.statData[0].partner_Char = -1;
	global.statData[0].partner_Costume = 0;
	
	global.statData[0].player_Name = "fs_Empty";
	global.statData[0].player_TimeSeconds = 0;
	global.statData[0].player_TimeMinutes = 0;
	global.statData[0].player_TimeHours = 0;
	global.statData[0].player_ExtraLives = 2;
	global.statData[0].player_Health = 0;
	
	//Reset SPEED Stage Stats
	for(var i = 0; i < array_length(global.speedStageData); i++) {
		global.speedStageData[i].rank = 0;
		global.speedStageData[i].rankTime = 0;
		global.speedStageData[i].totalTime = 0;
		global.speedStageData[i].seconds = 0;
		global.speedStageData[i].minutes = 0;
		global.speedStageData[i].gameScore = 0;
		global.speedStageData[i].rankScore = 0;
		global.speedStageData[i].rings = 0;
		global.speedStageData[i].rings_Rank = 0;
		global.speedStageData[i].enemies = 0;
		global.speedStageData[i].enemy_Rank = 0;
			
		global.speedStageData[i].player_Char = 0;
		global.speedStageData[i].player_Sprite = spr_StageCharNone;
		global.speedStageData[i].player_Costume = 0;
		global.speedStageData[i].player_CharTime = 0;
		global.speedStageData[i].player_SpriteTime = spr_StageCharNone;
		global.speedStageData[i].player_CostumeTime = 0;
		global.speedStageData[i].player_CharScore = 0;
		global.speedStageData[i].player_SpriteScore = spr_StageCharNone;
		global.speedStageData[i].player_CostumeScore = 0;
		global.speedStageData[i].player_CharRings = 0;
		global.speedStageData[i].player_SpriteRings = spr_StageCharNone;
		global.speedStageData[i].player_CostumeRings = 0;
		global.speedStageData[i].player_CharEnemy = 0;
		global.speedStageData[i].player_SpriteEnemy = spr_StageCharNone;
		global.speedStageData[i].player_CostumeEnemy = 0;
		
		global.speedStageData[i].complete = false;
		global.speedStageData[i].musicSecret = false;
		
		for(var j = 0; j < array_length(global.speedStageData[i].jsrSecrets); j++) {
			global.speedStageData[i].jsrSecrets[j] = false;
		}
	}
}



//Saving Files (TRASH)
function scr_SaveFiles() {
	var _saveArray = array_create(0);
	
	//Actually save everything for the player
	if room != rm_FileSelect {
		if global.saveFile == 1 {
			global.file1.player_Char = global.PlayerChar;
			global.file1.player_Costume = global.PlayerCostume;
			global.file1.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file1.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file1.partner_Char = global.PartnerChar;
			global.file1.partner_Costume = global.PartnerCostume;
			
			global.file1.partner2_Char = global.Partner2Char;
			global.file1.partner2_Costume = global.Partner2Costume;
			
			global.file1.player_ExtraLives = global.PlayerExtraLives;
		
			global.file1.player_Name = global.PlayerName;
			global.file1.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file1.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file1.player_TimeHours = global.PlayerTimeHours;
			global.file1.player_Health = global.Health;
		
			global.file1.save_rm = room_get_name(room);
		}
	
	
		if global.saveFile == 2 {
			global.file2.player_Char = global.PlayerChar;
			global.file2.player_Costume = global.PlayerCostume;
			global.file2.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file2.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file2.partner_Char = global.PartnerChar;
			global.file2.partner_Costume = global.PartnerCostume;
			
			global.file2.partner2_Char = global.Partner2Char;
			global.file2.partner2_Costume = global.Partner2Costume;
			
			global.file2.player_ExtraLives = global.PlayerExtraLives;
		
			global.file2.player_Name = global.PlayerName;
			global.file2.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file2.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file2.player_TimeHours = global.PlayerTimeHours;
			global.file2.player_Health = global.Health;
		
			global.file2.save_rm = room_get_name(room);
		}
	
	
		if global.saveFile == 3 {
			global.file3.player_Char = global.PlayerChar;
			global.file3.player_Costume = global.PlayerCostume;
			global.file3.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file3.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file3.partner_Char = global.PartnerChar;
			global.file3.partner_Costume = global.PartnerCostume;
			
			global.file3.partner2_Char = global.Partner2Char;
			global.file3.partner2_Costume = global.Partner2Costume;
			
			global.file3.player_ExtraLives = global.PlayerExtraLives;
		
			global.file3.player_Name = global.PlayerName;
			global.file3.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file3.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file3.player_TimeHours = global.PlayerTimeHours;
			global.file3.player_Health = global.Health;
		
			global.file3.save_rm = room_get_name(room);
		}
	
	
		if global.saveFile == 4 {
			global.file4.player_Char = global.PlayerChar;
			global.file4.player_Costume = global.PlayerCostume;
			global.file4.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file4.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file4.partner_Char = global.PartnerChar;
			global.file4.partner_Costume = global.PartnerCostume;
			
			global.file4.partner2_Char = global.Partner2Char;
			global.file4.partner2_Costume = global.Partner2Costume;
			
			global.file4.player_ExtraLives = global.PlayerExtraLives;
		
			global.file4.player_Name = global.PlayerName;
			global.file4.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file4.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file4.player_TimeHours = global.PlayerTimeHours;
			global.file4.player_Health = global.Health;
		
			global.file4.save_rm = room_get_name(room);
		}
	
	
		if global.saveFile == 5 {
			global.file5.player_Char = global.PlayerChar;
			global.file5.player_Costume = global.PlayerCostume;
			global.file5.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file5.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file5.partner_Char = global.PartnerChar;
			global.file5.partner_Costume = global.PartnerCostume;
			
			global.file5.partner2_Char = global.Partner2Char;
			global.file5.partner2_Costume = global.Partner2Costume;
			
			global.file5.player_ExtraLives = global.PlayerExtraLives;
		
			global.file5.player_Name = global.PlayerName;
			global.file5.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file5.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file5.player_TimeHours = global.PlayerTimeHours;
			global.file5.player_Health = global.Health;
		
			global.file5.save_rm = room_get_name(room);
		}
	
	
		if global.saveFile == 6 {
			global.file6.player_Char = global.PlayerChar;
			global.file6.player_Costume = global.PlayerCostume;
			global.file6.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file6.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file6.partner_Char = global.PartnerChar;
			global.file6.partner_Costume = global.PartnerCostume;
			
			global.file6.partner2_Char = global.Partner2Char;
			global.file6.partner2_Costume = global.Partner2Costume;
			
			global.file6.player_ExtraLives = global.PlayerExtraLives;
		
			global.file6.player_Name = global.PlayerName;
			global.file6.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file6.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file6.player_TimeHours = global.PlayerTimeHours;
			global.file6.player_Health = global.Health;
		
			global.file6.save_rm = room_get_name(room);
		}
	
	
		if global.saveFile == 7 {
			global.file7.player_Char = global.PlayerChar;
			global.file7.player_Costume = global.PlayerCostume;
			global.file7.player_Sprite = global.PlayerSelection[global.PlayerChar][17][0];
			global.file7.textbox_Spr = global.PlayerSelection[global.PlayerChar][6][0];
			
			global.file7.partner_Char = global.PartnerChar;
			global.file7.partner_Costume = global.PartnerCostume;
			
			global.file7.partner2_Char = global.Partner2Char;
			global.file7.partner2_Costume = global.Partner2Costume;
			
			global.file7.player_ExtraLives = global.PlayerExtraLives;
		
			global.file7.player_Name = global.PlayerName;
			global.file7.player_TimeSeconds = global.PlayerTimeSeconds;
			global.file7.player_TimeMinutes = global.PlayerTimeMinutes;
			global.file7.player_TimeHours = global.PlayerTimeHours;
			global.file7.player_Health = global.Health;
		
			global.file7.save_rm = room_get_name(room);
		}
	}
	
	
	//Save Arrays
	array_push(_saveArray, global.file1);
	array_push(_saveArray, global.file2);
	array_push(_saveArray, global.file3);
	array_push(_saveArray, global.file4);
	array_push(_saveArray, global.file5);
	array_push(_saveArray, global.file6);
	array_push(_saveArray, global.file7);
	
	
	//Actual Saving
	var _dir = working_directory + "/saves/";
	var _filename = _dir + "SAVEFILESDATA.sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}


//Loading Files
function scr_LoadFiles() {
	//Loading our save data
	var _dir = working_directory + "/saves/"
	var _filename = _dir + "SAVEFILESDATA.sav";
	
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
	global.file1 = array_get(_loadArray, 0);
	global.file2 = array_get(_loadArray, 1);
	global.file3 = array_get(_loadArray, 2);
	global.file4 = array_get(_loadArray, 3);
	global.file5 = array_get(_loadArray, 4);
	global.file6 = array_get(_loadArray, 5);
	global.file7 = array_get(_loadArray, 6);
}