///-----Speed-Break Mode-----///
function scr_SpeedBreakCreate() {
	speedBreak = false;
	speedBreakTimer = 240;
	speedBreakFrames = 240;
	
	stopSpeedTimer = 10;
	stopSpeedFrames = 10;
	
	railGrindCrouch = false;
}

function scr_SpeedBreakStep() {
	if abs(vel) >= max_Speed && !speedBreak {
		if speedBreakTimer > 0 {
			speedBreakTimer -= 1;
		}
	
		if speedBreakTimer <= 0 && ground {
			scr_StopCamMove();
			scr_ControllerRumble();
			speedBreak = true;
			
			if vel > 0 {
				vel += 2;
			} else if vel < 0 {
				vel -= 2;
			}
			
			if sonicRush {
				obj_SFXManager.breakSonic = true;
			} else if blazeRush {
				obj_SFXManager.breakBlaze = true;
			}
		}
	} else if abs(vel) < max_Speed && !speedBreak && ground && !stomping && !stomped {
		speedBreakTimer = 240;
	}

	if abs(vel) < max_Speed / 2 && ground && !stomping && !stomped && speedBreak {
		if stopSpeedTimer > 0 {
			stopSpeedTimer--;
		} else {
			speedBreak = false;
			speedBreakTimer = 240;
			obj_SFXManager.UNDERTALEBombFly = true;
		}
	}
	
	if !speedBreak && !boost {
		stopSpeedTimer = stopSpeedFrames;
	}
}


///-----Boost-----///
function scr_BoostCreate() {
	boost = false;
	airBoost = false;
	airBoosting = false;
	boostEnergy = 100;
	maxBoostEnergy = 300;
	
	initiateBoost = false;
	
	stealBoost = false;
	boostStealer = 0;
	normalBoostSteal = 1;
	omegaBoostSteal = 200;
	
	camShakeTimer = 0;
	camShakeFrames = 45;
	
	rushMode = false;
	rushModeTimer = 360;
	rushModeFrames = 360;
	rushModeLose = false;
	
	enemyCombo = 0;
	enemyComboTimer = 0;
	enemyComboFrames = 300;
	
	normalAcc = acc;
	
	instance_create_depth(0, -100000000, depth, obj_BoostMeter);
	instance_create_depth(0, -100000000, depth, obj_EnemyComboCounterSpeed);
}

function scr_BoostingStep() {
	if enemyComboTimer > 0 && enemyCombo > 0 {
		enemyComboTimer -= 1;
	}
	
	if enemyComboTimer <= 0 {
		with(obj_EnemyComboCounterSpeed) {
			if !createBonus {
				createBonus = true;
				scr_BonusPoints((500 * other.enemyCombo) * mult);
				other.enemyCombo = 0;
			}
		}
	}
	
	
	if boostEnergy <= 0 {
		boostEnergy = 0;
	}
	
	if boostEnergy > maxBoostEnergy {
		boostEnergy = maxBoostEnergy;
	}
	
	if rushModeTimer >= rushModeFrames {
		rushModeTimer = rushModeFrames;
	}
	
	//Restart Air Boost when hitting the ground
	if ground {
		airBoost = false;
	}
	
	if rushMode {
		boostEnergy = maxBoostEnergy;
	}
	
	if initiateBoost {
		initiateBoost = false;
	}
	
	//Activate Boost
	if (action1_Key) && !playerHurt && !instance_exists(obj_CutsceneParent) && can_MoveFULL && !airBoost && !global.Death && boostEnergy > 0 && !prepare {
		boost = true;
		initiateBoost = true;
		speedBreak = true;
		scr_StopCamMove();
		slowSkid = false;
		
		if stomped {
			stomped = false;
		}
		
		if ducking {
			sliding = true;
			ducking = false;
		}
		
		if down_Key && ground && !railGrind && abs(vel) < normalAcc {
			sliding = true;
		}
		
		if !ground && !airBoost {
			yspd = 0;
			airBoost = true;
			gravTimer = 7;
			event_user(4);
			image_index = 0;
			
			if !rushMode {
				boostEnergy -= 25;
			}
			
			rampRing = false;
			afterRailJump = false;
			trick = false;
			altTrick = true;
			leftTrick = false;
			rushTrick = false;
			rushTrickFinish = false;
			altFinish = false;
			backTrick = false;
			rightTrick = false;
			upTrick = false;
			altTrickTimer = altTrickFrames;
			preTrickTimer = preTrickFrames;
			rushTrickBufferTimer = 0;
			rushTrickFinaleBufferTimer = 0;
			rushTrickCombo = 0;
			rushTrickTimer = 0;
		}
		
		if !rushMode && ground {
			boostEnergy -= 10;
		}
		
		if !left_Key && !right_Key {
			if leftFacer {
				if face_Left {
					if vel > -boost_Speed {
						vel = -boost_Speed;
					}

					scr_RushBoostBreakVFX(-40);
				} else {
					if vel < boost_Speed {
						vel = boost_Speed;
					}
				
					scr_RushBoostBreakVFX(40);
				}
			} else {
				if visXScale == -1 {
					if vel > -boost_Speed {
						vel = -boost_Speed;
					}
				
					scr_RushBoostBreakVFX(-40);
				} else {
					if vel < boost_Speed {
						vel = boost_Speed;
					}
				
					scr_RushBoostBreakVFX(40);
				}
			}
		} else if left_Key {
			if vel > -boost_Speed {
				vel = -boost_Speed;
			}

			scr_RushBoostBreakVFX(-40);
		} else if right_Key {
			if vel < boost_Speed {
				vel = boost_Speed;
			}
				
			scr_RushBoostBreakVFX(40);
		} else if right_Key && left_Key {
			if leftFacer {
				if face_Left {
					if vel > -boost_Speed {
						vel = -boost_Speed;
					}
				
					scr_RushBoostBreakVFX(-40);
				} else {
					if vel < boost_Speed {
						vel = boost_Speed;
					}
				
					scr_RushBoostBreakVFX(40);
				}
			} else {
				if visXScale == -1 {
					if vel > -boost_Speed {
						vel = -boost_Speed;
					}
				
					scr_RushBoostBreakVFX(-40);
				} else {
					if vel < boost_Speed {
						vel = boost_Speed;
					}
				
					scr_RushBoostBreakVFX(40);
				}
			}
		}
		
		if sonicRush {
			obj_SFXManager.sonicRush = true;
		} else if blazeRush {
			obj_SFXManager.blazeRush = true;
		}
	}
	
	//Keep Boost
	if boost && (action1_Key_Held) && boostEnergy > 0 && can_MoveFULL && !global.Death {
		if !speedBreak {
			speedBreak = true;
		}
		
		if camShakeTimer > 0 {
			camShakeTimer -= 1;
			scr_ControllerRumble(0.5);
			scr_ScreenShake(0.75)
		}
		
		if !rushMode {
			boostEnergy -= 0.5;
		}
		
		if abs(vel) < max_Speed / 2 && ground && !stomping && !stomped {
			if stopSpeedTimer <= 0 {
				boost = false;
			}
		}
	} else if !(action1_Key_Held) or boostEnergy == 0 {
		boost = false;
		
		if vel > 0 {
			if vel == boost_Speed {
				vel = full_Speed;
			}
		} else if vel < 0 {
			if vel == -boost_Speed {
				vel = -full_Speed;
			}
		}
	}
	
	if !boost {
		camShakeTimer = camShakeFrames;
		acc = normalAcc;
	} else {
		acc = normalAcc * 3;
	}
}



//Air Tricks
function scr_AirTricksCreate() {
	scr_RailTricksCreate();
	
	upLaunch = false;
	sideLaunch = false;
	rainbowLaunch = false;
	
	rampRing = false;

	beforeTrick = false;
	
	preTrickTimer = 0;
	preTrickFrames = 3;

	trick = false;
	altTrick = false;
	altTrickTimer = 0;
	altTrickFrames = 10;
	
	trickWait = 0;
	trickTimer = 30;

	rightTrick = false;
	leftTrick = false;

	sideTrickTimer = 0;
	sideTrickFrames = 10;

	upTrick = false;
	upTrickTimer = 0;
	upTrickFrames = 20;
	
	backTrick = false;
	backTrickTimer = 0;
	backTrickFrames = 10;
	
	rushTrick = false;
	randomTrick = 0;
	
	rushTrickTimer = 0;
	rushTrickFrames = 22;
	
	rushTrickFinish = false;
	rushTrickFinishTimer = 0;
	rushTrickFinishFrames = 1;
	
	getScore = false;
	rushTrickScore = 0;
	
	altFinish = false;
	
	rushTrickCombo = 0;
}

function scr_AirTricksStep() {
	scr_RailTricksStep();
	
	if trickWait > 0 {
		trickWait -= 1;
	}
	
	if trick or altTrick {
		if altTrickTimer > 0 {
			altTrickTimer--;
		}
	}
	
	if rushTrickTimer > 0 {
		rushTrickTimer -= 1;
	}
	
	if !afterRailJump && !rampRing {
		rushTrick = false;
		rushTrickTimer = 0;
		altFinish = false;
	
		rushTrickFinish = false;
		rushTrickFinishTimer = 0;
		rushTrickFinishFrames = 1;
	
		rushTrickCombo = 0;
		
		upLaunch = false;
		sideLaunch = false;
		rainbowLaunch = false;
	}
	
	if !leftFacer {
		if rushTrick && !rushTrickFinish {
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			if randomTrick == 0 {
				sprite_index = sprTrick1;
			} else if randomTrick == 1 {
				sprite_index = sprTrick2;
			} else if randomTrick == 2 {
				sprite_index = sprTrick3;
			}
			
			image_speed = 2;
		} else if rushTrick && rushTrickFinish {
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			sprite_index = sprTrick3Fin;
			
			image_speed = 2;
		} else if rushTrickFinish {
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			sprite_index = sprTrick3Fin;
			
			image_speed = 2;
		}
	} else {
		if rushTrick && !rushTrickFinish {
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			image_speed = 2;
			
			if randomTrick == 0 {
				if !face_Left {
					sprite_index = sprTrick1Right;
				} else {
					sprite_index = sprTrick1Left;
				}
			} else if randomTrick == 1 {
				if !face_Left {
					sprite_index = sprTrick2Right;
				} else {
					sprite_index = sprTrick2Left;
				}
			} else if randomTrick == 2 {
				if !face_Left {
					sprite_index = sprTrick3Right;
				} else {
					sprite_index = sprTrick3Left;
				}
			}
		} else if rushTrick && rushTrickFinish {
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			image_speed = 2;
			
			if !face_Left {
				sprite_index = sprTrick3FinRight;
			} else {
				sprite_index = sprTrick3FinLeft;
			}
		} else if rushTrickFinish {
			if floor(image_index) >= image_number - 1 {
				image_index = image_number - 1;
			}
			
			image_speed = 2;
			
			if !face_Left {
				sprite_index = sprTrick3FinRight;
			} else {
				sprite_index = sprTrick3FinLeft;
			}
		}
	}
	
	if rampRing or afterRailJump {
		if jump_Key {
			if !place_meeting(x, y, obj_RailTrickColl) && !place_meeting(x, y + 10, obj_Ramp) {
				rushTrickBufferTimer = rushTrickTime;
			}
		}
	
		if rushTrickBufferTimer > 0 {
			rushTrickBufferTimer--;
			rushTrickBuffered = true;
		} else {
			rushTrickBuffered = false;
		}
	
		if action_Key {
			rushTrickFinaleBufferTimer = rushTrickTime;
		}
	
		if rushTrickFinaleBufferTimer > 0 {
			rushTrickFinaleBufferTimer--;
			rushTrickFinaleBuffered = true;
		} else {
			rushTrickFinaleBuffered = false;
		}
	} else {
		rushTrickBuffered = false;
		rushTrickBufferTimer = 0;
		
		rushTrickFinaleBuffered = false;
		rushTrickFinaleBufferTimer = 0;
	}
	
	if !afterRailJump && !rampRing {
		randomTrick = -1;
	}
	
	if afterRailJump or rampRing {
		if rushTrickBuffered && rushTrickTimer == 0 && !rushTrickFinish && !place_meeting(x, y, obj_RailTrickColl) {
			boostEnergy += 10;
			rushTrick = true;
			scr_ControllerRumble();
			
			if rushTrickCombo <= 1 {
				if getScore {
					rushTrickScore += 200;
					obj_TrickScore.trickScore = 0;
					scr_GivePoints(200);
				}
			} else {
				if getScore {
					rushTrickScore += (100 * rushTrickCombo);
					scr_GivePoints(100 * rushTrickCombo);
				}
			}
			
			obj_TrickScore.comboY = obj_TrickScore.comboYStart;
			obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
			
			if altFinish {
				altFinish = false;
				rushTrickCombo = 0;
			}
			
			if rushTrickCombo < 1 {
				instance_create_depth(-1000000, 0, 0, obj_TrickCombo);
				rushTrickCombo = 1;
			} else {
				rushTrickCombo += 1;
			}
			
			if instance_exists(obj_TrickCombo) {
				with(obj_TrickCombo) {
					if !died && !completed {
						numberScale = 1;
					}
				}
			}
			
			leftTrick = false;
			rightTrick = false;
			upTrick = false;
			backTrick = false;
			altFinish = false;
			
			if randomTrick < 2 {
				randomTrick++;
			} else {
				randomTrick = 0;
			}
			
			image_index = 0;
			
			rushTrickTimer = rushTrickFrames;
			
			obj_SFXManager.crowd = true;
			
			if sonicRush {
				obj_SFXManager.sonicRushTrick = true;
			} else if blazeRush {
				obj_SFXManager.blazeRushTrick = true;
			}
			
			if rushMode {
				obj_SFXManager.rushModeTrick = true;
				rushModeTimer = rushModeFrames;
			}
			
			
			if global.Particles {
				var _particles = ceil(random(5));
				
				repeat(5 + _particles) {
					instance_create_depth(x, y, depth, obj_TrickParticles);
				}
				
				repeat(10 + _particles) {
					instance_create_depth(-100000, 0, 0, obj_TrickConfetti);
				}
			}

		}
		
		if rushTrickCombo >= 2 {
			if rushTrickFinaleBuffered && !rushTrickFinish && rushTrickTimer <= 0 {
				boostEnergy += 20;
				altFinish = false;
				leftTrick = false;
				rightTrick = false;
				upTrick = false;
				backTrick = false;
				scr_ControllerRumble(0.25);
				image_index = 0;
				
				if rushTrickCombo > 0 {
					rushTrickCombo += 1;
				}
				
				if getScore {
					rushTrickScore += 1000;
					scr_GivePoints(1000);
				}
				
				
				if rushTrickCombo <= 0 {
					obj_TrickScore.trickScore = 0;
				}
				
				obj_TrickScore.comboY = obj_TrickScore.comboYStart;
				obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
				
				obj_SFXManager.crowdComplete = true;
			
				if sonicRush {
					obj_SFXManager.sonicRushTrick = true;
				} else if blazeRush {
					obj_SFXManager.blazeRushTrick = true;
				}
			
				if rushMode {
					obj_SFXManager.rushModeTrick = true;
					rushModeTimer = rushModeFrames;
				}
				
				rushTrickFinish = true;
				
				var _randomBS = random_range(0, 3);
				var _randomRound = round(_randomBS);
				
				if global.Particles {
					scr_RushCatType(_randomRound);
					
					instance_create_depth(x, y, depth, obj_FinalTrickParticles);
					
					repeat(10) {
						instance_create_depth(x, y, depth, obj_TrickParticles);
					}
				}
			}
		}
		
		if rushTrickFinish {
			if rushTrickFinishTimer > 0 {
				rushTrickFinishTimer -= 1;
			}
			
			if rushTrickFinishTimer == 0 {
				rushTrickFinishTimer = -1;
			}
		} else {
			rushTrickFinishTimer = rushTrickFinishFrames;
		}
		
		
		//Up Trick
		if (afterRailJump == true or rampRing == true) && altTrickTimer <= 0 && trickWait <= 0 && beforeTrick == true && trick == false && railGrind == false && ground == false && up_Key && action2_Key {
			trick = true;
			upTrick = true;
			rushTrick = false;
			altFinish = true;
			leftTrick = false;
			rightTrick = false;
			backTrick = false;
			altTrickTimer = altTrickFrames;
			preTrickTimer = preTrickFrames;
			rushTrickBufferTimer = 0;
			rushTrickFinaleBufferTimer = 0;
			noMoveTimer = 10;
			
			if gravTimer > 15 {
				gravTimer = 15;
			}
			
			image_index = 0;
			scr_ControllerRumble();
			
			if sonicRush {
				obj_SFXManager.sonicRushDirTrick = true;
			} else if blazeRush {
				obj_SFXManager.blazeRushTrick = true;
			}
			
			if rushTrickCombo <= 0 {
				obj_TrickScore.trickScore = 0;
			}
			
			if getScore {
				rushTrickScore += 400;
				scr_GivePoints(400);
			}
			
			obj_TrickScore.comboY = obj_TrickScore.comboYStart;
			obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
			
			if !rushTrickFinish && rushTrickCombo > 0 {
				rushTrickCombo += 1;
			}
			
			if rushTrickFinish {
				rushTrickCombo = 0;
				rushTrickFinish = false;
			}
			
			
			yspd = upTrickBoost;
			
			if left_Key or right_Key {
				if !speedBreak {
					if left_Key && vel > -full_Speed {
						vel = -full_Speed / 2;
					} else if right_Key && vel < full_Speed {
						vel = full_Speed / 2;
					}
				} else {
					if left_Key && vel > -full_Speed {
						vel = -full_Speed;
					} else if right_Key && vel < full_Speed {
						vel = full_Speed;
					}
				}
			} else {
				vel = 0;
			}
			
			afterRailJumpTimer = 0;
		} 
		
		//Left Trick
		if (afterRailJump == true or rampRing == true) && altTrickTimer <= 0 && trickWait <= 0 && beforeTrick == true && altTrick == false && railGrind == false && ground == false && left_Key && !up_Key && action2_Key {
			altTrick = true;
			leftTrick = true;
			rushTrick = false;
			altFinish = true;
			backTrick = false;
			rightTrick = false;
			upTrick = false;
			altTrickTimer = altTrickFrames;
			preTrickTimer = preTrickFrames;
			rushTrickBufferTimer = 0;
			rushTrickFinaleBufferTimer = 0;
			noMoveTimer = 0;
			
			if gravTimer > 15 {
				gravTimer = 15;
			}
			
			scr_ControllerRumble();
			
			if sonicRush {
				obj_SFXManager.sonicRushDirTrick = true;
			} else if blazeRush {
				obj_SFXManager.blazeRushTrick = true;
			}
			
			if rushTrickCombo <= 0 {
				obj_TrickScore.trickScore = 0;
			}
			
			if getScore {
				rushTrickScore += 400;
				scr_GivePoints(400);
			}
			
			obj_TrickScore.comboY = obj_TrickScore.comboYStart;
			obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
			
			if !rushTrickFinish && rushTrickCombo > 0 {
				rushTrickCombo += 1;
			}
			
			if rushTrickFinish {
				rushTrickCombo = 0;
				rushTrickFinish = false;
			}
			
			yspd = 0;
			
			
			if vel > -full_Speed {
				vel = -fullTrickBoost;
			}
			
			afterRailJumpTimer = 0;
		} 
		
		//Right Trick
		if (afterRailJump == true or rampRing == true) && altTrickTimer <= 0 && trickWait <= 0 && beforeTrick == true && altTrick == false && railGrind == false && ground == false && right_Key && !up_Key && action2_Key {
			altTrick = true;
			rightTrick = true;
			rushTrick = false;
			altFinish = true;
			leftTrick = false;
			backTrick = false;
			upTrick = false;
			altTrickTimer = altTrickFrames;
			preTrickTimer = preTrickFrames;
			rushTrickBufferTimer = 0;
			rushTrickFinaleBufferTimer = 0;
			noMoveTimer = 0;
			
			if gravTimer > 15 {
				gravTimer = 15;
			}
			
			scr_ControllerRumble();
			
			if sonicRush {
				obj_SFXManager.sonicRushDirTrick = true;
			} else if blazeRush {
				obj_SFXManager.blazeRushTrick = true;
			}
			
			if rushTrickCombo <= 0 {
				obj_TrickScore.trickScore = 0;
			}
			
			if getScore {
				rushTrickScore += 400;
				scr_GivePoints(400);
			}
			
			obj_TrickScore.comboY = obj_TrickScore.comboYStart;
			obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
			
			if !rushTrickFinish && rushTrickCombo > 0 {
				rushTrickCombo += 1;
			}
			
			if rushTrickFinish {
				rushTrickCombo = 0;
				rushTrickFinish = false;
			}
			
			yspd = 0;
			
			if vel < full_Speed {
				vel = fullTrickBoost;
			}
			
			
			afterRailJumpTimer = 0;			
		}
		
		//Back Trick
		if (afterRailJump == true or rampRing == true) && altTrickTimer <= 0 && trickWait <= 0 && beforeTrick == true && altTrick == false && railGrind == false && ground == false && (!right_Key && !left_Key && !up_Key && action2_Key) {
			altTrick = true;
			backTrick = true;
			rushTrick = false;
			altFinish = true;
			leftTrick = false;
			rightTrick = false;
			upTrick = false;
			altTrickTimer = altTrickFrames;
			preTrickTimer = preTrickFrames;
			rushTrickBufferTimer = 0;
			rushTrickFinaleBufferTimer = 0;
			noMoveTimer = 0;
			
			if gravTimer > 15 {
				gravTimer = 15;
			}
			
			scr_ControllerRumble();
			
			if sonicRush {
				obj_SFXManager.sonicRushDirTrick = true;
			} else if blazeRush {
				obj_SFXManager.blazeRushTrick = true;
			}
			
			if rushTrickCombo <= 0 {
				obj_TrickScore.trickScore = 0;
			}
			
			if getScore {
				rushTrickScore += 400;
				scr_GivePoints(400);
			}
			
			obj_TrickScore.comboY = obj_TrickScore.comboYStart;
			obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
			
			if !rushTrickFinish && rushTrickCombo > 0 {
				rushTrickCombo += 1;
			}
			
			if rushTrickFinish {
				rushTrickCombo = 0;
				rushTrickFinish = false;
			}
			
			if !leftFacer {
				vel = -backTrickBoost * 1.25 * visXScale;
			} else {
				if !face_Left {
					vel = -backTrickBoost * 1.25;
				} else {
					vel = backTrickBoost * 1.25;
				}
			}
			
			yspd = backTrickUpBoost * 1.25;
			
			afterRailJumpTimer = 0;
		}
		
		
		//Pause player for a bit
		if trick or altTrick {
			if preTrickTimer > 0 {
				preTrickTimer -= 1;
				can_MoveFULL = false;
				
				if !leftFacer {
					if rightTrick or leftTrick or backTrick {
						sprite_index = sprTrickSidePre;
					} else if upTrick {
						sprite_index = sprTrickUpPre;
					}
				} else {
					if rightTrick or backTrick {
						sprite_index = sprTrickRightPre;
					} else if leftTrick or backTrick {
						sprite_index = sprTrickLeftPre;
					} else if upTrick {
						if !face_Left {
							sprite_index = sprTrickUpPreRight;
						} else {
							sprite_index = sprTrickUpPreLeft;
						}
					}
				}
			} else {
				can_MoveFULL = true;
			}
		} else {
			if preTrickTimer != preTrickFrames {
				can_MoveFULL = true;
				preTrickTimer = preTrickFrames;
			}
		}
		
		
		if leftTrick or rightTrick {
			if sideTrickTimer > 0 {
				yspd = 0;
				sideTrickTimer -= 1;
			}
		} else {
			sideTrickTimer = sideTrickFrames;
		}
		
		if upTrick && upTrickTimer > 0 {
			upTrickTimer -= 1;
		}
		
		if upTrick == false {
			upTrickTimer = upTrickFrames;
		}
	}
	
	if getScore && (!rampRing && !afterRailJump) {
		getScore = false;
	}
	
	if (trick or altTrick or rushTrick or rampRing or afterRailJump) && (ground or stomping or wallJump or playerHurt or global.Death) {
		afterRailJump = false;
		rampRing = false;
		trick = false;
		altTrick = false;
		trickWait = 0;
		upTrick = false;
		rightTrick = false;
		leftTrick = false;
		backTrick = false;
		beforeTrick = false;
		rushTrick = false;
		rushTrickFinish = false;
		altFinish = false;
		can_MoveFULL = true;
		rushTrickScore = 0;
		
		sideTrickTimer = sideTrickFrames;
		preTrickTimer = preTrickFrames;
		altTrickTimer = 0;
	}
}


//Rail-Tricks
function scr_RailTricksCreate() {
	railTrickUno = false;
	railTrickDos = false;
	railTrickTres = false;
	
	railTrickBuffered = false;
	railTrickBufferTimer = 0;
	railTrickBufferFrames = 20;
	
	railTrickTimer = 0;
	railTrickFrames = 25;
}

function scr_RailTricksStep() {
	if railTrickTimer > 0 {
		railTrickTimer--;
	}
	
	if railGrind {
		if action2_Key {
			railTrickBufferTimer = railTrickBufferFrames;
		}
		
		if railTrickBufferTimer > 0 {
			railTrickBufferTimer--;
			railTrickBuffered = true;
		} else {
			railTrickBuffered = false;
		}
		
		if railTrickBuffered && railTrickTimer == 0 && !railTrickTres {
			railTrickTimer = railTrickFrames;
			image_index = 0;
			
			if rushMode {
				rushModeTimer = rushModeFrames;
				obj_SFXManager.rushModeTrick = true;
			}
			
			obj_TrickScore.comboY = obj_TrickScore.comboYStart;
			obj_TrickScore.comboTimer = obj_TrickScore.comboFrames;
			
			if global.Particles {
				var _particles = ceil(random(5));
				
				repeat(5 + _particles) {
					instance_create_depth(x, y, depth, obj_TrickParticles);
				}
				
				repeat(10 + _particles) {
					instance_create_depth(-100000, 0, 0, obj_TrickConfetti);
				}
			}
			
			if !railTrickUno && !railTrickDos {
				railTrickUno = true;
				obj_SFXManager.crowd = true;
				
				boostEnergy += 10;
				
				vel += 1 * sign(vel);
				
				rushTrickScore += 100;
				scr_GivePoints(100);
				
				if sonicRush {
					obj_SFXManager.railTrickSonic1 = true;
				} else if blazeRush {
					obj_SFXManager.railTrickBlaze1 = true;
				}
			} else if railTrickUno && !railTrickDos {
				railTrickUno = false;
				railTrickDos = true;
				obj_SFXManager.crowd = true;
				
				boostEnergy += 20;
				
				vel += 2 * sign(vel);
				
				rushTrickScore += 200;
				scr_GivePoints(200);
				
				if sonicRush {
					obj_SFXManager.railTrickSonic2 = true;
				} else if blazeRush {
					obj_SFXManager.railTrickBlaze2 = true;
				}
			} else if railTrickDos {
				railTrickDos = false;
				railTrickTres = true;
				obj_SFXManager.crowdComplete = true;
				
				boostEnergy += 30;
				
				vel += 3 * sign(vel);
				
				rushTrickScore += 800;
				scr_GivePoints(800);
				
				if sonicRush {
					obj_SFXManager.railTrickSonic3 = true;
				} else if blazeRush {
					obj_SFXManager.railTrickBlaze3 = true;
				}
			}
		}
	} else {
		railTrickUno = false;
		railTrickDos = false;
		railTrickTres = false;
		
		railTrickBuffered = false;
		railTrickBufferTimer = 0;
		
		railtrickTimer = 0;
	}
}


//Rush Mode
function scr_RushMode() {
	if boostEnergy > maxBoostEnergy - 1 && !rushMode {
		rushMode = true;
		obj_SFXManager.rushModeGain = true;
		scr_ControllerRumble();
	}
	
	if rushMode {
		if initiateBoost {
			stealBoost = true;
		}
		
		if boostEnergy >= maxBoostEnergy {
			boostEnergy = maxBoostEnergy;
		}
		
		if rushModeTimer > 0 {
			rushModeTimer -= 1;
		}
	} else {
		rushModeTimer = rushModeFrames;
	}
	
	if rushModeTimer <= 0 {
		rushMode = false;
		rushModeLose = true;
		obj_SFXManager.rushModeLose = true;
		boostEnergy -= 2;
	}
	
	if rushModeLose {
		rushModeLose = false;
		
		if stealBoost {
			boostEnergy -= 100;
			stealBoost = false;
		}
	}
}

function scr_RushModeColorCreate() {
	rushModeColor = false;
	rushModeAlpha = 0;
	rushColor = global.fullRGB;
	
	anims = 1 / 2;
	
	boostingSprite = global.PlayerSelection[global.PlayerChar][18][0];
	boostingSpriteSimple = global.PlayerSelection[global.PlayerChar][18][1];
	boostingFrames = 0;
	
	stompingSprite = global.PlayerSelection[global.PlayerChar][18][2];
	stompingSprFrames = 0;
	
	stompedSprite = global.PlayerSelection[global.PlayerChar][18][3];
	
	speedBreakSprite = global.PlayerSelection[global.PlayerChar][18][4];
	speedBreakSprTimer = 0;
	speedBreakSprFrames = 10;
	
	rgAnim = 1 / 3;
	railGrindSprFrames = 0;
	
	
	pathSize = 101;
	
	for(var i = pathSize - 1; i >= 0; i--) {
		posX[i] = x;
		posY[i] = y;
		toRecordSprite[i] = sprite_index;
		toRecordImage[i] = image_index;
		toRecordXScale[i] = visXScale;
		toRecordYScale[i] = image_yscale;
		toRecordAngle[i] = drawAngle;
	}
	
	//After-Images
	with(instance_create_depth(x, y, depth + 1, obj_PlayerAfterImages)) {
		copyPlayer = other.id;
		copyRecord = 1;
		visible = false;
		image_alpha = 0.75;
	}
	
	with(instance_create_depth(x, y, depth + 1, obj_PlayerAfterImages)) {
		copyPlayer = other.id;
		copyRecord = 3;
		visible = true;
		image_alpha = 0.5;
	}
	
	with(instance_create_depth(x, y, depth + 1, obj_PlayerAfterImages)) {
		copyPlayer = other.id;
		copyRecord = 5;
		visible = false;
		image_alpha = 0.25;
	}
}

function scr_RushModeColorDraw() {
	//After-Images Pathfinding
	for(var i = pathSize - 1; i > 0; i--) {
		posX[i] = posX[i - 1];
		posY[i] = posY[i - 1];
		
		toRecordSprite[i] = toRecordSprite[i - 1];
		toRecordImage[i] = toRecordImage[i - 1];
		toRecordXScale[i] = toRecordXScale[i - 1];
		toRecordYScale[i] = toRecordYScale[i - 1];
		toRecordAngle[i] = toRecordAngle[i - 1];
	}
	
	posX[0] = x;
	posY[0] = y;
	toRecordSprite[0] = sprite_index;
	toRecordImage[0] = image_index;
	toRecordXScale[0] = visXScale;
	toRecordYScale[0] = image_yscale;
	toRecordAngle[0] = drawAngle;
	
	
	var _change = 1;
	var _change2 = 2;
	var _col1 = c_white;
	var _col2 = c_black;
	
	if global.MIND or global.PlayerChar == 0 {
		_col1 = c_black;
		_col2 = c_white;
	}
	
	extraXscale = lerp(extraXscale, 1, 0.1);
	
	if global.Outline {
		gpu_set_fog(true, _col2, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change2, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change2, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change2, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change2, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	
		gpu_set_fog(true, _col1, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
	
	draw_sprite_ext(sprite_index, image_index, round(x), round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
	
	if rushMode {
		gpu_set_fog(true, rushColor, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y), visXScale * extraXscale, image_yscale, drawAngle, rushColor, rushModeAlpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
	
	if rushModeColor {
		if rushModeAlpha < 0.5 {
			rushModeAlpha += 0.01;
		}
		
		if rushModeAlpha >= 0.5 {
			rushModeColor = false;
		}
	} else {
		if rushModeAlpha > 0 {
			rushModeAlpha -= 0.01;
		}
		
		if rushModeAlpha <= 0 {
			rushModeColor = true;
		}
	}
	
	
	if boost {
		var _boosting = boostingSprite;
		var _boostXscale = 1;
		
		if vel < 0 {
			_boostXscale = -1;
		}
		
		var _boostAngle = point_direction(0, 0, _boostXscale * vel, _boostXscale * yspd);
		
		if ground {
			_boostAngle = drawAngle;
		}
		
		if global.SimplifyVFX {
			_boosting = boostingSpriteSimple;
		}
		
		var _boostingFrames = sprite_get_number(_boosting);
		
		if boostingFrames < _boostingFrames {
			boostingFrames += anims;
		} else {
			boostingFrames = 0;
		}
		
		draw_sprite_ext(_boosting, boostingFrames, x - angleSin * 16, floor(y - angleCos * 16), _boostXscale, 1, _boostAngle, c_white, 0.5);
	} else {
		boostingFrames = 0;
	}
	
	
	if speedBreak && !stomping && !boost && abs(vel) >= max_Speed / 2 {
		var _stompingSprite = stompingSprite;
		var _stompingFrames = sprite_get_number(_stompingSprite);	
		var _stompingAngle = point_direction(0, 0, vel, yspd);
		var _stompingXscale = 1;
		var _stompingExtraAngle = 0;
		
		if vel < 0 {
			_stompingXscale = -1;
			_stompingExtraAngle = 180;
		}
		
		if ground {
			_stompingAngle = _stompingExtraAngle + drawAngle;
		}
		
		var _extraX = lengthdir_x(40, _stompingAngle);
		var _extraY = lengthdir_y(40, _stompingAngle);
		
		if stompingSprFrames < _stompingFrames {
			stompingSprFrames += anims;
		} else {
			stompingSprFrames = 0;
		}
		
		draw_sprite_ext(_stompingSprite, stompingSprFrames, x + _extraX, floor(y - 5 + _extraY), 1, 1, _stompingAngle + 90, c_white, 1);
	}
	
	
	if stomping or fallVel {
		var _stompingSprite = stompingSprite;
		var _stompingFrames = sprite_get_number(_stompingSprite);
		
		if stompingSprFrames < _stompingFrames {
			stompingSprFrames += anims;
		} else {
			stompingSprFrames = 0;
		}
		
		draw_sprite_ext(_stompingSprite, stompingSprFrames, x, y + 20, 1, 1, 0, c_white, 1);
	}
	
	if global.DEBUG {
        //Draw main masks
        draw_sprite_ext(idle_Mask, 0, floor(x), floor(y), visXScale, image_yscale, 0, c_white, 0.8);
		
        //Draw sensor masks
        draw_sprite_ext(maskBig, 0, floor(x + angleSin * sensorBottomDistance), floor(y + angleCos * sensorBottomDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskMid, 0, floor(x + sensorSin * 22), floor(y + sensorCos * 22), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x - angleSin * sensorTopDistance), floor(y - angleCos * sensorTopDistance), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x - angleCos * sensorLeftDistance), floor((y - 2) + angleSin * (sensorLeftDistance)), image_xscale, image_yscale, 0, c_white, 0.8);
        draw_sprite_ext(maskBig, 0, floor(x + angleCos * sensorRightDistance), floor((y - 2) - angleSin * (sensorRightDistance)), image_xscale, image_yscale, 0, c_white, 0.8);

        draw_line(floor(x - sensorCos * 8 + sensorSin * 8), floor(y + sensorSin * 8 + sensorCos * 8), floor(x - sensorCos * 8 + sensorSin * 36), floor(y + sensorSin * 8 + sensorCos * 36))
        draw_line(floor(x + sensorCos * 8 + sensorSin * 8), floor(y - sensorSin * 8 + sensorCos * 8), floor(x + sensorCos * 8 + sensorSin * 36), floor(y - sensorSin * 8 + sensorCos * 36))
		
		draw_sprite_ext(maskMain, 0, floor(x), floor(y) + sensorMainYDist, image_xscale, image_yscale, 0, c_white, 0.5);
    }
}