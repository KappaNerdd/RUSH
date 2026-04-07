if launchConfirmed {
	if launchTimer > 0 {
		launchTimer -= 1;
	} else {
		launchConfirmed = false;
		launchTimer = launchFrames;
	}
}