depth = obj_Player.depth - 10;

if image_speed <= 0 {
	image_speed = 0;
}

if place_meeting(x, y, obj_Player) && !goal && !global.Death {
	goal = true;
	scr_ChangeCamZoom(0.65, 0.075);
	
	if instance_exists(obj_InputRecorder) {
		obj_InputRecorder.isRecording = false;
	}
	
	scr_StopCharShit();
	scr_StopCharControls();
	
	obj_Player.enemyComboTimer = 1;
	
	obj_Player.speedBreak = false;
	obj_Player.speedBreakTimer = obj_Player.speedBreakFrames;
	
	obj_CameraExtended.following = self;
	
	with(obj_Player) {
		if abs(vel) <= 5 {
			other.image_speed = 0.3;
			other.spinBonus = 10000;
		} else if abs(vel) > 5 && abs(vel) < 10 {
			other.image_speed = 0.96;
			other.spinBonus = 25000;
		} else if abs(vel) >= 10 && abs(vel) < 15 {
			other.image_speed = 3;
			other.spinBonus = 50000;
		} else if abs(vel) >= 15 && abs(vel) < 20 {
			other.image_speed = 4.025;
			other.spinBonus = 70000;
		} else if abs(vel) >= 20 {
			other.image_speed = 5.01;
			other.spinBonus = 85000;
		}
	}
	
	with (instance_create_depth(-100000, 0, 0, obj_MoreBonus)) {
		bonus3 = other.spinBonus;
	}
	
	scr_StopPlayerHurt();
	obj_Player.can_Move = false;
}

if goal {
	global.countUp = false;
	obj_Player.can_Move = false;
	
	scr_StopCharControls();
	
	with(obj_Player) {
		event_user(0);
		event_user(1);
		event_user(2);
		event_user(3);
		
		if other.goalTimer <= 0 {
			if x > other.x + 65 {
				right_Key = false;
				left_Key = true;
			} else if x < other.x + 60 {
				right_Key = true;
				left_Key = false;
			} else {
				if !other.victory {
					other.victory = true;
					can_MoveFULL = false;
					sprite_index = sprVictory;
					image_index = 0;
					image_speed = 1;
					vel = 0;
				}
				
				if floor(image_index) >= image_number - 1 {
					image_index = image_number - 1;
				}
				
				if leftFacer {
					face_Left = false;
				} else {
					visXScale = 1;
				}
			}
		} else {
			if x > other.x + 80 {
				right_Key = false;
				left_Key = true;
			} 
		}
	}
} else {
	if createRingTimer > 0 {
		createRingTimer -= 1;
	}
	
	if createRingTimer <= 0 {
		if !global.SimplifyVFX {
			instance_create_depth(x, y, depth, obj_GOALRingSil1);
		}
		
		createRingTimer = createRingFrames;
	}
}

if goal && !resultsCreate {
	if createSoundTimer > 0 {
		createSoundTimer -= 1;
	}
		
	if createSoundTimer <= 0 {
		createSoundTimer = createSoundFrames;
		
		var _randomX = random_range(sprite_width / 2, -sprite_width / 2);
		var _randomY = random_range(sprite_height / 2, -sprite_height / 2);
		
		if global.Particles {
			instance_create_depth(x + _randomX, y + _randomY, depth - 10, obj_GOALRingSparkles);
		}
	}
}

if goal && goalTimer > 0 {
	goalTimer -= 1;
	//obj_SFXManager.rushRingLoop = true;
	
	if !audio_is_playing(snd_RushRingLoop) {
		audio_play_sound(snd_RushRingLoop, 8, true, global.MASTER_VOL * global.SFX_VOL);
	}
}

if goalTimer < 0 {
	goalTimer = 0;
}

if goalTimer <= 0 {
	if image_speed > 0 {
		image_speed -= 0.02;
		iconSprite = global.PlayerSelection[global.PlayerChar][28][2];
	}
	
	if image_speed <= 1.175 {
		if !slowSound {
			slowSound = true;
			obj_SFXManager.rushRingSlow = true;
			
			if audio_is_playing(snd_RushRingLoop) {
				audio_stop_sound(snd_RushRingLoop);
			}
		}
	}
	
	if image_speed <= 0 {
		if instance_exists(obj_GhostRecorder) {
			obj_GhostRecorder.ghostRecord = false;
		}
		
		image_index = 0;
		
		if !resultsCreate {
			resultsCreate = true;
			obj_SFXManager.rushRingFinish = true;
			
			if !global.SimplifyVFX {
				instance_create_depth(x, y, depth, obj_GOALRingSil2);
			}
			
			#region //Particles
				if global.Particles {
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 0;
						addY = -3;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 1.5;
						addY = -1.5;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 3;
						addY = 0;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 1.5;
						addY = 1.5;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 0;
						addY = 3;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = -1.5;
						addY = 1.5;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = -3;
						addY = 0;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = -1.3;
						addY = -1.3;
					}
				}
			#endregion
		}
		
		if resultsCreate {
			if resultsDoneTimer > 0 {
				resultsDoneTimer -= 1;
			}
			
			if resultsDoneTimer <= 0 && !resultsDone && !instance_exists(obj_BonusPoints) {
				var _reRoom = rm_ResultsScreen;
	
				if global.Replay {
					_reRoom = rm_FreeplayNew;
		
					if instance_exists(obj_GhostRecorder) {
						instance_destroy(obj_GhostRecorder);
					}
		
					if instance_exists(obj_InputRecorder) {
						instance_destroy(obj_InputRecorder);
					}
		
					global.Replay = false;
					global.PlayerChar = global.SelectedPlayer;
					global.PlayerCostume = global.SelectedCostume;
					global.Girly = global.PlayerSelection[global.SelectedPlayer][0][1];
				}
				
				with(instance_create_depth(x, y - 1000000, depth, obj_RushTransition)) {
					target_rm = _reRoom;
				}
				
				resultsDone = true;
			}
		
			if resultsSparklesTimer > 0 {
				resultsSparklesTimer -= 1;
			}
		
			if resultsSparklesTimer <= 0 {
				resultsSparklesTimer = 5;
		
				var _randomX = random_range(sprite_width / 2, -sprite_width / 2);
				var _randomY = random_range(sprite_height / 2, -sprite_height / 2);
		
				if global.Particles {
					instance_create_depth(x + _randomX, y + _randomY, depth - 10, obj_GOALRingSparkles);
				}
			}
		}
	}
}

/*if obj_Player.can_Move {
	if markiplierTimer > 0 {
		markiplierTimer--;
	} else {
		array_push(markArray, obj_Player.vel);
		markiplierTimer = 60;
	}
}*/



if global.MIND or global.PlayerChar == 0 {
	mindFrames += mindAnim;
}

if mindFrames >= 3 {
	mindFrames = 0;
}
