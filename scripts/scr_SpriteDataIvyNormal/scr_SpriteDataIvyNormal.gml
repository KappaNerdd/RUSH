function scr_SpriteDataIvyNormal() {
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_IvyIdleMask;

	//Crouch
	crouch_Mask = spr_IvyCrouchMask;

	//Slide
	slide_Mask = spr_IvySlideMask;



	///-----Animations-----///

	//Idle
	sprIdle = spr_IvyIdle;
	sprSpecialIdle = spr_IvySpecialIdle;
	sprPrepare = spr_IvyPrepareSolo;


	//Movement
	sprWalk = spr_IvyWalk;
	sprRun = spr_IvyRun;
	sprFullSpeedRun = spr_IvyFullSpeedRun;
	sprSkid = spr_IvySkid;


	//Jumping
	sprJump = spr_IvyJump;
	sprDJump = spr_IvyJump;


	//Falling
	sprFall = spr_IvyFall;
	sprFalling = spr_IvyFalling;


	//Look Up & Crouching
	sprCrouch = spr_IvyCrouch;
	sprLook_up = spr_IvyLookUp;


	//Actions
	sprSlide = spr_IvySlide;

	sprPreStomp = spr_IvyPreStomp;
	sprStomping = spr_IvyStomping;
	sprHShooting = spr_IvyHoriShoot;
	sprStomp = spr_IvyStomped;

	sprRailGrind = spr_IvyRailGrind;
	sprRailJump = spr_IvyRailJump;
	
	sprShootGround = spr_IvyShootGround;
	sprShootAir = spr_IvyShootAir;
	
	
	//Tricking
	sprTrickUpPre = spr_IvyTrickUpPre;
	sprTrickUp = spr_IvyTrickUp;
	
	sprTrickSidePre = spr_IvyTrickRightPre;
	sprTrickSide = spr_IvyTrickRight;
	
	sprTrick1 = spr_IvyTrick1;
	sprTrick2 = spr_IvyTrick2;
	sprTrick3 = spr_IvyTrick3Fin;
	sprTrick3Fin = spr_IvyTrick3Fin;
	
	//Hurt
	sprOmegaFall = spr_IvyHurt;
	sprDeath = spr_IvyDeath;
	
	//Special
	sprPully = spr_IvyPully;
	
	//Particles
	boostingSprite = spr_IvyBoost;
	boostingSpriteSimple = spr_IvyBoostSimple;
	
	stompingSprite = spr_IvyStompingVFX;
	stompedSprite = spr_IvyStompedVFX;
	
	speedBreakSprite = spr_IvySpeedBreakVFX;
}