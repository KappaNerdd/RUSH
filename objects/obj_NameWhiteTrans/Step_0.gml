if !nextRoom {
	if image_alpha < 1 {
		image_alpha += 0.002;
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.005;
	}
}


if image_alpha >= 1 {
	nextRoom = true;
	room_goto(rm_HeadOverworld2);
}

if image_alpha <= 0 && nextRoom {
	instance_destroy();
}