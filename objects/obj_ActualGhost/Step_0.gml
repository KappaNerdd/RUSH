if instance_exists(obj_StageTrackerSpeed) {
	if frame < ghostFrames {
		frameData = ghostData[| frame];
	
		x = frameData[? "x"];
		y = frameData[? "y"];
		image_xscale = frameData[? "xscale"];
		image_yscale = frameData[? "yscale"];
		image_angle = frameData[? "angle"];
		sprite_index = frameData[? "sprite"];
		image_index = frameData[? "image"];
	
		frame++;
	}
	
	if x > obj_GOALRing.x {
		instance_destroy();
	}
}

if !global.SimplifyVFX {
	visible = !visible;
} else {
	visible = true;
	image_blend = global.fullRGB;
}

