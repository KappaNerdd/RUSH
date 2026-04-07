function scr_BasicVariablesSpeedCreate() {
	#region //Health Checks
		scr_HealthSystemCreate();
	#endregion
	
	#region //Ground Checks
		ground = false;
		stompedCheck = false;
		isSlope = false;
		railGrindCheck = false;
		downSlopeSemiSolid = noone;
		
		footStepTimer = 1;
		footStepFrames = 40;
		footStep = "hard";
		
		myFloorPlat = noone;
		movePlatVel = 0;
		movePlatYspd = 0;
		
		extraXscale = 1;
		
		coyoteJumpTimer = 0;
		coyoteJumpFrames = 5;
		
		fallVel = false;
	#endregion
	
	#region //Movement Checks
		can_Move = true;
		can_MoveFULL = true;
		noMoveTimer = 0;
		
		left_Key = false;
		left_Key_Once = false;
	
		right_Key = false;
		right_Key_Once = false;
	
		up_Key = false;
		up_Key_Once = false;
		
		down_Key = false;
		down_Key_Once = false;
		
		jump_Key = false;
		jump_Key_Held = false;
		jump_Key_Released = false;
		
		action_Key = false;
		action_Key_Held = false;
		action_Key_Released = false;
		
		action1_Key = false;
		action1_Key_Held = false;
		action1_Key_Released = false;
		
		action2_Key = false;
		action2_Key_Held = false;
		action2_Key_Released = false;
		
		action3_Key = false;
		action3_Key_Held = false;
		action3_Key_Released = false;
	
		action4_Key = false;
		action4_Key_Held = false;
		action4_Key_Released = false;
	
		pause_Key = false;
	
		select_Key = false;
		select_Key_Held = false;
	#endregion
	
	#region //Prepares
		prepare = false;
	#endregion

	#region //Special Idles
		specialIdle = false;
		specialIdleTimer = 300;
		specialIdleFrames = 300;
	#endregion

	#region //Jumping Checks
		jumping = false;
		dJumping = false;
		noDJumping = false;
		realJumping = false;
		
		jumpinTimer = 2;
		
		scr_jumpKeyBuffering();
	#endregion

	#region //Look Up/Duckings
		ducking = false;
		look_up = false;
	#endregion

	#region //Extras
		vel = 0;
		yspd = 0;
		drawAngle = 0;
		slowSkid = false;
		slow_Down = false;
		falling = false;
		skid = false;
		sliding = false;
		face_Left = false;
		visXScale = 1;
		
		mask_index = idle_Mask;
		
		localPlayerID = 0;
	#endregion
	
	#region //Some Extra Bullshits
		if instance_exists(obj_RoomTransitionBasicStage) {
			x = obj_RoomTransitionBasicStage.target_x;
			y = obj_RoomTransitionBasicStage.target_y;
		} else if instance_exists(obj_RoomTransitionBasicStage) {
			x = obj_RoomTransitionBasic.target_x;
			y = obj_RoomTransitionBasic.target_y;
		}	

		createTimer = 15;
	#endregion

	#region //Starting Frame for Animations
		image_index = 0;
		mask_index = idle_Mask;
	#endregion

	#region //Angles
		scr_AngleShitCreate();
	#endregion

	#region //Jump Key Bufferings
		scr_jumpKeyBuffering();
	#endregion

	#region //Wall-Jumps
		scr_WallClingCreate();
	#endregion

	#region //Rail-Grinds
		scr_RailGrindCreate();
	#endregion

	#region //Speed-Breaks
		scr_SpeedBreakCreate();
	#endregion

	#region //Boosts
		scr_BoostCreate();
	#endregion

	#region //Tricks
		scr_AirTricksCreate();
	#endregion

	#region //Rush Mode Colors
		scr_RushModeColorCreate();
	#endregion
	
	#region //Furry Checks
		//State
		state = noone;
		
		spd_wgrav = dcc; //Maximal speed loss when wallrunning or ceilrunning
		spd_wfall = 4; //Speed where you fall off a wall/ceiling
		wall_accf = true; //Whether walls factor into your lateral acceleration
		ang_flat = 30; //How steep inclines can be without triggering wall slowdown/fall

		normal_direction = 90; //Direction away from current surface, depends on groundangle but is a separate variable for convenience.

		//Collision checking
		collision_width = 14; //How wide the player is when checking for terrain collisions (this is the distance to each side, so the player is actually twice as wide overall)
		collision_height = 24; //How tall the player is when checking for terrain collisions
		collision_angle_step = 2; //Precision of how much the player can follow the ground
		collision_angle_deltamax = 30; //How sharp turns the player is allowed to follow in one step

		//Drawing variables
		target_angle = 0; //Angle player SHOULD be at, used for gradual rotation
		angle_step_g = 16; //Speed the angle changes at (ground)
		angle_step_a = 8; //Speed the angle changes at (midair)
	#endregion
	
	#region //Astral Checks
		landing = false;
	
		xDirection = 1;
		xMinSpeedToFall = 4;
		wallJumpTimer = 0;

		//Terrain
		terrainLayer = 0;
		terrainVel = 0;
		onPlatform = false;
		pushingWall = false;

		angle = 0;
		angleHolder = 0;
		angleCos = 0;
		angleSin = 0;
		angleMode = 0;

		//Sensors
		sensorX = x;
		sensorY = y;
		sensorCos = dcos(angle);
		sensorSin = dsin(angle);
		drawSensors = false;

		//Sensor position
		sensorMainYDist = 0;

		sensorLeftDistance = 8;
		sensorRightDistance = 6;
		
		sensorSideYDist = 8;

		sensorBottomDistance = 10;
		sensorTopDistance = 28;

		sensorMidDistance = 0;

		bottomCollision = false;
		edgeCollision = false;
		
		leftEdge = false;
		rightEdge = false;
	#endregion
	
	#region //Whoops, sorry about that.
		whoopsTimer = 150;
		whoopsFrames = 150;
	#endregion
}

function scr_BasicControlsSpeedStep1() {
	#region //General Controls
		if can_Move {
			//getCharacterControls();
			
			if instance_exists(obj_StageTrackerSpeed) {
				var _recorder = instance_find(obj_InputRecorder, 0);

				if _recorder != noone && !_recorder.isPlaying {
					getCharacterControls();
					
					_recorder.input[eKey.LeftPressed] = left_Key;
					_recorder.input[eKey.RightPressed] = right_Key;
					_recorder.input[eKey.UpPressed] = up_Key;
					_recorder.input[eKey.DownPressed] = down_Key;
					_recorder.input[eKey.LeftReleased] = !left_Key;
					_recorder.input[eKey.RightReleased] = !right_Key;
					_recorder.input[eKey.UpReleased] = !up_Key;
					_recorder.input[eKey.DownReleased] = !down_Key;

					_recorder.input[eKey.JumpPressed] = jump_Key;
					_recorder.input[eKey.JumpHeld] = jump_Key_Held;
					_recorder.input[eKey.JumpReleased] = jump_Key_Released;

					_recorder.input[eKey.ActionPressed] = action_Key;
					_recorder.input[eKey.ActionHeld] = action_Key_Held;
					_recorder.input[eKey.ActionReleased] = action_Key_Released;

					_recorder.input[eKey.BoostPressed] = action1_Key;
					_recorder.input[eKey.BoostHeld] = action1_Key_Held;
					_recorder.input[eKey.BoostReleased] = action1_Key_Released;

					_recorder.input[eKey.SwapPressed] = action3_Key_Held;

					_recorder.input[eKey.Special1Pressed] = action2_Key;
					_recorder.input[eKey.Special1Held] = action2_Key_Held;
					_recorder.input[eKey.Special1Released] = action2_Key_Released

					_recorder.input[eKey.Special2Pressed] = action4_Key;
				}
			} else {
				getCharacterControls();
			}
		} else {
			if instance_exists(obj_SonicRushIntroCard) {
				var _recorder = instance_find(obj_InputRecorder, 0);

				if _recorder != noone {
					if !_recorder.isPlaying {
						jump_Key = keyboard_check_pressed(global.JumpKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.JumpButtonSpeed);
					}
					
					jump_Key = clamp(jump_Key, 0, 1);
					_recorder.input[eKey.JumpPressed] = jump_Key;
				}
			}
			
			/*left_Key = false;
			left_Key_Once = false;
	
			right_Key = false;
			right_Key_Once = false;
	
			up_Key = false;
			up_Key_Once = false;
		
			down_Key = false;
			down_Key_Once = false;
		
			jump_Key = false;
			jump_Key_Held = false;
		
			action_Key = false;
			action_Key_Held = false;
			action_Key_Released = false;
		
			action1_Key = false;
			action1_Key_Held = false;
		
			action2_Key = false;
			action2_Key_Held = false;
			action2_Key_Released = false;
		
			action3_Key = false;
			action3_Key_Held = false;
	
			action4_Key = false;
			action4_Key_Held = false;
	
			pause_Key = false;
	
			select_Key = false;
			select_Key_Held = false;*/
		}
		
		scr_JumpKeyBufferingStep();
		
		if !ground {
			myFloorPlat = noone;
		}
	#endregion
	
	#region //Extra Bullshit (Again)
		if room == rm_HeadSpeedBoss {
			if createTimer > 0 {
				createTimer -= 1;
			
				left_Key = true;
			}
		}
		
		if !stomped {
			stompedCheck = false;
		}
		
		if abs(vel) < acc {
			noMoveTimer = 0;
		}
		
		if stomped && drawAngle != 0 {
			stomped = false;
		}
		
		if ground {
			gravTimer = 0;
		}
		
		if yspd >= termVel {
			fallVel = true;
		}
		
		if ground && fallVel && !place_meeting(x, y + yspd, obj_BreakableFloor) {
			fallVel = true;
		}
		
		if yspd < termVel or playerHurt {
			fallVel = false;
		}
	#endregion
	
	#region //Angles
		scr_AngleShitBeginStep();
		scr_AngleShitStep();
	#endregion
	
	#region //Spawn Action 3 Key
		if !instance_exists(obj_Spacebar) {
			instance_create_depth(x, y, obj_Player.depth - 100, obj_Spacebar);
		}
	#endregion

	#region //Ceiling Detection
		scr_CeilingDetect();
		scr_FootSteps(footStep);
	#endregion
	
	#region //Run Fast Particles
		if abs(vel) >= full_Speed && ground && global.Particles {
			instance_create_depth(x + angleSin * 10, y + angleCos * 10, depth + 1, obj_BoostParticles);
		}
	#endregion
	
	#region //Whoops, sorry about that.
		if (x < 0 or x > room_width or y > room_height) && !global.Death && can_Move && can_MoveFULL {
			if whoopsTimer > 0 {
				whoopsTimer--;
			} else {
				whoopsTimer = whoopsFrames;
				x = global.RespawnX;
				y = global.RespawnY;
				instance_create_depth(x, y, depth, obj_Whoops);
			}
		} else {
			whoopsTimer = whoopsFrames;
		}
	#endregion
}

function scr_BasicControlsSpeedStep2() {
	#region //Deceleration
		scr_Deceleration();
	#endregion
		
	#region //X Collision
		scr_XCollision();
	#endregion

	#region //Crouching
		if down_Key && ground && !look_up && !stomping && !prepare && !railGrind && abs(vel) < acc && !sliding && !stomped {
		    if !ducking {
				image_index = 0;
				obj_SFXManager.block = true;
			}
			
			groundSpeed = 0;
			ducking = true;
			mask_index = crouch_Mask;
		} else {
			ducking = false;
		}
	#endregion
	
	#region //Looking up
		if ground && !prepare && !railGrind && abs(vel) < acc && !stomped && !ducking && up_Key {
			if !look_up {
				image_index = 0;
			}
			
			look_up = true;
			vel = 0;
		} else {
			look_up = false;
		}
	#endregion
	
	#region //Speed limit
		scr_SpeedLimit();
	#endregion
		
	#region //Change Draw Angle
		//scr_ChangeDrawAngle();
	#endregion
		
	#region //Fuck with momentum
		//scr_SlopeMomentum();
	#endregion
}

function scr_BasicControlsSpeedStep3() {
	#region //Y Collision
		scr_YCollision();
	#endregion
		
	#region //Special Idle
		if ground && !pushingWall && leftEdge && rightEdge && !railGrind && abs(vel) < acc && !railGrind && !stomped && !look_up && !ducking && !prepare && can_Move && can_MoveFULL {
			if specialIdleTimer > 0 {
				specialIdleTimer -= 1;
			}
			
			if specialIdleTimer <= 0 {
				specialIdleTimer = 0;
				specialIdle = true;
			}
		} else {
			specialIdleTimer = specialIdleFrames;
			specialIdle = false;
		}
		
		if specialIdleTimer <= 0 {
			specialIdle = true;
		}
		
		if specialIdleTimer <= 3 && specialIdleTimer > 0 {
			image_index = 0;
		}
	#endregion
}

function scr_BasicControlsSpeedStep4() {
	#region //Wall-Jump TermVel
		if !wallJump && !onWall {
			termVel = normalTermVel;
		}
	#endregion
	
	#region //Rail-Grinding
		scr_RailGrindingStep();
	#endregion

	#region //Speed-Break
		scr_SpeedBreakStep();
	#endregion

	#region //Boost
		scr_BoostingStep();
	#endregion

	#region //Tricking
		scr_AirTricksStep();
	#endregion

	#region //Rush Mode
		scr_RushMode();
	#endregion
	
	#region //Stomp-Railgrind
		if railGrind {
			stomping = false;
			stomped = false;
		}
	#endregion

	#region //Level Tracker Alpha
		if place_meeting(x, y, obj_LevelDoorHead) && global.Opacity < 1 {
			global.Opacity += 0.05;
		} else if !place_meeting(x, y, obj_LevelDoorHead) && global.Opacity > 0 {
			global.Opacity += -0.05;
		}
	#endregion
}

function scr_BasicControlsSpeedStep5() {
	#region //Slide-Cancel
		if action2_Key && !collide && sliding && vel != 0 {
			sliding = false;
		}
	#endregion
}

function scr_BasicVisualEffectsSpeed1() {
	#region //Skidding & Sliding
		if slowSkid or sliding {
			scr_DustParticles();
		}
	#endregion
			
	#region //Speed Break
		if speedBreak {
			if ground {
				scr_SpeedBreakVFX(speedBreakSprite);
			} else {
				speedBreakSprTimer = 1;
			}
		} else {
			speedBreakSprTimer = 1;
		}
	#endregion

	#region //Stomping
		scr_StompVFX();
	#endregion

	#region //Stomping Screen Shake
		if stomping {
			scr_ScreenShake();
			scr_ControllerRumble();
		}
	#endregion

	#region //Stomped
		//scr_StompedVFX();
	#endregion

	#region //Stomped Screen Shake
		if stomped {
			scr_ScreenShake(0.75);
			scr_ControllerRumble(0.5)
		}
	#endregion
	
	#region //Rail-Grind Sparks
		if railGrind && ground {
			railGrindSprFrames += rgAnim;
			
			if railGrindSprFrames >= 4 {
				railGrindSprFrames = 0;
			}
		} else {
			railGrindSprFrames = 0;
		}
	#endregion
	
	#region //Wall-Jump
		if wallJump && place_meeting(x + 1, y, obj_Solid) {
			scr_DustParticles();
		} else if wallJump && place_meeting(x - 1, y, obj_Solid) {
			scr_DustParticles(-18);
		}
	#endregion
		
	#region //Skidding
		if skid {
			scr_DustParticles();
		}
	#endregion
	
}


//---Moves---//

//Sliding
function scr_SlidingSpeed() {
	if abs(vel) > 2 && ground && !ducking && !sliding && !railGrind && !railGrindCrouch && down_Key {
	    sliding = true;
		slowSkid = false;
		mask_index = slide_Mask;
		ducking = false;
	
		//Sound Effect
		if self != obj_RushOverworld {
			obj_SFXManager.slideSound = true;
		} else {
			obj_SFXManager.spindashRev = true;
		}
	}

	if sliding {
		slow_Down = true;
		ducking = false;
	} else {
		slow_Down = false;
	}

	if sliding && (!ground or abs(vel) <= acc) {
	    sliding = false;
	}
}

function scr_StartSlideSpeed() {
	//Slide while Ducking
	if jump_Key && ducking && !sliding && abs(vel) < acc {
		sliding = true;
		ducking = false;
		down_Key = false;
		image_index = 0;
		image_speed = 1;
		mask_index = slide_Mask;
	
		//Sound Effect
		obj_SFXManager.slideSound = true;
	
		if !leftFacer {
			vel = (max_Speed / 1.5) * visXScale;
		} else {
			if face_Left {
				vel = -max_Speed / 1.5;
			} else {
				vel = max_Speed / 1.5;
			}
		}
	}
}
	
function scr_FootSteps(_type = "hard") {
	if global.Footstep {
		if ground && vel != 0 && !sliding && !railGrind {
			if ceil(image_index) == 3 or ceil(image_index) == 7 {
				if footStepTimer <= 0 {
					if leftFacer {
						if sprite_index != sprIdleRight && sprite_index != sprIdleLeft {
							if _type == "grass" {
								obj_SFXManager.footStepGrass = true;
							} else {
								obj_SFXManager.footStepHard = true;
							}
				
							footStepTimer = 3;
						}
					} else {
						if sprite_index != sprIdle {
							if _type == "grass" {
								obj_SFXManager.footStepGrass = true;
							} else {
								obj_SFXManager.footStepHard = true;
							}
				
							footStepTimer = 3;
						}
					}
				}
			} else {
				footStepTimer = 0;
			}
		}
	}
}
	
//Animations
function scr_GeneralAnimationsSpeed() {		
	#region //Sliding
		var _speed = vel;
	
		if sliding {
			if !leftFacer {
				sprite_index = sprSlide;
			} else {
				if face_Left {
					sprite_index = sprSlideLeft;
				} else {
					sprite_index = sprSlideRight;
				}
			}
				
			if abs(_speed) < max_Speed / 6 {
				image_speed = 1;
			} else if abs(_speed) >= max_Speed / 6 && abs(_speed) < max_Speed / 3 {
				image_speed = 1.5;
			} else if abs(_speed) >= max_Speed / 3 && abs(_speed) < max_Speed / 1.5 {
				image_speed = 2;
			} else if abs(_speed) >= max_Speed / 1.5 && abs(_speed) < max_Speed / 1.3 {
				image_speed = 2.5;
			} else if abs(_speed) >= max_Speed / 1.3 && abs(_speed) < max_Speed {
				image_speed = 3;
			} else if abs(_speed) >= max_Speed {
				image_speed = 4;
			}
							
			mask_index = slide_Mask;
		}
	#endregion
		
	#region //Rail-Grind
		if railGrind {
			if railTrickUno {
				if !leftFacer {
					sprite_index = sprRailTrick1;
				} else {
					if face_Left {
						sprite_index = sprRailTrick1Left;
					} else {
						sprite_index = sprRailTrick1Right;
					}
				}
				
				image_speed = 1.5;
				
				if floor(image_index) >= image_number - 1 {
					image_index = image_number - 3;
				}
			} else if railTrickDos {
				if !leftFacer {
					sprite_index = sprRailTrick2;
				} else {
					if face_Left {
						sprite_index = sprRailTrick2Left;
					} else {
						sprite_index = sprRailTrick2Right;
					}
				}
				
				image_speed = 1.5;
				
				if floor(image_index) >= image_number - 1 {
					image_index = image_number - 3;
				}
			} else if railTrickTres {
				if !leftFacer {
					sprite_index = sprRailTrick3;
				} else {
					if face_Left {
						sprite_index = sprRailTrick3Left;
					} else {
						sprite_index = sprRailTrick3Right;
					}
				}
				
				image_speed = 1.75;
				
				if floor(image_index) >= image_number - 1 {
					railTrickTres = false;
				}
			} else {
				if !leftFacer {
					sprite_index = sprRailGrind;
				} else {
					if face_Left {
						sprite_index = sprRailGrindLeft;
					} else {
						sprite_index = sprRailGrindRight;
					}
				}
				
				image_speed = 1;
			}
					
			mask_index = idle_Mask;
		}
	#endregion
		
	#region //Tricking
		if (afterRailJump or rampRing) && !rushTrick && !rushTrickFinish && !trick && !upTrick && !rightTrick && !leftTrick && !backTrick && !altTrick {
			if rainbowLaunch {
				if !leftFacer {
					sprite_index = sprRailJump;
				} else {
					if !face_Left {
						sprite_index = sprRailJumpRight;
					} else {
						sprite_index = sprRailJumpLeft;
					}
				}
					
				if !leftFacer {
					image_speed = 1.5;
				} else {
					if face_Left {
						image_speed = -1.5;
					} else {
						image_speed = 1.5;
					}
				}
			} else {
				if upLaunch {
					if !leftFacer {
						sprite_index = sprUpLaunch;
					} else {
						if face_Left {
							sprite_index = sprUpLaunchLeft;
						} else {
							sprite_index = sprUpLaunchRight;
						}
					}
					
					if yspd < 0 {
						if floor(image_index) >= 2 {
							image_index = 0;
						}
					} else {
						if floor(image_index) == image_number - 1 {
							image_index = image_number - 3;
						}
					}
				}
				
				if sideLaunch {
					if !leftFacer {
						sprite_index = sprSideLaunch;
					} else {
						if face_Left {
							sprite_index = sprSideLaunchLeft;
						} else {
							sprite_index = sprSideLaunchRight;
						}
					}
					
					if yspd <= 0 {
						if floor(image_index) >= 2 {
							image_index = 0;
						}
					} else {
						if floor(image_index) == image_number - 1 {
							image_index = image_number - 3;
						}
					}
				}
				
				image_speed = 1;
			}
					
			mask_index = idle_Mask;
		}
	#endregion
			
	#region //Player Hurt/Death	
		if playerHurt {
			if !global.Death {
				if abs(vel) < max_Speed / 1.25 {
					if !leftFacer {
						sprite_index = sprOmegaFall;
					} else {
						if face_Left {
							sprite_index = sprOmegaFallLeft;
						} else {
							sprite_index = sprOmegaFallRight;
						}
					}
				} else {
					if !leftFacer {
						sprite_index = sprSpiral;
					} else {
						if face_Left {
							sprite_index = sprSpiralLeft;
						} else {
							sprite_index = sprSpiralRight;
						}
					}
				}
					
				image_speed = 1;
				mask_index = idle_Mask;
			} else {
				sprite_index = sprDeath;
				image_speed = 1;
				mask_index = idle_Mask;
			}
		}
		
		if global.Death {
			sprite_index = sprDeath;
			image_speed = 1;
			mask_index = idle_Mask;
		}
	#endregion
	
	#region //Pushing
		if ground && pushingWall && !railGrind && !sliding && (left_Key or right_Key) {
			if !leftFacer {
				sprite_index = sprPush;
			} else {
				if face_Left {
					sprite_index = sprPushLeft;
				} else {
					sprite_index = sprPushRight;
				}
			}
			
			image_speed = 1;
			mask_index = idle_Mask;
		}
	#endregion
	
	#region //Balancing
		if ground && vel == 0 && !look_up && !ducking && !railGrind && !stomped {
			if !leftEdge {
				if !leftFacer {
					if visXScale == 1 {
						sprite_index = sprBalanceBack;
					} else if visXScale == -1 {
						sprite_index = sprBalanceFor;
					}
				} else {
					if !face_Left {
						sprite_index = sprBalanceBackLeft;
					} else {
						sprite_index = sprBalanceForLeft;
					}
				}
			}
			
			if !rightEdge {
				if !leftFacer {
					if visXScale == 1 {
						sprite_index = sprBalanceFor;
					} else if visXScale == -1 {
						sprite_index = sprBalanceBack;
					}
				} else {
					if !face_Left {
						sprite_index = sprBalanceForRight;
					} else {
						sprite_index = sprBalanceBackRight;
					}
				}
			}
			
			image_speed = 1;
			mask_index = idle_Mask
		}
	#endregion
}
	
function scr_GroundAnimationSpeed() {
	var _speed = vel;
	
	#region //Ground
		if ground && !ducking && !sliding && !airDash && !stomping && !stomped && !jumping && !railGrind && !railGrindCrouch && !dJumping && !skid && !prepare {
			if abs(_speed) < acc {
				if !leftFacer {
					sprite_index = sprIdle;
				} else {
					if face_Left {
						sprite_index = sprIdleLeft;
					} else {
						sprite_index = sprIdleRight;
					}
				}
					
				image_speed = 1;
			} else {
				if abs(_speed) < max_Speed {
					if !leftFacer {
						sprite_index = sprWalk;
					} else {
						if face_Left {
							sprite_index = sprWalkLeft;
						} else {
							sprite_index = sprWalkRight;
						}
					}
						
					if abs(_speed) < max_Speed / 6 {
						image_speed = 0.25;
					} else if abs(_speed) >= max_Speed / 6 && abs(_speed) < max_Speed / 3 {
						image_speed = 0.5;
					} else if abs(_speed) >= max_Speed / 3 && abs(_speed) < max_Speed / 1.5 {
						image_speed = 1;
					} else if abs(_speed) >= max_Speed / 1.5 && abs(_speed) < max_Speed / 1.3 {
						image_speed = 1.25;
					} else if abs(_speed) >= max_Speed / 1.3 && abs(_speed) < max_Speed {
						image_speed = 1.75;
					}
				} else if abs(_speed) >= max_Speed && abs(groundSpeed) < full_Speed {
					if !leftFacer {
						sprite_index = sprRun;
					} else {
						if face_Left {
							sprite_index = sprRunLeft;
						} else {
							sprite_index = sprRunRight;
						}
					}
						
					if abs(_speed) < max_Speed * 1.5 {
						image_speed = 2;
					} else {
						image_speed = 2.25;
					}
				} else if abs(_speed) >= full_Speed {
					if !leftFacer {
						sprite_index = sprFullSpeedRun;
					} else {
						if face_Left {
							sprite_index = sprFullSpeedRunLeft;
						} else {
							sprite_index = sprFullSpeedRunRight;
						}
					}
						
					image_speed = 2.5;
				}
			}
					
			mask_index = idle_Mask;
		}
	#endregion
}

function scr_OtherAnimationsSpeed() {
	#region //Skid
		if ground && skid {
			if !leftFacer {
				sprite_index = sprSkid;
			} else {
				if face_Left {
					sprite_index = sprSkidLeft;
				} else {
					sprite_index = sprSkidRight;
				}
			}
				
			mask_index = idle_Mask;
			image_speed = 1;
		}
	#endregion
			
	#region //Slowskid
		if slowSkid {
			if !leftFacer {
				sprite_index = sprSkid;
			} else {
				if face_Left {
					sprite_index = sprSkidLeft;
				} else {
					sprite_index = sprSkidRight;
				}
			}
				
			image_speed = 2;
		}
	#endregion
		
	#region //Prepare
		if prepare {
			sprite_index = sprPrepare;
			mask_index = idle_Mask;
			
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
		}
	#endregion
		
	#region //Look Up
		if look_up {
			if !leftFacer {
				sprite_index = sprLook_up;
			} else {
				if face_Left {
					sprite_index = sprLook_upLeft;
				} else {
					sprite_index = sprLook_upRight;
				}
			}
			
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			image_speed = 2;
					
			mask_index = idle_Mask;
		}
	#endregion

	#region //Ducking
		if ducking {
			if !leftFacer {
				sprite_index = sprCrouch;
			} else {
				if face_Left {
					sprite_index = sprCrouchLeft;
				} else {
					sprite_index = sprCrouchRight;
				}
			}
					
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
					
			image_speed = 2;
			mask_index = crouch_Mask;
		}
	#endregion

	#region //Jumping
		if jumping && !dJumping && !playerHurt && !rampRing && !wallJump && !afterRailJump && !railGrind && !trick && yspd < 0 {
			if !leftFacer {
				sprite_index = sprJump;
			} else {
				if face_Left {
					sprite_index = sprJumpLeft;
				} else {
					sprite_index = sprJumpRight;
				}
			}
					
			image_speed = 1;
			mask_index = idle_Mask;
		}
	#endregion
		
}

function scr_WallJumpAnimation() {
	#region //Wall-Jump
		if wallJump && !stomping && !rampRing {
			if !leftFacer {
				sprite_index = sprWallSlide;
			} else {
				if face_Left {
					sprite_index = sprWallSlideLeft;
				} else {
					sprite_index = sprWallSlideRight;
				}
			}
				
			image_speed = 1;
			mask_index = idle_Mask;
		}
	#endregion
}


function scr_HealthSystemCreate() {
	playerHurt = false;
	invincible = false;
	invincibleTimer = 0;
	invincibleFrames = 120;
	invincibleVisibleTimer = 5;
	
	attacking = false;
	megaAttacking = false;
	
	_deathY = -10;
	_deathYspd = 0.3;
	
	collide = false;
	collideTimer = 0;
	collideFrames = 30;
	
	with(instance_create_depth(x, y, depth, obj_PlayerHurtJump)) {
		affectChar = other.id;
	}
}

function scr_HealthSystemStep() {
	if playerHurt {
		//can_Move = false;
	}
	
	if ground && playerHurt && yspd > 0 {
		playerHurt = false;
		//can_Move = true;
	}
	
	if !invincible {
		invincibleTimer = invincibleFrames;
		invincibleVisibleTimer = 5;
		image_alpha = 1;
		visible = true;
	} else {
		if invincibleTimer > 0 && !playerHurt && !global.Death {
			invincibleTimer -= 1;
		}
		
		if invincibleTimer <= 0 {
			invincible = false;
			invincibleTimer = invincibleFrames;
			image_alpha = 1;
			visible = true;
		}
		
		if invincibleTimer > 1 {
			if !global.SimplifyVFX {
				if invincibleVisibleTimer > 0 && !playerHurt && !global.Death {
					invincibleVisibleTimer -= 1;
				}
				
				if invincibleVisibleTimer <= 0 {
					invincibleVisibleTimer = 5;
					
					if visible {
						visible = false;
					} else {
						visible = true;
					}
				}
			} else {
				image_alpha = 0.5;
			}
		} else {
			image_alpha = 1;
		}
	}
	
	
	//Death
	if global.Health < 0 {
		global.Health = 0;
	}
	
	if global.Health <= 0 {
		global.Death = true;
	}
	
	if global.Death {
		if !leftFacer {
			x += 6 * visXScale;
		} else {
			if !face_Left {
				x += 6;
			} else {
				x -= 6;
			}
		}
		
		_deathY += _deathYspd;
		y += _deathY;
	} else {
		_deathY = -10;
	}
}

function scr_StopPlayerHurt() {
	obj_Player.playerHurt = false;
	obj_Player.can_Move = true;
}

function scr_StopCharControls() {
	obj_Player.left_Key = false;
	obj_Player.right_Key = false;
	obj_Player.up_Key = false;
	obj_Player.down_Key = false;
	
	obj_Player.jump_Key_Held = false;
	obj_Player.action_Key_Held = false;
	obj_Player.action1_Key_Held = false;
	obj_Player.action2_Key_Held = false;
}
	
function scr_StopCharControls2() {
	left_Key = false;
	right_Key = false;
	up_Key = false;
	down_Key = false;
	
	jump_Key_Held = false;
	action_Key_Held = false;
	action1_Key_Held = false;
	action2_Key_Held = false;
}

function scr_Deceleration() {
	if noMoveTimer > 0 {
		noMoveTimer--;
	}
	
	if !playerHurt && !prepare && noMoveTimer == 0 {
		if !railGrind && !sliding && !stomped {
			if (groundSpeed > 0 or vel > 0) && !right_Key {
				vel -= dcc / 2;
			} else if (groundSpeed < -2 or vel < -2) && right_Key && !skid {
				if ground {
					vel += dcc * 7;
					slowSkid = true;
				} else {
					vel += dcc;
				}
			} else {
				slowSkid = false;
			}
			
			if (groundSpeed < 0 or vel < 0) && !left_Key {
				vel += dcc / 2;
			} else if (groundSpeed > 2 or vel > 2) && left_Key && !skid {
				if ground {
					vel -= dcc * 7;
					slowSkid = true;
				} else {
					vel -= dcc;
				}
			} else {
				slowSkid = false;
			}
		}
		
		if !ground or railGrind {
			slowSkid = false;
		}
	
		if !ground && !boost {
			if yspd >= -6 && yspd < 0 && abs(vel) > max_Speed {
				if vel > 0 {
					vel -= dcc;
				} else if vel < 0 {
					vel += dcc;
				}
			}
		}
		
		
		if sliding {
			if vel > 0 {
				vel -= dcc / 4;
			} else if vel < 0 {
				vel += dcc / 4;
			}
		}
	
		//Give you a boost if you press SPACE while slowing down
		if slowSkid {
			if left_Key && action2_Key {
				if !speedBreak {
					vel = -max_Speed;
				} else {
					vel = -full_Speed;
				}
				
				obj_SFXManager.airDashSound = true;
			} else if right_Key && action2_Key {
				if !speedBreak {
					vel = max_Speed;
				} else {
					vel = full_Speed;
				}
			
				obj_SFXManager.airDashSound = true;
			}
		}
	}
}

function scr_SpeedLimit() {
	if vel > -acc && vel < acc {
		vel = 0;
	}
 
	if vel >= 40 {
		vel = 40;
	} else if vel <= -40 {
		vel = -40;
	}
}



//Angle Shit
function scr_AngleShitCreate() {
	groundAngle = 0;
	angleChecker = 0;
	winningAngle = 0;
	angleChecked = false;
	
	changingAngle = 0;
	increaseAngle = false;
	decreaseAngle = false;
	
	groundSpeed = 0;
	
	slopeFactor = 0.15;
	slopeFactorSlide = 0.3125;
	
	floorMode = true;
	rightWallMode = false;
	ceilingMode = false;
	leftwallMode = false;
}

function scr_AngleShitBeginStep() {
	if !sliding {
		//groundSpeed -= (slopeFactor + (fric / 2)) * sin(groundAngle);
	} else {
		//groundSpeed -= (slopeFactorSlide + (fric / 2)) * sin(groundAngle);
	}
}

function scr_AngleShitStep() {
	scr_HealthSystemStep();
	
	if jumping {
		if jumpinTimer > 0 {
			jumpinTimer -= 1;
		}
	} else {
		jumpinTimer = 2;
	}
	
	/*var _angleChecker = instance_place(x, y + 5, obj_Solid);

	if ground && instance_exists(_angleChecker) && (_angleChecker.sprite_index != spr_SolidGround or _angleChecker.sprite_index != spr_SolidRail) {
		groundAngle = _angleChecker.floorAngle;
		drawAngle = _angleChecker.angleChecking;
		footStep = _angleChecker.floorType;
	} else {
		groundAngle = 0;
		drawAngle = 0;
	}
	
	
	var _winnerAngle = instance_place(x, y + 20, obj_Solid);
	
	if instance_exists(_winnerAngle) && !ground {
		winningAngle = _winnerAngle.floorAngle;
		footStep = _winnerAngle.floorType;
	} else if !instance_exists(_winnerAngle) {
		winningAngle = 0;
	}
	
	if !ground {
		angleChecked = false;
	}
	
	if ground {
		realJumping = false;
	}
	
	if !place_meeting(x + vel, y + 25, obj_Solid) {
		yspd += vel * -sin(groundAngle);
	}*/
}


//Manipulate jump with slopes
function scr_JumpManipulate() {
	if !playerHurt && !collide {
		realJumping = true;
		railGrind = false;
		railGrindCrouch = false;
		angleChecked = false;
	
		if global.Squash {
			extraXscale = 0.5;
		}
		
		if ground {
			if global.Particles {
				instance_create_depth(x, y + 5, depth, obj_SlideDustVFX);
				instance_create_depth(x + 7, y + 5, depth, obj_SlideDustVFX);
				instance_create_depth(x - 17, y + 5, depth, obj_SlideDustVFX);
				instance_create_depth(x - 24, y + 5, depth, obj_SlideDustVFX);
			}
			
			PlayerJumpAct();
			wallJumpTimer = 5;
			
			//vel -= normalJspd * sin(degtorad(angle));
			//yspd += -(sin(degtorad(angle)) * vel) + (cos(degtorad(angle)) * -normalJspd);
			
			PlayerSetAngle(0);
			
			/*if isSlope or railGrindCheck {
				vel -= normalJspd * sin(degtorad(drawAngle));
				//vel += (cos(degtorad(drawAngle)) * vel) + (sin(degtorad(drawAngle)) * -normalJspd);  
				//yspd -= normalJspd * (cos(degtorad(drawAngle)) * vel);
				yspd += -(sin(degtorad(groundAngle)) * groundSpeed) + (cos(degtorad(groundAngle)) * -normalJspd);
			} else {
				if instance_exists(myFloorPlat) {
					vel += myFloorPlat.vel;
			
					if myFloorPlat.yspd < 0 {
						yspd = -normalJspd + myFloorPlat.yspd / 1.5;
					} else {
						yspd = -normalJspd;
					}
				}
			}*/
		} else {
			yspd = -normalJspd;
		}
	}
	
	image_index = 0;
	
	ground = false;
	jumping = true;
	realJumping = true;
}


//Variable Jumping
function scr_VariableJumping() {
	//Variable Jumping (Jump height influenced by button press)
	if yspd < 0 && realJumping && !jump_Key_Held && !afterRailJump && !rampRing && !playerHurt && !global.Death {
		yspd = max(yspd, -jspd / 4);
	}
}


//Player Movement
function scr_PlayerMoveLeft() {
	if !playerHurt && !prepare && noMoveTimer == 0 {
		if !sliding && !wallJump {
			if leftFacer {
				face_Left = true;
			} else {
				visXScale = -1;
			}
		}
		
		if !speedBreak {
			if vel > -max_Speed {
				vel -= acc;
			}
		} else {
			if !boost {
				if vel > -full_Speed {
					vel -= acc;
				}
			} else {
				if vel > -boost_Speed {
					vel -= acc;
				}
			}
		}
	}
	
	
	//scr_PlayerInputGrounds();
	//scr_PlayerInputAerial();
}

function scr_PlayerMoveRight() {
	if !playerHurt && !prepare && noMoveTimer == 0 {
		if !sliding && !wallJump {
			if leftFacer {
				face_Left = false;
			} else {
				visXScale = 1;
			}
		}
		
		if !speedBreak {
			if vel < max_Speed {
				vel += acc;
			}
		} else {
			if !boost {
				if vel < full_Speed {
					vel += acc;
				}
			} else {
				if vel < boost_Speed {
					vel += acc;
				}
			}
		}
	}
	
	
	//scr_PlayerInputGrounds();
	//scr_PlayerInputAerial();
}