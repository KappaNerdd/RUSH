global.RespawnX = obj_Player.x;
global.RespawnY = obj_Player.y;

global.Death = false;

active = false;
bonus = 1000;
sprColor = c_white;

depth = obj_Player.depth + 1;

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = global.PlayerSelection[global.PlayerChar][28][0];
}