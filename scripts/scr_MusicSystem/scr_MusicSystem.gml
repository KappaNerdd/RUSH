function set_song_ingame(_song = noone, _fadeOutCurrentSong = 0, _fadeIn = 0, _pitch = 1, _pos = 0) {
	//_song = Set to any song (noone = Stop song/no song playing)
	//_fadeOutCurrentSong = Time (in frames) the current song (if playing) will take to fade out
	//_fadeIn = Time (in frames) the target song (if not "noone") will take to fade in
	//_pitch = Pitch of the track playing
	
	with(obj_MusicManager) {
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
		targetPitch = _pitch;
		targetPos = _pos;
	}
}

function scr_MusicTag() {
	if !instance_exists(obj_MusicTagNew) {
		instance_create_depth(x, y, depth, obj_MusicTagNew)
	} else {
		obj_MusicTagNew.moved = false;
		obj_MusicTagNew.movedTimer = 240;
	}
}