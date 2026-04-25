function scr_ULTRATEXT(_text = "game_Whoops", _time = 300) {
	if !instance_exists(obj_ULTRATEXT) {
		with(instance_create_depth(0, 0, 0, obj_ULTRATEXT)) {
			ultraText = _text;
			ultraTimer = _time;
		}
	} else {
		with(obj_ULTRATEXT) {
			ultraText = _text;
			ultraTimer = _time;
			
			if ultraTimer == _time {
				audio_play_sound(snd_Message, 8, false, global.MASTER_VOL * global.SFX_VOL);
			}
		}
	}
}