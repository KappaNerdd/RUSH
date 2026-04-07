getCharacterControls();

var _trans = obj_RoomTransitionSEGAMenu;
var _transRestart = obj_RoomTransitionSEGARestart;

if global.MIND or global.PlayerChar == 0 {
	_trans = obj_RoomTransitionBasic;
	_transRestart = obj_RoomTransitionBasicRestart;
}

var _choiceLength = overworld;
	
if !global.Freeplay {
	if instance_exists(obj_StageTrackerSpeed) {
		_choiceLength = speedStg;
	} else if instance_exists(obj_StageTrackerAction) {
		_choiceLength = actionStg;
	} else {		
		_choiceLength = overworld;
	}
} else {
	_choiceLength = freeplay;
}

if !done {
	#region //Animations
		var _rushBS = 60;
		
		if !global.Freeplay {
			if instance_exists(obj_StageTrackerSpeed) {
				_rushBS = 60;
			} else if instance_exists(obj_StageTrackerAction) {
				_rushBS = 60;
			} else {
				_rushBS = 72;
			}
		} else {
			_rushBS = 51;
		}
	
		image_alpha = lerp(image_alpha, 1, 0.2);
		backSideX = lerp(backSideX, -500, 0.1);
		rushBallX = lerp(rushBallX, 90, 0.1);
		rushBallAngle = lerp(rushBallAngle, -_rushBS * choice, 0.1);
		nameCharY = lerp(nameCharY, 16, 0.1);
		charY2 = lerp(charY2, 216, 0.05);
		
		if confirm {
			confirmY = lerp(confirmY, 136, 0.1);
		} else {
			confirmY = lerp(confirmY, 500, 0.1);
		}
		
		charNameX++;
		
		if charNameX >= -384 {
			charNameX = -768;
		}
		
		if global.MIND or global.PlayerChar == 0 {
			mindFrames += mindAnim;
		}
		
		if mindFrames >= 3 {
			mindFrames = 0;
		}
		
		charX += ((horiFloatAmplitude) * sin(horiFloatingOffset / 12));
		horiFloatingOffset += horiFloatSpeed;

		charY += (floatAmplitude * sin(floatingOffset / 2));
		floatingOffset += floatSpeed;

		charAngle += ((rotationSpeed) * sin(rotationOffset / 4));
		rotationOffset += rotationSpeed;
	#endregion
	
	#region //Extra Shit
		if audio_is_playing(snd_RushRingLoop) {
			audio_stop_sound(snd_RushRingLoop);
		}

		if audio_is_playing(snd_IvyGunCharge) {
			audio_stop_sound(snd_IvyGunCharge);
		}

		if !instance_exists(obj_RoomTransParent) {
			if global.UniquePauseTheme {
				audio_pause_sound(obj_MusicManager.targetSongAsset);
		
				pause = global.PlayerSelection[global.PlayerChar][21];
		
	
				if !audio_is_playing(pause) {
					audio_play_sound(pause, 4, true);
				}
	
				if audio_is_paused(pause) {
					audio_resume_sound(pause);
				}
		
				audio_sound_gain(pause, global.MUSIC_VOL * global.MASTER_VOL, 1);
			} else {
				if audio_is_paused(obj_MusicManager.targetSongAsset) {
					audio_resume_sound(obj_MusicManager.targetSongAsset);
				}
	
				if !audio_is_paused(pause) {
					audio_pause_sound(pause);
				}
			}
		}
	#endregion
	
	if !instance_exists(obj_NewOptions) && !confirm {
		#region //Choices
			var _array = array_length(_choiceLength);
		
			if right_Key_Once or down_Key_Once {
				if choice < _array - 1 {
					choice++;
				} else {
					choice = 0;
					rushBallAngle = 0 + _rushBS;
				}
			
				changeRight = true;
				obj_SFXManager.homingLockOn = true;
			}
		
			if (right_Key or down_Key) {
				if changeRight {
					if changeRightTimer > 0 {
						changeRightTimer--;
					} else {
						changeRightTimer = changeFrames;
					
						if choice < _array - 1 {
							choice++;
						} else {
							choice = 0;
							rushBallAngle = 0 + _rushBS;
						}
			
						obj_SFXManager.homingLockOn = true;
					}
				}
			} else {
				changeRight = false;
				changeRightTimer = changeFrames;
			}
		
			if left_Key_Once or up_Key_Once {
				if choice > 0 {
					choice--;
				} else {
					choice = _array - 1;
					rushBallAngle = -360;
				}
			
				changeLeft = true;
				obj_SFXManager.homingLockOn = true;
			}
		
			if (left_Key or up_Key) {
				if changeLeft {
					if changeLeftTimer > 0 {
						changeLeftTimer--;
					} else {
						changeLeftTimer = changeFrames;
					
						if choice > 0 {
							choice--;
						} else {
							choice = _array - 1;
							rushBallAngle = -360;
						}
			
						obj_SFXManager.homingLockOn = true;
					}
				}
			} else {
				changeLeft = false;
				changeLeftTimer = changeFrames;
			}
		#endregion
		
		#region //Selection
			if jump_Key {
				if _choiceLength[choice][1] == resume {
					obj_SFXManager.funkinFav = true;
					done = true;
				}
				
				if _choiceLength[choice][1] == restart {
					obj_SFXManager.funkinFav = true;
					confirm = true;
				}
				
				if _choiceLength[choice][1] == freeplayS {
					obj_SFXManager.funkinFav = true;
					confirm = true;
				}
				
				if _choiceLength[choice][1] == fileSelect {
					obj_SFXManager.funkinFav = true;
					confirm = true;
				}
				
				if _choiceLength[choice][1] == options {
					obj_SFXManager.funkinFav = true;
					instance_create_depth(-1000000, 0, depth, obj_NewOptions);
				}
				
				if _choiceLength[choice][1] == mainMenu {
					obj_SFXManager.funkinFav = true;
					confirm = true;
				}
				
				if _choiceLength[choice][1] == quitGame {
					obj_SFXManager.funkinFav = true;
					confirm = true;
				}
			}
		#endregion
	
		#region //Cancel
			if action_Key or pause_Key {
				obj_SFXManager.funkinFav = true;
				done = true;
			}
		#endregion
		
		#region //Quick-Restart
			if select_Key && !instance_exists(obj_RoomTransParent) && (instance_exists(obj_StageTrackerSpeed) or instance_exists(obj_StageTrackerAction)) {
				with(instance_create_depth(-100000, 0, depth, obj_RushTransition)) {
					restart = true;
				}
				
				if global.Freeplay {
					global.Health = global.MaxHealth;
				} else {
					global.Health = global.StarterHealth;
				}
				
				if instance_exists(obj_GhostRecorder) {
					instance_destroy(obj_GhostRecorder);
				}
				
				if instance_exists(obj_InputRecorder) {
					instance_destroy(obj_InputRecorder);
				}
				
				if !audio_is_paused(pause) {
					audio_stop_sound(pause);
					audio_resume_sound(obj_MusicManager.targetSongAsset);
				}
			}
		#endregion
	} else if confirm {
		if down_Key_Once {
			if confirmChoice < 1 {
				confirmChoice = 1;
			} else {
				confirmChoice = 0;
			}
			
			obj_SFXManager.menuTap = true;
		}
		
		if up_Key_Once {
			if confirmChoice > 0 {
				confirmChoice = 0;
			} else {
				confirmChoice = 1;
			}
			
			obj_SFXManager.menuTap = true;
		}
		
		if action_Key {
			obj_SFXManager.UNDERTALEBombFly = true;
			confirm = false;
		}
		
		#region //Choices
			if (jump_Key or pause_Key) && !instance_exists(obj_RoomTransParent) {
				obj_SFXManager.menuPop = true;
				
				if confirmChoice == 0 {
					if !instance_exists(obj_RoomTransParent) {
						if _choiceLength[choice][1] == restart {
							with(instance_create_depth(-100000, 0, depth, obj_RushTransition)) {
								restart = true;
							}
							
							if global.Freeplay {
								global.Health = global.MaxHealth;
							} else {
								global.Health = global.StarterHealth;
							}
							
							if instance_exists(obj_GhostRecorder) {
								instance_destroy(obj_GhostRecorder);
							}
				
							if instance_exists(obj_InputRecorder) {
								instance_destroy(obj_InputRecorder);
							}
							
							if !audio_is_paused(pause) {
								audio_stop_sound(pause);
								audio_resume_sound(obj_MusicManager.targetSongAsset);
							}
						}
					
						if _choiceLength[choice][1] == freeplayS {
							var _transit = instance_create_depth(-100000, 0, depth, obj_RushTransition);
							
							_transit.target_rm = rm_FreeplayNew;
							
							if instance_exists(obj_GhostRecorder) {
								instance_destroy(obj_GhostRecorder);
							}
				
							if instance_exists(obj_InputRecorder) {
								instance_destroy(obj_InputRecorder);
							}
							
							if !audio_is_paused(pause) {
								audio_stop_sound(pause);
								audio_resume_sound(obj_MusicManager.targetSongAsset);
							}
						}
					
						if _choiceLength[choice][1] == fileSelect {
							game_restart();
						}
						
						if _choiceLength[choice][1] == mainMenu {
							var _transit = instance_create_depth(-100000, 0, depth, _trans);
							
							if instance_exists(obj_GhostRecorder) {
								instance_destroy(obj_GhostRecorder);
							}
				
							if instance_exists(obj_InputRecorder) {
								instance_destroy(obj_InputRecorder);
							}
							
							var _dir = working_directory + "/saves/" + string(global.saveFile) + "/"
							
							if file_exists(string(global.NoMindDataFile) + string(global.saveFile) + ".sav") {
								_transit.target_rm = rm_TitleNormal;
							} else {
								_transit.target_rm = rm_TitleHead;
							}
							
							if !audio_is_paused(pause) {
								audio_stop_sound(pause);
								audio_resume_sound(obj_MusicManager.targetSongAsset);
							}
						}
						
						if _choiceLength[choice][1] == quitGame {
							var _transit = instance_create_depth(-100000, 0, depth, _trans);
							endGame = true;
						}
					}
				} else {
					obj_SFXManager.UNDERTALEBombFly = true;
					confirm = false;
				}
			}
		#endregion
	}
	
	if endGame {
		endGameTimer--;
		
		if endGameTimer <= 0 {
			game_end();
		}
	}
} else {
	image_alpha = lerp(image_alpha, 0, 0.1);
	backSideX = lerp(backSideX, -1200, 0.1);
	rushBallX = lerp(rushBallX, -200, 0.1);
	rushBallAngle = lerp(rushBallAngle, 1080, 0.1);
	nameCharY = lerp(nameCharY, -40, 0.1);
	charY2 = lerp(charY2, -1000, 0.1);
	
	if image_alpha <= 0.05 {
		instance_destroy();
		instance_activate_all();
		
		
		if !audio_is_paused(pause) {
			audio_stop_sound(pause);
			audio_resume_sound(obj_MusicManager.targetSongAsset);
		}
	}
}