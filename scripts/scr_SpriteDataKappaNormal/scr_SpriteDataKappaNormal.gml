function scr_SpriteDataKappaNormal() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_KappaIdleMask;

	//Crouch
	crouch_Mask = spr_KappaCrouchMask;

	//Slide
	slide_Mask = spr_KappaSlideMask;



	///-----Animations-----///

	//Idle
	sprIdle = spr_KappaIdle;
	sprSpecialIdle = spr_KappaSpecialIdle;
	sprPrepare = spr_KappaPrepareSolo;


	//Movement
	sprWalk = spr_KappaWalk;
	sprRun = spr_KappaRun;
	sprFullSpeedRun = spr_KappaFullSpeedRun;
	sprSkid = spr_KappaSkid;


	//Jumping
	sprJump = spr_KappaJump;
	sprDJump = spr_KappaDJump;


	//Falling
	sprFall = spr_KappaFall;
	sprFalling = spr_KappaFalling;
	sprWallSlide = spr_KappaWallCling;


	//Look Up & Crouching
	sprCrouch = spr_KappaCrouch;
	sprLook_up = spr_KappaLookUp;


	//Actions
	sprGuard = spr_KappaGuard;
	sprSlide = spr_KappaSlide;
	sprAirDash = spr_KappaAirDash;

	sprStomping = spr_KappaStomping;
	sprStomp = spr_KappaStomp;

	sprRailGrind = spr_KappaRailGrind;
	sprRailGrindCrouch = spr_KappaRailGrindCrouch;
	
	
	//Launches
	sprRailJump = spr_KappaRailJump;
	sprUpLaunch = spr_KappaLauncherUp;
	sprSideLaunch = spr_KappaLauncher;
	
	
	//Tricking
	sprTrickUpPre = spr_KappaTrickUpPre;
	sprTrickUp = spr_KappaTrickUp;
	
	sprTrickSidePre = spr_KappaTrickRightPre;
	sprTrickSide = spr_KappaTrickRight;
	
	sprTrick1 = spr_KappaTrick1;
	sprTrick2 = spr_KappaTrick2;
	sprTrick3 = spr_KappaTrick3;
	sprTrick3Fin = spr_KappaTrickFin;
	
	sprRailTrick1 = spr_KappaRailTrick1;
	sprRailTrick2 = spr_KappaRailTrick2;
	sprRailTrick3 = spr_KappaRailTrick3;

	//Special
	sprPully = spr_KappaPully;
	sprHoming = spr_KappaHoming;
	
	
	//Hurting
	sprDeath = spr_KappaDeath;
	sprOmegaFall = spr_KappaHurt;
	sprSpiral = spr_KappaSpiral;
	
	
	//Victory
	sprVictory = spr_KappaVictory;
	
	//Balance
	sprBalanceFor = spr_KappaBalanceForward;
	sprBalanceBack = spr_KappaBalanceBackward;
	
	//Pushing
	sprPush = spr_KappaPush;
}