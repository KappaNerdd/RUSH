global.PlayerChar = 0;

image_angle = 180;

afterTimer = 10;

charAngle = 0;
extraAngle = 4;

charX = x;
charY = y;

xspd = 3;
yspd = 20;

float = false;
high = false;

dir = 1;

createName = true;

waitTimer = 90;

leave = false;

repeat(20) {
	with(instance_create_depth(x, y, depth - 1, obj_HeadParticleDeath)) {
		yspd = random_range(12, 15);
	}
}

image_xscale = 2;
image_yscale = 2;

var _trackPos = audio_sound_get_track_position(obj_MusicManager.songInstance);

set_song_ingame(mus_MINDWAVE_A, 0, 0, 1, _trackPos);