if global.DownBPM {
	if global.RealBPM > 0 {
		global.RealBPM -= delta_time / 1000000;
	} else {
		global.RealBPM = global.ConvertedBPM;
	}
}