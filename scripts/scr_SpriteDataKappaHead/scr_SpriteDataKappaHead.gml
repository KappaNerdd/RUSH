function scr_SpriteDataKappaHead() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_KappaIdleMask;

	//Crouch
	crouch_Mask = spr_KappaCrouchMask;

	//Slide
	slide_Mask = spr_KappaSlideMask;



	///-----Animations-----///

	//Idle
	sprIdle = spr_KappaIdleHead;
	sprSpecialIdle = spr_KappaSpecialIdleHead;
	sprPrepare = spr_KappaPrepareHead;


	//Movement
	sprWalk = spr_KappaWalkHead;
	sprRun = spr_KappaRunHead;
	sprFullSpeedRun = spr_KappaFullSpeedRunHead;
	sprSkid = spr_KappaSkidHead;


	//Jumping
	sprJump = spr_KappaJumpHead;
	sprDJump = spr_KappaDJumpHead;


	//Falling
	sprFall = spr_KappaFallHead;
	sprFalling = spr_KappaFallingHead;
	sprWallSlide = spr_KappaWallClingHead;


	//Look Up & Crouching
	sprCrouch = spr_KappaCrouchHead;
	sprLook_up = spr_KappaLookUpHead;


	//Actions
	sprGuard = spr_KappaGuardHead;
	sprSlide = spr_KappaSlideHead;
	sprAirDash = spr_KappaAirDashHead;

	sprStomping = spr_KappaStompingHead;
	sprStomp = spr_KappaStompHead;

	sprRailGrind = spr_KappaRailGrindHead;
	sprRailGrindCrouch = spr_KappaRailGrindCrouchHead;
	
	
	//Launches
	sprRailJump = spr_KappaRailJumpHead;
	sprUpLaunch = spr_KappaLauncherUpHead;
	sprSideLaunch = spr_KappaLauncherHead;
	
	
	//Tricking
	sprTrickUpPre = spr_KappaTrickUpPreHead;
	sprTrickUp = spr_KappaTrickUpHead;
	
	sprTrickSidePre = spr_KappaTrickRightPreHead;
	sprTrickSide = spr_KappaTrickRightHead;
	
	sprTrick1 = spr_KappaTrick1Head;
	sprTrick2 = spr_KappaTrick2Head;
	sprTrick3 = spr_KappaTrick3Head;
	sprTrick3Fin = spr_KappaTrick3FinHead;
	
	sprRailTrick1 = spr_KappaRailTrick1Head;
	sprRailTrick2 = spr_KappaRailTrick2Head;
	sprRailTrick3 = spr_KappaRailTrick3Head;

	//Special
	sprPully = spr_KappaPully;
	sprHoming = spr_KappaHomingHead;
	
	
	//Hurting
	sprDeath = spr_KappaDeathHead;
	sprOmegaFall = spr_KappaHurtHead;
	sprSpiral = spr_KappaSpiralHead;
	
	
	//Victory
	sprVictory = spr_KappaVictoryHead;
	
	//Balance
	sprBalanceFor = spr_KappaBalanceForHead;
	sprBalanceBack = spr_KappaBalanceBackHead;
	
	//Pushing
	sprPush = spr_KappaPushHead;
}