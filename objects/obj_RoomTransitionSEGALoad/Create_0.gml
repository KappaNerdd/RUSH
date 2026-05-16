image_alpha = 0;
depth = -10;

x = -1000000;

transComplete = false;
color = c_black;
colorRed = 0;
colorGreen = 0;
colorBlue = 0;

division = 3;

target_rm = 0;
spawnPlayer = false;

if instance_exists(obj_Player) {
	obj_Player.can_Move = false;
}