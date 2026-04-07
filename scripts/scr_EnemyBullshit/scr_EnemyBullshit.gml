function scr_EnemyCreate() {
	charKiller = noone;
	
	enemyHealth = 100;
	enemyType = 1;
	enemyDamage = 100;
	enemySonicDeath = true;
	enemyKnockback = 3;
	enemyKnockbackY = -3;
	
	particleDeath = obj_HeadParticleDeath;
	particleAmount = 10;
	
	invincible = false;
	invincibilityTimer = 0;
	invincibilityFrames = 120;
	
	launched = false;
	launchedTimer = 30;
	
	killed = false;
	killedTimer = 180;
	
	_hitLag = 0;
	
	vel = 0;
	yspd = 0;
}

function scr_EnemyStep() {
	var _touchedPlayer = instance_place(x, y, obj_Player);
	
	//Kys *LowTierGod lightning image*
	if launched {
		if launchedTimer > 0 {
			launchedTimer -= 1;
		}
		
		if launchedTimer <= 0 {
			launched = false;
		}
	}
	
	if enemyHealth < 0 {
		enemyHealth = 0;
	}
	
	if enemyHealth <= 0 {
		if !enemySonicDeath {
			if !launched {
				if global.Particles {
					scr_EnemyDeathParticles(particleDeath, particleAmount);
				}
				
				scr_ScreenShake();
				scr_ControllerRumble();
					
				obj_Player.enemyCombo += 1;
				obj_Player.enemyComboTimer = obj_Player.enemyComboFrames;
				obj_EnemyComboCounterSpeed.sizeChange = 1.3;
					
				if instance_exists(obj_GOALColl) {
					if !obj_GOALColl.goal {	
						if obj_Player.enemyCombo == 0 {
							charKiller.boostEnergy += 10;
						} else {
							charKiller.boostEnergy += 10 * obj_Player.enemyCombo / 4;
						}
					}
				
					if charKiller.rushMode && !obj_GOALColl.goal {
						obj_SFXManager.rushModeTrick = true;
						charKiller.rushModeTimer = charKiller.rushModeFrames;
					}
				} else {
					if obj_Player.enemyCombo == 0 {
						 charKiller.boostEnergy += 10;
					} else {
						charKiller.boostEnergy += 10 * charKiller.enemyCombo / 4;
					}
				
				if charKiller.rushMode {
						obj_SFXManager.rushModeTrick = true;
						charKiller.rushModeTimer = charKiller.rushModeFrames;
					}
				}
				
				scr_GivePoints(100 * obj_Player.enemyCombo);
				
				if instance_exists(obj_StageTrackerSpeed) {
					global.EnemyCount += 1;
				}
				
				instance_destroy();
				obj_SFXManager.UndertaleDamage = true;
			}
		} else {
			if !launched {
				obj_SFXManager.playerHurt = true;
			}
		}
	}
	
	
	if launched && !killed {
		killed = true;
		vel = charKiller.vel;
		yspd = -1;
	}
	
	if launched {
		if vel > 0 {
			image_angle -= 1 * abs(vel);
		} else if vel < 0 {
			image_angle += 1 * abs(vel);
		}
	}
	
	x += vel;
	y += yspd;
}

function scr_PlayerToEnemyShit() {
	var _tojiList = ds_list_create();
	var _toji = instance_place_list(x, y, obj_EnemyParent, _tojiList, false);
	
	var _stompedVFX = instance_find(obj_StompVFX, 0);
	var _boostBreakVFX = instance_find(obj_RushBoostBreak, 0);
	
	if _stompedVFX != noone {
		with(_stompedVFX) {			
			var _toji2 = instance_place(x, y, obj_EnemyParent);
		
			if _toji2 && image_index >= 2 {
				if !_toji2.launched {
					_toji2.charKiller = other.id;
				
					scr_ScreenShake();
					scr_ControllerRumble();
		
					_toji2.enemyHealth -= _toji2.enemyHealth;
					obj_SFXManager.UndertaleDamage = true;
				}
			}
		}
	}
	
	if _boostBreakVFX != noone {
		with(_boostBreakVFX) {
			var _toji2 = instance_place(x, y, obj_EnemyParent);
		
			if _toji2 {
				if !_toji2.launched {
					_toji2.charKiller = other.id;
				
					scr_ScreenShake();
					scr_ControllerRumble();
		
					_toji2.enemyHealth -= _toji2.enemyHealth;
					obj_SFXManager.UndertaleDamage = true;
				}
			}
		}
	}
	
	if _toji > 0 {
		for(var i = 0; i < _toji; i++) {
			//If not attacking
			if !attacking && !megaAttacking {
				if !_tojiList[| i].launched {
					scr_HurtPlayer(_tojiList[| i].enemyDamage, _tojiList[| i].enemyKnockback, false, _tojiList[| i].enemyKnockbackY - 2);
				}
			} else if attacking or megaAttacking { //If attacking
				if !playerHurt && !global.Death && !_tojiList[| i].launched {
					_tojiList[| i].charKiller = id;
				
					scr_ScreenShake();
					scr_ControllerRumble();
				
					if attacking {
						if jumping && yspd > 0 && !stomping && !fallVel {
							if realJumping {
								if jump_Key_Held {
									yspd = -yspd - 1;
								} else {
									yspd = -3;
								}
							} else {
								yspd = -yspd - 1;
							}
						}
					
						_tojiList[| i].enemyHealth -= _tojiList[| i].enemyHealth;
						obj_SFXManager.UndertaleDamage = true;
					} else if megaAttacking {
						_tojiList[| i].launched = true;
						_tojiList[| i].enemyHealth -= _tojiList[| i].enemyHealth;
						obj_SFXManager.enemyExplode = true;
					}
				}
			}
		}
	}
	
	ds_list_destroy(_tojiList);
}

function scr_EnemyDeathParticles(_particle, _amount) {
	var _partAmount = _amount;
	
	if _partAmount > 0 {
		if global.Particles {
			repeat(10) {
				instance_create_depth(x, y, depth, _particle);
			}
		}
			
		_partAmount -= 1;
	}
}


function scr_HurtPlayer(_damage, _knockback, _imageXscale, _yKnockback) {
	if !invincible {
		var _ringMult = 1;
		
		if instance_exists(obj_StageTrackerSpeed) {
			if global.Rings > 0 {
				_ringMult = 2;
			}
		}
		
		global.Health -= _damage / _ringMult;
		
		scr_StopCharShit();
		scr_ScreenShake();
		scr_ControllerRumble();
		scr_LoseTrinkets();
		scr_StopCharControls();
		
		scr_BonusPoints(-10000 * (_damage / 100000));
	
		var _basedX = _imageXscale;
		
		if abs(vel) < max_Speed {
			if leftFacer {
				if !face_Left {
					vel = -_knockback;
				} else {
					vel = _knockback;
				}
			} else {
				vel = -_knockback * visXScale;
			}
		} else {
			if !leftFacer {
				visXScale = -sign(vel);
			} else {
				if vel > 0 {
					face_Left = true;
				} else {
					face_Left = false;
				}
			}
		}
		
		ground = false;
		jumping = true;
		yspd = _yKnockback;
		speedBreak = false;
		playerHurt = true;
		invincible = true;
		slowSkid = false;
		
		event_user(0);
		event_user(3);
		
		if enemyCombo > 0 {
			enemyCombo = 0;
		}
		
		if rushTrickCombo > 0 {
			obj_SFXManager.crowdAww = true;
			event_user(1);
			rushTrickCombo = 0;
		}
		
		if !rushMode {
			boostEnergy -= 50;
		} else {
			rushModeTimer = 0;
			boostEnergy -= 150;
		}
		
		obj_SFXManager.playerHurt = true;
	}
}

function scr_LoseTrinkets(_loseRings = 50) {
	if instance_exists(obj_StageTrackerSpeed) {
		//Lose Trinkets
		var _rings = 0;
		var _ringStartAngle = 101.25;
		var _ringAngle = _ringStartAngle;
		var _ringFlip = false;
		var _ringSpeed = 6;
		var _ringCheck = _loseRings;
	
		if global.Rings < _loseRings {
			_ringCheck = global.Rings;
		}
  
		//Perform loop while the ring counter is less than number of lost rings
		while _rings < _ringCheck {
		    //Create the ring
			var _ringID = instance_create_depth(global.PlayerID.x - 10, global.PlayerID.y - 26, global.PlayerID.depth - 1, obj_LostTrinkets);
		
		    _ringID.ringXSpeed = cos(_ringAngle) * _ringSpeed;
		    _ringID.ringYSpeed = -sin(_ringAngle) * _ringSpeed;
     
		    //Every ring created will moving be at the same angle as the other in the current pair, but flipped the other side of the circle
		    if _ringFlip {
		        _ringID.ringXSpeed = _ringID.ringXSpeed * -1;
		        _ringAngle += 22.5;
		    }
    
		    //Toggle flip
		    _ringFlip = !_ringFlip;
    
		    //Increment counter
		    _rings += 1;
    
		    //If we are halfway, start second "circle" of rings with lower speed
		    if _rings == _ringCheck / 2 {
		        _ringSpeed = 3;
		        _ringAngle = _ringStartAngle;
		    }
		}
	
		if global.Rings > _ringCheck {
			global.Rings -= _ringCheck;
		} else {
			global.Rings -= global.Rings;
		}
	}
}


function scr_EnemySpawn(_health, _type, _damage, _enemy, _sonicDeath) {
	with (instance_create_depth(x, y, depth, _enemy)) {
		enemyHealth = _health;
		enemyType = _type;
		enemyDamage = _damage;
		enemySonicDeath = _sonicDeath;
	}
	
	instance_destroy();
}


function scr_HitLag(_lagTime) { //Unused
	
}


//Stop Char Shit
function scr_StopCharShit() {
	//All Chars
	obj_Player.stomping = false
	obj_Player.stomped = false;
	obj_Player.sliding = false;
	obj_Player.wallJump = false;
	obj_Player.wallJumping = false;
	obj_Player.afterWallJump = false;
	obj_Player.rushTrickScore = 0;
	
	obj_TrickScore.trickScore = 0;
	obj_TrickScore.extraScore = 0;
	obj_TrickScore.visible = false;
	obj_TrickScore.comboTimer = 0;
	
	//Kappa
	if instance_exists(obj_KappaHeadOverworld) or instance_exists(obj_KappaNormalOverworld) {
		obj_Player.airDash = false;
	}
	
	
	//Sarah
	if instance_exists(obj_SarahOverworld) {
		obj_Player.hover = false;
		obj_Player.sideWallJump = false;
		obj_Player.stompingTimer = obj_Player.stompingFrames;
		obj_Player.normalStomp = false;
		obj_Player.omegaStomp = false;
		obj_Player.omegaStompingTimer = 0;
	}
	
	
	//Rush
	if instance_exists(obj_RushOverworld) {
		obj_Player.homing_Active = false;
		obj_Player.homingAttacked = false;
		obj_Player.preStomp = false;
		obj_Player.preStompTimer = obj_Player.preStompFrames;
		obj_Player.dropdash = false;
		obj_Player.dropdashing = false;
		obj_Player.spindash = false;
		obj_Player.spindashRev = false;
		obj_Player.spindashTimer = 0;
		obj_Player.superPeelout = false;
		obj_Player.superPeeloutTimer = 0;
	}
	
	
	//Ivy
	if instance_exists(obj_IvyOverworld) {
		obj_Player.shootAir = false;
		obj_Player.shootGround = false;
		obj_Player.hShootWeak = false;
		obj_Player.hShoot = false;
		obj_Player.preStomp = false;
	}
}