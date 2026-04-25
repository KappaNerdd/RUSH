#region //Ivy Exclusives
	instance_create_depth(x, y, depth, obj_IvyRevolverUI);
	instance_create_depth(x, y, depth, obj_IvyCharge);
	instance_create_depth(x, y, depth, obj_IvyChargeSoul);
#endregion

#region //Sprites
	if global.PlayerCostume == 0 {
		scr_SpriteDataIvyNormal();
	}
#endregion

#region //Character Data
	#region //Mask Collisions
		idle_Mask = ivy_Idle_Mask;
		crouch_Mask = ivy_Crouch_Mask;
		slide_Mask = ivy_Slide_Mask;
	#endregion

	#region //Idles
		sprIdle = ivy_Idle;
		sprSpecialIdle = ivy_Special_Idle;
		sprPrepare = ivy_Prepare;
		sprCrouch = ivy_Ducking;
		sprLook_up = ivy_Look_Up;
	#endregion
	
	#region //Running
		sprWalk = ivy_Walking;
		sprRun = ivy_Running;
		sprFullSpeedRun = ivy_FullSpeed;
	#endregion
	
	#region //Jumping
		sprJump = ivy_jumping;
		sprFall = ivy_Falling;
		sprFalling = ivy_Falling_Loop;
		sprDJump = ivy_DJumping;
	#endregion
		
	#region //Shooting
		sprShootGround = ivy_ShootGround;
		sprShootAir = ivy_ShootAir;
		sprHShooting = ivy_HShooting;
	#endregion
	
	#region //Extras
		sprSlide = ivy_Sliding;
		sprPreStomp = ivy_PreStomp;
		sprStomping = ivy_Stomping;
		sprStomp = ivy_Stomp;
		sprSkid = ivy_Skid;
	#endregion
	
	#region //Rail-Grind
		sprRailGrind = ivy_RailGrind;
		sprRailGrindCrouch = ivy_RailGrindCrouch;
		sprRailJump = ivy_RailJump;
	#endregion
	
	#region //Tricks
		sprTrickUpPre = ivy_TrickUpPre;
		sprTrickUp = ivy_TrickUp;
		sprTrickSidePre = ivy_TrickSidePre;
		sprTrickSide = ivy_TrickSide;
		sprTrick1 = ivy_Trick1;
		sprTrick2 = ivy_Trick2;
		sprTrick3 = ivy_Trick3;
		sprTrick3Fin = ivy_TrickFinish;
	#endregion
	
	#region //Hurt
		sprOmegaFall = ivy_OmegaFall;
		sprDeath = ivy_Death;
	#endregion
	
	#region //Special
		sprPully = ivy_Pully;
	#endregion
#endregion

#region //Character Data Variables
	scr_CharDataIvy();
#endregion

#region //Basic Variables
	scr_BasicVariablesSpeedCreate();
#endregion

#region //Girly/Left-Facing/Sonic & Blaze Rush
	smallChar = true;

	//Choose if your character has unique left-facing sprites or not
	leftFacer = false;
	
	//Choose if your character should play Sonic's boost sound or Blaze's boost sound.
	sonicRush = false;
	blazeRush = true;
	
	railJspd = -20;
#endregion

#region //Shooting
	shootGround = false;
	shootAir = false;
	
	hShootWeak = false;
	hShootWeakTimer = 0;
	hShootWeakFrames = 15;
	
	hShoot = false;
	hShootFinish = false;
	hShootTimer = 0;
	hShootFrames = 15;

	revolverAmmo = 6;

	chargeTimer = 0;
	chargeFrames = 50;
	chargeTimer = chargeFrames;

	fullCharge = false;
	fullChargeAuraTimer = 0;
	fullChargeAuraFrames = 25;

	reload = false;
	reloadTimer = 0;
	reloadFrames = 60;
	reloadFramesAir = 150;
	reloadFramesAir2 = 240;
#endregion

#region //Stomping
	preStomp = false;
	preStompTimer = 0;
	preStompFrames = 15;

	stomping = false;
	stomped = false;
	stompPow = false;
#endregion

#region //Extras
	sensorTopDistance = 14;
#endregion
	