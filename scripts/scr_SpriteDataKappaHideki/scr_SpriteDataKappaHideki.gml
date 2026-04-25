function scr_SpriteDataKappaHideki() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	kappa_Idle_Mask = spr_KappaIdleMask;

	//Crouch
	kappa_Crouch_Mask = spr_KappaCrouchMask;

	//Slide
	kappa_Slide_Mask = spr_KappaSlideMask;



	///-----Animations-----///

	//Idle
	kappa_Idle = spr_KappaIdleHideki;
	kappa_Special_Idle = spr_KappaSpecialIdleHideki;
	kappa_Prepare = spr_KappaPrepareSoloHideki;


	//Movement
	kappa_Walking = spr_KappaWalkHideki;
	kappa_Running = spr_KappaRunHideki;
	kappa_FullSpeed = spr_KappaFullSpeedRunHideki;
	kappa_Skid = spr_KappaSkidHideki;


	//Jumping
	kappa_jumping = spr_KappaJumpHideki;
	kappa_DJumping = spr_KappaDoubleJumpHideki;


	//Falling
	kappa_Falling = spr_KappaFallHideki;
	kappa_Falling_Loop = spr_KappaFallingHideki;
	kappa_WallSlide = spr_KappaWallClingHideki;
	kappa_OmegaFall = spr_KappaHurtHideki;


	//Look Up & Crouching
	kappa_Ducking = spr_KappaCrouchHideki;
	kappa_Look_Up = spr_KappaLookUpHideki;


	//Actions
	kappa_Guarding = spr_KappaGuard;

	kappa_Sliding = spr_KappaSlidingHideki;

	kappa_AirDash = spr_KappaAirDashHideki;

	kappa_Stomping = spr_KappaStompingHideki;
	kappa_Stomp = spr_KappaStompHideki;

	kappa_RailGrind = spr_KappaRailGrindHideki;
	kappa_RailGrindCrouch = spr_KappaRailGrindCrouchHideki;
	kappa_RailJump = spr_KappaRailJumpHideki;
	
	
	//Tricking
	kappa_TrickUpPre = spr_KappaTrickUpPreHideki;
	kappa_TrickUp = spr_KappaTrickUpHideki;
	
	kappa_TrickSidePre = spr_KappaTrickRightPreHideki;
	kappa_TrickSide = spr_KappaTrickRightHideki;
	
	kappa_Trick1 = spr_KappaTrick1Hideki;
	kappa_Trick2 = spr_KappaTrick2Hideki;
	kappa_Trick3 = spr_KappaTrick3FinHideki;
	kappa_TrickFinish = spr_KappaTrick3FinHideki;
	
	kappa_Death = spr_KappaDeathHideki;
	
	//Special
	kappa_Pully = spr_KappaPullyHideki;
	
	//Particles
	boostingSprite = spr_KappaBoost;
	boostingSpriteSimple = spr_KappaBoostSimple;
	
	stompingSprite = spr_KappaStompingVFX;
	stompedSprite = spr_KappaStompedVFX;
	
	speedBreakSprite = spr_KappaSpeedBreakVFX;
}