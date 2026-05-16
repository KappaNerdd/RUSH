/// @description Play correct music

#region ///-----Test Rooms-----///
	if room == rm_Test {
		set_song_ingame(mus_DISCONNECTED, 60, 0);
		instance_create_depth(x, y, depth, obj_MusicTag);
	}

	if room == rm_Test3 {
		set_song_ingame(mus_NewNight, 180, 2 * 60);
		instance_create_depth(x, y, depth, obj_MusicTag);
	}

	if room == rm_SpeedStageTest {
		set_song_ingame(mus_MyMind, 60, 60);
		instance_create_depth(x, y, depth, obj_MusicTag);
	}

	if room == rm_SpeedStageTest2 {
		set_song_ingame(mus_MyMind, 60, 60);
		instance_create_depth(x, y, depth, obj_MusicTag);
	}

	if room == rm_ActionStageTest {
		set_song_ingame(mus_HyperRush, 0, 0);
	}
#endregion


///-----File Select-----///
if room == rm_FileSelect {
	var _dir = working_directory + "/saves/";
	
	if !file_exists(_dir + string(global.PastMindDataFile) + ".sav") {
		set_song_ingame(noone, 60, 0);
	} else {
		set_song_ingame(mus_CestLaVie, 30, 20);
	
		if !audio_is_playing(mus_CestLaVie) {
			instance_create_depth(x, y, depth, obj_MusicTag);
		}
	}
}

#region ///-----Title Screen Head-----///
	if room == rm_TitleHead {
		set_song_ingame(mus_Solemn, 0, 3 * 60);
		scr_MusicTag();
	}

	if room == rm_MainMenuHead {
		set_song_ingame(mus_Solemn, 0, 3 * 60)
	}

	if room == rm_OptionsHead {
		set_song_ingame(mus_Solemn, 0, 3 * 60);
	}
#endregion

#region ///-----Title Screen-----///
	if room == rm_TitleNormal {
		set_song_ingame(mus_WakeyWakey, 60, 3 * 60);
		
		if !audio_is_playing(mus_WakeyWakey) {
			scr_MusicTag();
		}
	}
#endregion


///-----Freeplay-----///
if room == rm_Freeplay or room == rm_FreeplayNew {
	set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60, 60);
	scr_MusicTag();
}

if room == rm_CharSelect or room == rm_CharSelectNew {
	set_song_ingame(mus_FunknRushNew, 0, 0);
	scr_MusicTag();
}

#region ///-----Head-----///
	if room == rm_HeadOverworld2 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld3 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	}

	if room == rm_HeadOverworld4 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld5 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld6 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld7 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld8 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld9 && global.statData[1].head_Overworld9_Check1 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}

	if room == rm_HeadOverworld10 {
		set_song_ingame(mus_DISCONNECTED, 60, 60);
	
		if !audio_is_playing(mus_DISCONNECTED) {
			scr_MusicTag();
		}
	}
#endregion


///-----Game Over-----///
if room == rm_GameOver && global.PlayerChar == 0 {
	set_song_ingame(mus_AcceptReality, 0, 300);
	instance_create_depth(x, y, depth, obj_MusicTag);
}