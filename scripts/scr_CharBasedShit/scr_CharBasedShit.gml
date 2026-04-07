//Creation Code Variables
function scr_GetCharShitCreate() {
	_charCheck = 0;
	_charSprite = spr_TextboxHead;
	_liveSprite = 0;
	
	_charCostume = 0;
	
	
	_charCheck2 = 0;
	_liveSprite2 = 0;
	
	_charCheck3 = 0;
	_liveSprite3 = 0;
}


//Character Textboxes
function scr_GetCharTextboxes() {
	var _spr = global.PlayerSelection[global.PlayerChar][6][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, global.PlayerSelection[global.PlayerChar][6][1], false, false, 0, 0);
		
		var _9SliceCheck = sprite_get_nineslice(_charCheck);
		
		if !_9SliceCheck {
			var _nineSlice = sprite_nineslice_create();
			
			_nineSlice.enabled = true;
			_nineSlice.left = 2;
			_nineSlice.right = 2;
			_nineSlice.top = 2;
			_nineSlice.bottom = 2;
			
			sprite_set_nineslice(_charCheck, _nineSlice);
		}
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][6][0];
	}
	
	sprite_index = _charCheck;
}

function scr_GetCharTextboxesLocal() {
	if _charCheck == 1 {
		_charSprite = spr_KappaTextbox;
	} else if _charCheck == 2 {
		_charSprite = spr_SarahTextbox;
	} else if _charCheck == 3 {
		_charSprite = spr_LoneTextbox;
	} else if _charCheck == 4 {
		_charSprite = spr_BrockTextbox;
	} else if _charCheck == 5 {
		_charSprite = spr_NeegiTextbox;
	} else if _charCheck == 6 {
		_charSprite = spr_CloeTextbox;
	} else if _charCheck == 7 {
		_charSprite = spr_AkiraTextbox;
	} else if _charCheck == 10 {
		_charSprite = spr_RushTextbox;
	} else if _charCheck == 12 {
		_charSprite = spr_IvyTextbox;
	} else {
		_charSprite = spr_TextboxHead;
	}
}



//Level Card Shit
function scr_GetCharLevelCardPort() {
	//Set Image Index
	_charCostume = global.PlayerCostume;
	
	var _spr = global.PlayerSelection[global.PlayerChar][9][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][9][0];
	}
	
}

//Freeplay Shit
function scr_GetCharFreeplayPort() {
	//Set Image Index
	_charCostume = global.PlayerCostume;
	
	var _spr = global.PlayerSelection[global.PlayerChar][11][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][11][0];
	}
	
	sprite_index = _charCheck;
	image_index = _charCostume;
}

function scr_GetCharFreeplayPortLocal() {
	_charCostume = global.PlayerCostume;
	
	var _spr = global.PlayerSelection[global.PlayerChar][11][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][11][0];
	}
	
	_charSprite = _charCheck;
}

//HUD
function scr_GetCharLives() {
	_charCostume = global.PlayerCostume;
	
	var _spr = global.PlayerSelection[global.PlayerChar][17][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][17][0];
	}
	
	sprite_index = _charCheck;
	image_index = _charCostume;
}

function scr_GetCharLivesLocal() {
	_charCostume = global.PlayerCostume;
	
	var _spr = global.PlayerSelection[_liveSprite][17][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[_liveSprite][17][0];
	}
}

function scr_GetCharBoostMeter() {
	var _spr = global.PlayerSelection[global.PlayerChar][14][0];
	
	if is_string(_spr) {
		_charCheck2 = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck2 = global.PlayerSelection[global.PlayerChar][14][0];
	}
	
	_liveSprite2 = _charCheck2;
}

function scr_GetCharBoostIcon() {
	var _spr = global.PlayerSelection[global.PlayerChar][15][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][15][0];
	}
	
	iconSprite = _charCheck;
}

function scr_GetCharRushBoostIcon() {
	var _spr = global.PlayerSelection[global.PlayerChar][16][0];
	
	_charCheck3 = global.PlayerSelection[global.PlayerChar][16][0];
	
	_liveSprite3 = _charCheck3;
}


//Boost
function scr_GetCharBoost() {
	var _spr = global.PlayerSelection[global.PlayerChar][18][0];
	
	if is_string(_spr) {
		_charCheck = sprite_add(_spr, 0, false, false, 0, 0);
	} else {
		_charCheck = global.PlayerSelection[global.PlayerChar][18][0];
		_liveSprite = global.PlayerSelection[global.PlayerChar][18][1];
	}
}