//Volume Variable
var _finalVol = global.MUSIC_VOL * global.MASTER_VOL;

if is_string(targetSongAsset) {
	audio_create_stream(targetSongAsset);
} else {
	//Play target song
	if songAsset != targetSongAsset {
		//Tell the old song to fade out
		if audio_is_playing(songInstance) {
			//Add songInstance to array of songs to fade out
			array_push(fadeOutInstance, songInstance);
		
			//Add songInstance's starting volume (so there's no sudden change in volume)
			array_push(fadeOutInstVol, fadeInInstVol);
		
			//Add the fadeOutInstance's fade out frames
			array_push(fadeOutInstTime, endFadeOutTime);
		
		
			//Reset songInstance and songAsset variables
			songInstance = noone;
			songAsset = noone;
		}
	
		//Play the song if the old song faded out
		if array_length(fadeOutInstance) == 0 {
			if audio_exists(targetSongAsset) {
				//Play song and store instance in variable
				if global.Freeplay {
					if !global.Jukebox {
						songInstance = audio_play_sound(targetSongAsset, 1, true, 0, targetPos);
					} else {
						if global.JukeboxLoop {
							songInstance = audio_play_sound(targetSongAsset, 1, true);
						} else {
							songInstance = audio_play_sound(targetSongAsset, 1, false);
						}
					}
				} else {
					songInstance = audio_play_sound(targetSongAsset, 1, true, 0, targetPos);
				}

				//Start song's volume at 0
				audio_sound_gain(songInstance, 0, 0);
				fadeInInstVol = 0;
			}
	
			//Set the songAsset to match targetSongAsset
			songAsset = targetSongAsset;
		}
	}


	///-----Volume Control-----///

	//Main Song Volume
	if audio_is_playing(songInstance) {
		//Fade in song
		if startFadeInTime > 0 {
			if fadeInInstVol < 1 { fadeInInstVol += 1 / startFadeInTime; } else fadeInInstVol = 1;
		} else {
			fadeInInstVol = 1;
		}
	
		//Actually set the gain
		audio_sound_gain(songInstance, fadeInInstVol * _finalVol, 0);
		
		//Set Audio Pitch
		audio_sound_pitch(songInstance, targetPitch);
	}
	
	//Fading Song Out
	for(var i = 0; i < array_length(fadeOutInstance); i++) {
		//Fade the volume
		if fadeOutInstTime[i] > 0 {
			if fadeOutInstVol[i] > 0 {fadeOutInstVol[i] -= 1 / fadeOutInstTime[i];};
		} else {
			fadeOutInstVol[i] = 0;
		}
		
		//Actually set the gain
		audio_sound_gain(fadeOutInstance[i], fadeOutInstVol[i] * _finalVol, 0);
		
		//Stop song when volume is at 0 & remove form array
		if fadeOutInstVol[i] <= 0 {
			//Stop song
			if audio_is_playing(fadeOutInstance[i]) {audio_stop_sound(fadeOutInstance[i]);};
			
			//Remove from arrays
			array_delete(fadeOutInstance, i, 1);
			array_delete(fadeOutInstVol, i, 1);
			array_delete(fadeOutInstTime, i, 1);
		
			//Set loop back 1 since we deleted an entry
			i--;
		}
	}
}
