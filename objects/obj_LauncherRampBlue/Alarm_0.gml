if global.MIND or global.PlayerChar == 0 {
	sprite_index = mindSprite;
}

if instance_exists(obj_Player) {
	depth = obj_Player.depth + 1;
}