getCharacterControls();

#region //Animations
	var _yScale = 0;
	
	if speedStage or actionStage {
		bottomY = lerp(bottomY, 0, 0.1);
		choiceX = lerp(choiceX, -300, 0.1);
	} else {
		bottomY = lerp(bottomY, 100, 0.1);
		choiceX = lerp(choiceX, 0, 0.1);
	}
		
	cursorY = lerp(cursorY, 50 * choice, 0.1);
		
	srSpikesX = lerp(srSpikesX, 0, 0.1);
	charBoxY = lerp(charBoxY, srSpikesX + 10, 0.1);
	image_alpha = lerp(image_alpha, 0.4, 0.1);
	charX2 = lerp(charX2, 450, 0.04);
		
	choiceSpeedX = lerp(choiceSpeedX, -125 * chosenSpeed, 0.1);
		
	if !global.SimplifyVFX {
		textboxFrames += textboxAnim;
	}
		
	if textboxFrames >= 2 {
		textboxFrames = 0;
	}
		
	if speedStage {
		choiceSpeedY = lerp(choiceSpeedY, 0, 0.1);
	} else {
		choiceSpeedY = lerp(choiceSpeedY, 500, 0.1);
	}
		
	if lock {
		if !global.SimplifyVFX {
			lockFrames += lockAnim;
		} else {
			lock = false;
		}
			
		if lockFrames >= 5 {
			lock = false;
		}
	} else {
		lockFrames = 0;
	}
		
	mindFrames += mindAnim;
		
	if mindFrames >= 3 {
		mindFrames = 0;
	}
#endregion

if !confirm {
	if !instance_exists(obj_Jukebox) {
		if !yes {
			#region //Choices
				if !down_Key && !up_Key && !right_Key && !left_Key {
					choiceTimer = 1;
				}
	
				if !speedStage && !actionStage {
					var _choiceArray = array_length(stages) - 1;
			
					if down_Key or up_Key {
						choiceTimer--;
					}
			
					if choiceTimer <= 0 {
						if down_Key {
							if choice < _choiceArray {
								choice++;
							} else {
								choice = 0;
							}
						} else if up_Key {
							if choice > 0 {
								choice--;
							} else {
								choice = _choiceArray;
							}
						}
				
						choiceTimer = choiceFrames;
						obj_SFXManager.menuPop = true;
					}
				}
			#endregion
	
			#region //Speed Stages
				if speedStage {
					var _speedArray = array_length(global.speedStageData) - 1;
			
					if right_Key or left_Key {
						if !chosen {
							choiceTimer--;
						}
					} else {
						choiceTimer = 1;
					}
			
					if choiceTimer <= 0 {
						if right_Key {
							if chosenSpeed < _speedArray {
								chosenSpeed++;
							} else {
								chosenSpeed = 0;
							}
						} else if left_Key {
							if chosenSpeed > 0 {
								chosenSpeed--;
							} else {
								chosenSpeed = _speedArray;
							}
						}
				
						choiceTimer = choiceFrames;
						obj_SFXManager.homingLockOn = true;
					}
				}
			#endregion
	
			#region //Action Stages
		
			#endregion
	
			#region //Selection
				if jump_Key or pause_Key {
					if !speedStage && !actionStage {
						var _choiceArray = stages[choice];
				
						if _choiceArray[1] {
							if choice == 0 {
								speedStage = true;
								obj_SFXManager.menuConfirm = true;
							} else {
								lock = true;
								lockFrames = 0;
								obj_SFXManager.funkinLocked = true;
							}
						} else {
							lock = true;
							lockFrames = 0;
							obj_SFXManager.funkinLocked = true;
						}
					} else if speedStage {
						var _chooseSpeed = global.speedStageData[chosenSpeed];
				
						if !chosen {
							if _chooseSpeed.locked {
								lock = true;
								lockFrames = 0;
								obj_SFXManager.funkinLocked = true;
							} else {
								obj_SFXManager.funkinFav = true;
								chosen = true;
							
								if !_chooseSpeed.complete {
									global.Jukebox = false;
								}
							}
						} else {
							obj_SFXManager.funkinCheckpoint = true;
							set_song_ingame(noone, 90, 0);
							yes = true;
							levelChosen = true;
							chosen = false;
							changingY = -3;
							global.Replay = false;
						}
					}
				}
			#endregion
	
			#region //Custom Music
				if right_Key_Once && chosen && !jukebox {
					var _chooseSpeed = global.speedStageData[chosenSpeed];
					
					
					if _chooseSpeed.complete {
						if array_length(global.CustomJukeboxPlaylist) > 0 or (array_length(global.CustomJukeShuffled) > 0 && global.JukeboxShuffle) {
							jukeCheck = !jukeCheck;
							obj_SFXManager.homingLockOn = true;
						} else {
							scr_ULTRATEXT("freeplay_MTJuke");
						}
					} else {
						obj_SFXManager.menuCancel = true;
					}
				}
			#endregion
	
			#region //Replay Button
				if !speedStage && !actionStage {
					if action1_Key {
						instance_create_depth(x, y, depth, obj_Jukebox);
						obj_SFXManager.clench = true;
					}
				} else if speedStage && chosen {
					var _dir = working_directory + "/replay" + string(global.speedStageData[global.SpeedSelected].folder_Name);
			
					if file_exists(_dir + string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav") && file_exists(_dir + "Char" + string(global.speedStageData[global.SpeedSelected].record_File) + "Replay.sav") {
						if action1_Key {
							global.Replay = true;
							obj_SFXManager.funkinCheckpoint = true;
							set_song_ingame(noone, 90, 0);
							yes = true;
							levelChosen = true;
							chosen = false;
							changingY = -3;
						}
					}
				}
			#endregion
	
			#region //Top Face Button or somethin', idk.
				if action3_Key {
					if !speedStage && !actionStage {
						obj_SFXManager.funkinCheckpoint = true;
						changeChar = true;
						confirm = true;
						set_song_ingame(noone, 60, 0);
						changingY = -5;
					} else {
						if chosen {
							var _speedShit = global.speedStageData[global.SpeedSelected];
					
							obj_SFXManager.clench = true;
					
							if speedStage {
								if !global.Girly {						
									if obj_MusicManager.songAsset != _speedShit.musicTrack {
										set_song_ingame(_speedShit.musicTrack, 60, 60);
										instance_create_depth(-1000000, 0, depth, obj_MusicTag);
									} else {
										set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60, 60);
									}
								} else {
									if obj_MusicManager.songAsset != _speedShit.musicTrackGirly {
										set_song_ingame(_speedShit.musicTrackGirly, 60, 60);
										instance_create_depth(-1000000, 0, depth, obj_MusicTag);
									} else {
										set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60, 60);
									}
								}
							}
					
							if actionStage {
						
							}
						}
					}
				}
			#endregion
	
			#region //Cancel (Like you Twitter freaks that go nuts for every small, lil' piece of bullshit)
				if action_Key {
					if speedStage {
						if chosen {
							chosen = false;
						} else {
							speedStage = false;
						}
					} else if actionStage {
						if chosen {
							chosen = false;
						} else {
							actionStage = false;
						}
					} else {
						confirm = true;
						set_song_ingame(noone, 60, 0);
					}
			
					obj_SFXManager.UNDERTALEBombFly = true;
				}
			#endregion
		} else {
			yesTimer--;
		
			if yesTimer <= 0 {
				confirm = true;
			}
		
			if levelChosen {
				changingY += 0.1;
				charY2 -= changingY;
				levelAlphas = lerp(levelAlphas, 0, 0.05);
			}
		}
	}
} else {
	choiceX = lerp(choiceX, -300, 0.1);
	
	if levelChosen {
		changingY += 0.1;
		charY2 -= changingY;
		levelAlphas = lerp(levelAlphas, 0, 0.025);
		
		var _level = rm_LevelCard;
	
		if actionStage {
			_level = global.actionStageData[chosenAction];
		}
	
		confirmTimer--;
	
		if confirmTimer <= 0 {
			if !instance_exists(obj_RoomTransParent) {
				global.Jukebox = jukeCheck;
				global.JukeCheck = jukeCheck;
				
				with(instance_create_depth(-100000, 0, depth, obj_RushTransition)) {
					if !global.speedStageData[global.SpeedSelected].levelForced {
						global.LevelForced = false;
					} else {
						global.LevelForced = true;
					}
					
					speedStage = true;
					target_rm = global.speedStageData[global.SpeedSelected].stage_RM;
				}
			}
		}
	} else {
		if changeChar {
			changingY += 0.25;
			charY2 += changingY;
			
			changeCharTimer--;
			
			if changeCharTimer <= 0 {
				if !instance_exists(obj_RoomTransParent) {
					with(instance_create_depth(-100000, 0, depth, obj_RoomTransitionSEGAMenu)) {
						target_rm = rm_CharSelectNew;
					}
				}
			}
		} else {
			charX2 = lerp(charX2, 1100, 0.04);
			
			if !instance_exists(obj_RoomTransParent) {
				with(instance_create_depth(-10000, 0, depth, obj_RushTransition)) {
					target_rm = rm_TitleNormal;
				}
			}
		}
	}
}


#region //Extra Bullshit
	if !global.speedStageData[global.SpeedSelected].complete {
		global.Jukebox = false;
		jukeCheck = false;
	}

	global.SpeedSelected = chosenSpeed;
	global.ActionSelected = chosenAction;

	charX += ((horiFloatAmplitude) * sin(horiFloatingOffset / 12));
	horiFloatingOffset += horiFloatSpeed;

	charY += (floatAmplitude * sin(floatingOffset / 2));
	floatingOffset += floatSpeed;

	charAngle += ((rotationSpeed) * sin(rotationOffset / 4));
	rotationOffset += rotationSpeed;
	
	if chosen {
		chosenYScale = lerp(chosenYScale, 12, 0.2);
			
		if chosenYScale >= 10.95 {
			chosenTextAlpha = lerp(chosenTextAlpha, 1, 0.2);
		}
	} else {
		chosenTextAlpha = lerp(chosenTextAlpha, 0, 0.2);
			
		if chosenTextAlpha <= 0.05 {
			chosenYScale = lerp(chosenYScale, 0, 0.2);
		}
	}
	
	if changeAlpha {
		if changeCharAlpha < 0.75 {
			changeCharAlpha += 0.001;
		} else {
			changeAlpha = false;
		}
	} else {		
		if changeCharAlpha > 0.25 {
			changeCharAlpha -= 0.001;
		} else {
			changeAlpha = true;
		}
	}
#endregion
