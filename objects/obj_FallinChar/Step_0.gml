if afterTimer > 0 {
	afterTimer--;
} else {
	afterTimer = 10;
	
	if !global.SimplifyVFX {
		with(instance_create_depth(x, y, depth + 1, obj_FallinAfterImage)) {
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_angle = other.image_angle;
		}
	}
}

if !float {
	if !high {
		yspd -= 0.1;
		
		if yspd <= 5 {
			obj_HeadBlockBG.extraY += 0.1;
		}
		
		if yspd <= -11.2 {
			high = true;
		}
	} else {
		yspd = lerp(yspd, 0, 0.01);
		
		if yspd >= -0.01 {
			float = true;
			yspd = 0;
			
			if createName {
				if !obj_FallinSkip.skip {
					with(instance_create_depth(x, y, depth, obj_FadeIntroText)) {
						textArray = [
							"new_Intro3-1",
							"new_Intro3-2",
							"new_Intro3-3",
							"new_Intro3-4",
							"new_Intro3-5",
							"new_Intro3-6",
							"new_Intro3-7",
							"new_Intro3-8",
							"new_Intro3-9",
							"new_Intro3-10",
							"new_Intro3-11",
							"new_Intro3-12",
							"new_Intro3-13",
							"new_Intro3-14",
						];
					
						createName = true;
					}
				}
			}
		}
	}
	
	xspd = lerp(xspd, 0, 0.015);
	
	if yspd <= 0 && yspd >= -0.1 {
		charX = 384;
		xspd = 0;
	}
}

if !high {
	charX += xspd;
	
	x = charX;
	y = charY;
}

charY += yspd;

if high {
	if obj_HeadBlockBG.extraY > 10 {
		obj_HeadBlockBG.extraY -= 0.025;
	}
	
	charAngle += extraAngle;
	
	if !float {
		if extraAngle > 0.5 {
			extraAngle -= 0.01;
		}
	}
	
	image_speed = extraAngle * dir * 2;
}

if waitTimer > 0 {
	waitTimer--;
} else {
	x = charX + lengthdir_x(250, charAngle);
	y = charY + lengthdir_y(70, charAngle);
}

if leave && !instance_exists(obj_FadeIntroText) && !instance_exists(obj_NameMakerNew) {
	if !instance_exists(obj_NameWhiteTrans) {
		instance_create_depth(-1000, 0, 0, obj_NameWhiteTrans);
		instance_create_depth(-1000, 0, 0, obj_FallinTitle);
	}
		
	obj_FallinChar.yspd += 0.02;
	obj_FallinChar.extraAngle += 0.02;
	obj_HeadBlockBG.extraY += 0.08;
}