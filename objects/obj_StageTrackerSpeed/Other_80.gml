/*if global.Jukebox {
	var _stopMus = async_load[? "sound_id"];

	if _stopMus == obj_MusicManager.songInstance {
		var _array = global.CustomJukeboxPlaylist;
		
		if global.JukeboxShuffle {
			_array = global.CustomJukeShuffled;
		}
		
		if global.CustomJukeChoice < array_length(_array) - 1 {
			global.CustomJukeChoice++;
		} else {
			global.CustomJukeChoice = 0;
		}
									
		var _newJuke = audio_create_stream(_array[global.CustomJukeChoice]);
		set_song_ingame(_newJuke, 0, 30);
	}
}