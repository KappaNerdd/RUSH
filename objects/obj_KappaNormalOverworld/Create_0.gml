#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataKappaNormal();
	} else if global.PlayerCostume == 1 {
		scr_SpriteDataKappaHideki();
	}
#endregion

#region //Character Data Variables
	scr_CharDataKappa();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	//Choose if your character has unique left-facing sprites or not
	leftFacer = false;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = true;
	blazeRush = false;
#endregion

#region //Air Dash
	airDash = false;
	airDashTimer = 0;
	airDashFrames = 10;
#endregion

#region //Stomping
	preStomp = false;
	stomping = false;
	stomped = false;
#endregion

#region //Homing-Attack
	spindash = false;
	superPeelout = false;
	dropdash = false;

	scr_HomingAttackCreate();
#endregion