image_alpha = 0;
depth = -10;

x = -10000000;

transComplete = false;
color = c_black;
colorRed = 0;
colorGreen = 0;
colorBlue = 0;

division = 2;

target_rm = 0;

if instance_exists(obj_Player) {
	obj_Player.can_Move = false;
}