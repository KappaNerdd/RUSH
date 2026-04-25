if instance_exists(obj_NameWhiteTrans) {
	image_alpha = obj_NameWhiteTrans.image_alpha;
} else {
	instance_destroy();
}

changeScale += 0.0025;