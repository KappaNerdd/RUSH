#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataSarahNormal();
	}
#endregion

#region //Character Data Variables
	scr_CharDataSarah();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	//Choose if your character has unique left-facing sprites or not
	leftFacer = true;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = false;
	blazeRush = true;
#endregion

#region //Rail Jspd
	baseCeilY = 5;
	perfectCeilY = 0;
	ceilY = 0;
	//sensorTopDistance = 28;
	railJspd = -20;
	sideWallJump = false;
#endregion

#region //Hovering
	hover = false;
#endregion

#region //Stomping
	stomping = false;
	stomped = false;
	stompingTimer = 30;
	stompingFrames = 30;
	stompedSound = false;
	
	normalStomp = false;
	omegaStomp = false;
	omegaStompingTimer = 0;
	omegaTermVel = full_TermVel;
#endregion