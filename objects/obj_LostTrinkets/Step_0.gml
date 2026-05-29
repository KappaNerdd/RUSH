scr_GetCharRushBoostIcon();

if !global.MIND && global.PlayerChar != 0 {
	sprite_index = _charCheck3;
	colChar = c_black;
} else {
	sprite_index = spr_HeadCollectable;
	colChar = c_white;
}

if uncollectable {
	uncollectableTimer--;
	
	if uncollectableTimer <= 0 {
		uncollectable = false;
	}
}

if kysTimer > 0 {
	kysTimer--;
} else {
	if dyingTimer > 0 {
		dyingTimer--;
		
		if visibleTimer > 0 {
			visibleTimer--;
		} else {
			visibleTimer = 2;
			visible = !visible;
		}
	} else {
		instance_destroy();
	}
}

x += ringXSpeed;
y += ringYSpeed;
ringYSpeed += grav;

if place_meeting(x + ringXSpeed, y, obj_Solid) or place_meeting(x + ringXSpeed, y, obj_SolidA) or place_meeting(x + ringXSpeed, y, obj_SolidB) {
	ringXSpeed = -ringXSpeed;
}

if place_meeting(x, y + ringYSpeed, obj_Solid) or place_meeting(x, y + ringYSpeed, obj_SolidA) or place_meeting(x, y + ringYSpeed, obj_SolidB) {
	ringYSpeed = -(ringYSpeed - 0.25);
}