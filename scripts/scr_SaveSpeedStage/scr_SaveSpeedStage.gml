///Speed Stage Saving
function save_Speed_Stage(_fileNum = 0) {
	if !instance_exists(obj_SavBox) {		
		var _life = global.PlayerSelection[global.PlayerChar][17][0];
			
		if global.MIND {
			_life = global.PlayerSelection[global.PlayerChar][17][3];
		}
			
		//Ensure that if the rank is worse than what was previously saved, it will not save
		if global.Rank > global.speedStageData[global.SpeedSelected].rank {
			global.speedStageData[global.SpeedSelected].rank = global.Rank; //Keep track of rank
			global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
			global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
			global.speedStageData[global.SpeedSelected].seconds = global.seconds;
			global.speedStageData[global.SpeedSelected].minutes = global.minutes;
			global.speedStageData[global.SpeedSelected].gameScore = global.GameScore;
			global.speedStageData[global.SpeedSelected].rankScore = global.RankScore;
			global.speedStageData[global.SpeedSelected].rings = global.Rings;
			global.speedStageData[global.SpeedSelected].rings_Rank = global.RankRings;
			global.speedStageData[global.SpeedSelected].enemies = global.EnemyCount;
			global.speedStageData[global.SpeedSelected].enemy_Rank = global.RankEnemies;
			
			global.speedStageData[global.SpeedSelected].player_Char = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_Sprite = _life;
			global.speedStageData[global.SpeedSelected].player_Costume = global.PlayerCostume;
			global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_SpriteTime = _life;
			global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
			global.speedStageData[global.SpeedSelected].player_CharScore = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_SpriteScore = _life;
			global.speedStageData[global.SpeedSelected].player_CostumeScore = global.PlayerCostume;
			global.speedStageData[global.SpeedSelected].player_CharRings = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_SpriteRings = _life;
			global.speedStageData[global.SpeedSelected].player_CostumeRings = global.PlayerCostume;
			global.speedStageData[global.SpeedSelected].player_CharEnemy = global.PlayerChar;
			global.speedStageData[global.SpeedSelected].player_SpriteEnemy = _life;
			global.speedStageData[global.SpeedSelected].player_CostumeEnemy = global.PlayerCostume;
			
			obj_NewRecordN.visible = true;
		} else {
			if global.speedStageData[global.SpeedSelected].gameScore < global.GameScore {
				global.speedStageData[global.SpeedSelected].gameScore = global.GameScore;
				global.speedStageData[global.SpeedSelected].rankScore = global.RankScore;
				global.speedStageData[global.SpeedSelected].player_CharScore = global.PlayerChar;
				global.speedStageData[global.SpeedSelected].player_SpriteScore = _life;
				global.speedStageData[global.SpeedSelected].player_CostumeScore = global.PlayerCostume;
			}
			
			if global.speedStageData[global.SpeedSelected].rings < global.Rings {
				global.speedStageData[global.SpeedSelected].rings = global.Rings;
				global.speedStageData[global.SpeedSelected].rings_Rank = global.RankRings;
				global.speedStageData[global.SpeedSelected].player_CharRings = global.PlayerChar;
				global.speedStageData[global.SpeedSelected].player_SpriteRings = _life;
				global.speedStageData[global.SpeedSelected].player_CostumeRings = global.PlayerCostume;
			}
			
			if global.speedStageData[global.SpeedSelected].enemies < global.EnemyCount {
				global.speedStageData[global.SpeedSelected].enemies = global.EnemyCount;
				global.speedStageData[global.SpeedSelected].enemy_Rank = global.RankEnemies;
				global.speedStageData[global.SpeedSelected].player_CharEnemy = global.PlayerChar;
				global.speedStageData[global.SpeedSelected].player_SpriteEnemy = _life;
				global.speedStageData[global.SpeedSelected].player_CostumeEnemy = global.PlayerCostume;
			}
		
			//Ensure that if the minutes AND seconds are higher than what was previously saved, it will not save
			if global.speedStageData[global.SpeedSelected].minutes > 0 {
				if global.minutes < global.speedStageData[global.SpeedSelected].minutes {
					global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
					global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
					global.speedStageData[global.SpeedSelected].seconds = global.seconds;
					
					global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
					global.speedStageData[global.SpeedSelected].player_SpriteTime = _life;
					global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
				} else if global.minutes == global.speedStageData[global.SpeedSelected].minutes {
					if global.seconds < global.speedStageData[global.SpeedSelected].seconds {
						global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
						global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
						global.speedStageData[global.SpeedSelected].seconds = global.seconds;
						
						global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
						global.speedStageData[global.SpeedSelected].player_SpriteTime = _life;
						global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
					}
				}
			} else {
				if global.seconds < global.speedStageData[global.SpeedSelected].seconds && global.minutes == 0 {
					global.speedStageData[global.SpeedSelected].rankTime = global.RankTime;
					global.speedStageData[global.SpeedSelected].totalTime = (global.minutes * 100) + global.seconds;
					global.speedStageData[global.SpeedSelected].seconds = global.seconds;
					
					global.speedStageData[global.SpeedSelected].player_CharTime = global.PlayerChar;
					global.speedStageData[global.SpeedSelected].player_SpriteTime = _life;
					global.speedStageData[global.SpeedSelected].player_CostumeTime = global.PlayerCostume;
				}
			}
		
			if global.minutes <= global.speedStageData[global.SpeedSelected].minutes {
				global.speedStageData[global.SpeedSelected].minutes = global.minutes; //Keep track of minutes
			}
		}
		
		global.speedStageData[global.SpeedSelected].complete = true;
	}
	
	//Saving Level Data
	if instance_exists(obj_SavBox) or global.Freeplay {
		var _filterArray = [];
	
		for(var i = 0; i < array_length(global.speedStageData); i++) {
			var _og = global.speedStageData[i];
		
			var _newArray = {
				locked: _og.locked,
				complete: _og.complete,
				
				jsrSecrets: _og.jsrSecrets,
				musicSecret: _og.musicSecret,
				
				rank: _og.rank,
				player_Char: _og.player_Char,
				player_Sprite: _og.player_Sprite,
				player_Costume: _og.player_Costume,
				
				rankTime: _og.rankTime,
				seconds: _og.seconds,
				minutes: _og.minutes,
				totalTime: _og.totalTime,
				player_CharTime: _og.player_CharTime,
				player_SpriteTime: _og.player_SpriteTime,
				player_CostumeTime: _og.player_CostumeTime,
				
				rankScore: _og.rankScore,
				gameScore: _og.gameScore,
				player_CharScore: _og.player_CharScore,
				player_SpriteScore: _og.player_SpriteScore,
				player_CostumeScore: _og.player_CostumeScore,
				
				rings_Rank: _og.rings_Rank,
				rings: _og.rings,
				player_CharRings: _og.player_CharRings,
				player_SpriteRings: _og.player_SpriteRings,
				player_CostumeRings: _og.player_CostumeRings,
				
				enemy_Rank: _og.enemy_Rank,
				enemies: _og.enemies,
				player_CharEnemy: _og.player_CharEnemy,
				player_SpriteEnemy: _og.player_SpriteEnemy,
				player_CostumeEnemy: _og.player_CostumeEnemy,
			}
			
			array_push(_filterArray, _newArray);
		}
		
		var _dir = working_directory + "/saves/" + string(_fileNum) + "/";
		var _filename = _dir + string(global.SpeedDataFile) + string(_fileNum) + ".sav";
		var _json = json_stringify(_filterArray);
		var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
		buffer_write(_buffer, buffer_string, _json);
		buffer_save(_buffer, _filename);
		buffer_delete(_buffer);
	}
}

///Speed Stage Loading
function load_Speed_Stage(_fileNum = 0) {
	//Loading our save data
	var _dir = working_directory + "/saves/" + string(_fileNum) + "/";
	var _filename = _dir + string(global.SpeedDataFile) + string(_fileNum) + ".sav";
		
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
		if (i < array_length(global.speedStageData)) {
			var _saved = _loadArray[i];
			var _current = global.speedStageData[i];
			var _keys = variable_struct_get_names(_saved);
				
			for (var k = 0; k < array_length(_keys); k++) {
				var _key = _keys[k];
				
				variable_struct_set(_current, _key, variable_struct_get(_saved, _key));
			}
		} else {
			array_push(global.speedStageData, _loadArray[i]);
		}
	}
}