function scr_SpriteDataSarahNormal() {
	
	///-----Mask Collisions-----///

	//Idle + Look Up + Walk + Run + Jump + Double Jump + Fall + Guard + Stomp + Air Dash + Wall Jump
	idle_Mask = spr_SarahIdleMask;

	//Crouch
	crouch_Mask = spr_SarahCrouchMask;

	//Slide
	slide_Mask = spr_SarahSlideMask;



	///-----Animations-----///

	//Idle Right
	sprIdleRight = spr_SarahIdleRight;
	sprSpecialIdleRight = spr_SarahSpecialIdleRight;
	sprPrepare = spr_SarahPrepare;
	
	//Idle Left
	sprIdleLeft = spr_SarahIdleLeft;
	sprSpecialIdleLeft = spr_SarahSpecialIdleLeft;
	
	//Movement Right
	sprWalkRight = spr_SarahWalkRight;
	sprRunRight = spr_SarahRunRight;
	sprFullSpeedRunRight = spr_SarahFullSpeedRight;
	sprSkidRight = spr_SarahSkidRight;
	
	//Movement Left
	sprWalkLeft = spr_SarahWalkLeft;
	sprRunLeft = spr_SarahRunLeft;
	sprFullSpeedRunLeft = spr_SarahFullSpeedLeft;
	sprSkidLeft = spr_SarahSkidLeft;
	


	//Jumping Right
	sprJumpRight = spr_SarahJumpRight;
	sprDJumpRight = spr_SarahDoubleJumpRight;
	
	//Jumping Left
	sprJumpLeft = spr_SarahJumpLeft;
	sprDJumpLeft = spr_SarahDJumpLeft;
	
	//Hover
	sprHoverRight = spr_SarahDJumpRight;
	sprHoverLeft = spr_SarahDJumpLeft;


	//Falling Right
	sprFallRight = spr_SarahFallRight;
	sprFallingRight = spr_SarahFallingRight;
	sprWallSlideRight = spr_SarahWallClingRight;
	
	//Falling Left
	sprFallLeft = spr_SarahFallLeft;
	sprFallingLeft = spr_SarahFallingLeft;
	sprWallSlideLeft = spr_SarahWallClingLeft;
	
	
	//Look Up & Crouching Right
	sprCrouchRight = spr_SarahCrouchRight;
	sprLook_upRight = spr_SarahLookUpRight;
	
	//Look Up & Crouching Left
	sprCrouchLeft = spr_SarahCrouchLeft;
	sprLook_upLeft = spr_SarahLookUpLeft;



	//Actions Right
	sprSlideRight = spr_SarahSlideRight;
	sprWallJumpRight = spr_SarahWallJumpRight;
	
	//Actions Left
	sprSlideLeft = spr_SarahSlideLeft;
	sprWallJumpLeft = spr_SarahWallJumpLeft;
	
	
	
	//Other Actions
	sprStomping = spr_SarahStomping;
	sprOmegaStomping = spr_SarahOmegaStomping;
	sprStomp = spr_SarahStomped;

	
	//Rail-Grind
	sprRailGrindRight = spr_SarahRailGrindRight;
	sprRailTrick1Right = spr_SarahRailTrick1Right;
	sprRailTrick2Right = spr_SarahRailTrick2Right;
	sprRailTrick3Right = spr_SarahRailTrick3Right;
	
	sprRailGrindLeft = spr_SarahRailGrindLeft;
	sprRailTrick1Left = spr_SarahRailTrick1Left;
	sprRailTrick2Left = spr_SarahRailTrick2Left;
	sprRailTrick3Left = spr_SarahRailTrick3Left;
	
	//Tricks
	sprUpLaunchRight = spr_SarahLauncherUpRight;
	sprSideLaunchRight = spr_SarahLauncherRight;
	
	sprUpLaunchLeft = spr_SarahLauncherUpLeft;
	sprSideLaunchLeft = spr_SarahLauncherLeft;
	
	
	sprRailJumpRight = spr_SarahDJumpRight;
	sprRailJumpLeft = spr_SarahDJumpLeft;
	
	sprTrickUpPreRight = spr_SarahTrickUpPreRight;
	sprTrickUpRight = spr_SarahTrickUpRight;
	
	sprTrickUpPreLeft = spr_SarahTrickUpPreLeft;
	sprTrickUpLeft = spr_SarahTrickUpLeft;
	
	sprTrickRightPre = spr_SarahTrickRightPre;
	sprTrickRight = spr_SarahTrickRight;
	
	sprTrickLeftPre = spr_SarahTrickLeftPre;
	sprTrickLeft = spr_SarahTrickLeft;
	
	sprTrick1Right = spr_SarahTrick1Right;
	sprTrick2Right = spr_SarahTrick2Right;
	sprTrick3Right = spr_SarahTrick3Right;
	sprTrick3FinRight = spr_SarahTrick3FinRight;
	
	sprTrick1Left = spr_SarahTrick1Left;
	sprTrick2Left = spr_SarahTrick2Left;
	sprTrick3Left = spr_SarahTrick3Left;
	sprTrick3FinLeft = spr_SarahTrick3FinLeft;
	
	//Hurt
	sprOmegaFallRight = spr_SarahHurtRight;
	sprOmegaFallLeft = spr_SarahHurtLeft;
	
	sprSpiralRight = spr_SarahSpiralRight;
	sprSpiralLeft = spr_SarahSpiralLeft;
	
	sprDeath = spr_SarahDeath;
	
	//Push
	sprPushRight = spr_SarahPushRight;
	sprPushLeft = spr_SarahPushLeft;
	
	//Balance
	sprBalanceForRight = spr_SarahBalanceForRight;
	sprBalanceBackRight = spr_SarahBalanceBackRight;
	sprBalanceForLeft = spr_SarahBalanceForLeft;
	sprBalanceBackLeft = spr_SarahBalanceBackLeft;
	
	//Special
	sprPullyRight = spr_SarahPullyRight;
	sprPullyLeft = spr_SarahPullyLeft;
	
	//Victory
	sprVictory = spr_SarahVictory;
	
	//Particles
	boostingSprite = spr_SarahBoost;
	boostingSpriteSimple = spr_SarahBoostSimple;
	
	stompingSprite = spr_SarahStompingVFX;
	stompedSprite = spr_SarahStompedVFX;
	
	speedBreakSprite = spr_SarahSpeedBreakVFX;
}