locale = [
	"AR_TextLocale",
]

localeDialog = [
	"AR_DialogueLocale",
]

langFlags = [
	[spr_OptionEnglish, spr_OptionEnglishHead],
	[spr_OptionSpanish, spr_OptionSpanishHead],
]

scr_InitLocalization(locale[0]);
scr_InitLocalizationDialog(localeDialog[0]);

function scr_InitLocalization(_lang) {
	global.LocData = load_csv(string(_lang) + ".csv");
	
	var _dsHeight = ds_grid_height(global.LocData);
	var _localization = ds_map_create();
	
	for (var i = 0; i < _dsHeight; i++) {
		ds_map_add(_localization, global.LocData[# 0, i], i);
	}
	
	global.Localization = _localization;
}

function scr_LocalText(_key) {
	var _text = "";
	
	if global.Localization[? _key] != undefined {
		var _text = global.LocData[# global.Language, global.Localization[? _key]];
		var _num = argument_count > 1 ? argument[1] : "";
		_text = string_replace_all(_text, "{num}", _num);
	} else {
		var _text = _key;
	}
	
	return _text;
}


function scr_InitLocalizationDialog(_lang) {
	global.LocDialogData = load_csv(string(_lang) + ".csv");
	
	var _dsHeight = ds_grid_height(global.LocDialogData);
	var _localization = ds_map_create();
	
	for (var i = 0; i < _dsHeight; i++) {
		ds_map_add(_localization, global.LocDialogData[# 0, i], i);
	}
	
	global.LocalizationDialog = _localization;
}

function scr_DialogueText(_key) {
	var _text = "";
	
	if global.LocalizationDialog[? _key] != undefined {
		var _text = global.LocDialogData[# global.Language, global.LocalizationDialog[? _key]];
		var _num = argument_count > 1 ? argument[1] : "";
		_text = string_replace_all(_text, "{num}", _num);
	} else {
		var _text = _key;
	}
	
	return _text;
}