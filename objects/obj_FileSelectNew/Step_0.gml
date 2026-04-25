getCharacterControls();

#region //Animation
	ballAngle = lerp(ballAngle, (360 / global.FileLimit) * fileChoice, 0.1);
	charAngle = lerp(charAngle, 0, 0.1);
	charOpacity = lerp(charOpacity, 0.5, 0.1);
	
	if global.SimplifyVFX {
		image_speed = 0;
	} else {
		image_speed = 1;
	}
	
	copyShitTimer--;
	copyShitAlpha -= 0.0125;
	
	if copyShitTimer <= 0 {
		copyShitTimer = 60;
		copyShitAlpha = 1;
	}
		
	if confirm or erase {
		boxExtraScale = lerp(boxExtraScale, 1, 0.3);
	} else {
		boxExtraScale = lerp(boxExtraScale, 0, 0.1);
	}
		
	red = lerp(red, newRed, 0.1);
	green = lerp(green, newGreen, 0.1);
	blue = lerp(blue, newBlue, 0.1);
	
	var _dirCheck = working_directory + "/saves/" + string(fileChoice + 1) + "/";
	var _mindCheck = _dirCheck + string(global.NoMindDataFile) + string(fileChoice + 1) + ".sav";
	
	if file_exists(_mindCheck) {
		srSpikes = spr_SonicRushSpikesNorm;
		srBlock = spr_CharSelectTop;
		srBall = spr_CharSelectRushBall2;
		sprite_index = spr_SonicRushBG;
	} else {
		srSpikes = spr_SonicRush_Spikes_Head;
		srBlock = spr_CharSelectTopHead;
		srBall = spr_CharSelectRushBossBallHead;
		sprite_index = spr_SonicRushBGHead;
	}
#endregion

if !fileChosen {
	#region //Hover
		var _fileThing = global.FileLimit - 1;
		fileMove = lerp(fileMove, -120 * fileChoice, 0.1);
		
		if erase {
			eraseFile = fileChoice;
		}
		
		if !confirm && !erase {
			if up_Key or down_Key or left_Key or right_Key {
				if !copying && !overwrite {
					chooseTimer--;
				}
			} else {
				chooseTimer = 1;
			}
		
			if chooseTimer <= 0 {
				arrowed = true;
				arrowAnim = 0;
				charOpacity = 0;
				charAngle = 360;
				chooseTimer = chooseFrames;
				obj_SFXManager.homingLockOn = true;
			
				if up_Key or left_Key {
					arrowUp = true;
					arrowDown = false;
				
					if fileChoice > 0 {
						fileChoice--;
					} else {
						fileChoice = _fileThing;
						ballAngle = (360 / global.FileLimit) * global.FileLimit;
					}
				}
			
				if down_Key or right_Key {
					arrowDown = true;
					arrowUp = false;
				
					if fileChoice < _fileThing {
						fileChoice++;
					} else {
						fileChoice = 0;
						ballAngle = (360 / global.FileLimit) * -1;
					}
				}
			}
		}
	#endregion
	
	#region //Selection 
		if jump_Key or pause_Key {
			var _dir = working_directory + "/saves/" + string(fileChoice + 1) + "/";
			var _filename = _dir + string(global.MainDataFile) + string(fileChoice + 1) + ".sav";
			
			#region //Normal
				if !copy && !erase {
					if !confirm {
						obj_SFXManager.menuPop = true;
						confirm = true;
						subChoice = 0;
					} else {
						if subChoice == 0 {
							obj_SFXManager.funkinCheckpoint = true;
							fileChosen = true;
							confirm = false;
							set_song_ingame(noone, 60, 0);
							global.saveFile = fileChoice + 1;
							
							if file_exists(_filename) {
								load_Speed_Stage(fileChoice + 1);
							}
						} else if subChoice == 1 {
							if file_exists(_filename) {
								confirm = false;
								copy = true;
								copiedFile = fileChoice + 1;
								obj_SFXManager.clench = true;
							} else {
								obj_SFXManager.menuCancel = true;
							}
						} else if subChoice == 2 {
							if file_exists(_filename) {
								confirm = false;
								erase = true;
								subChoice = 0;
								obj_SFXManager.clench = true;
							} else {
								obj_SFXManager.menuCancel = true;
							}
						} else if subChoice == 3 {
							confirm = false;
							obj_SFXManager.block = true;
						}
					}
				} else
			#endregion
			
			#region //Copying
				if copy {
					if fileChoice + 1 != copiedFile {
						if !overwrite {
							if file_exists(_filename) {
								overwrite = true;
								obj_SFXManager.breakBlaze = true;
							} else {
								var _oldDir = working_directory + "/saves/" + string(copiedFile) + "/";
								var _oldFilename = _oldDir + string(global.MainDataFile) + string(copiedFile) + ".sav";
								var _oldSpeedname = _oldDir + string(global.SpeedDataFile) + string(copiedFile) + ".sav";
								var _oldActionname = _oldDir + string(global.ActionDataFile) + string(copiedFile) + ".sav";
								var _oldNoMindname = _oldDir + string(global.NoMindDataFile) + string(copiedFile) + ".sav";
							
								var _newDir = working_directory + "/saves/" + string(fileChoice + 1) + "/";
								var _newFilename = _newDir + string(global.MainDataFile) + string(fileChoice + 1) + ".sav";
								var _newSpeedname = _newDir + string(global.SpeedDataFile) + string(fileChoice + 1) + ".sav";
								var _newActionname = _newDir + string(global.ActionDataFile) + string(fileChoice + 1) + ".sav";
								var _newNoMindname = _newDir + string(global.NoMindDataFile) + string(fileChoice + 1) + ".sav";
							
								if file_exists(_oldFilename) {
									file_copy(_oldFilename, _newFilename);
								}
							
								if file_exists(_oldSpeedname) {
									file_copy(_oldSpeedname, _newSpeedname);
								}
							
								if file_exists(_oldActionname) {
									file_copy(_oldActionname, _newActionname);
								}
							
								if file_exists(_oldNoMindname) {
									file_copy(_oldNoMindname, _newNoMindname);
								}
							
								obj_SFXManager.breakSonic = true;
								copy = false;
							}
						} else {
							var _oldDir = working_directory + "/saves/" + string(copiedFile) + "/";
							var _oldFilename = _oldDir + string(global.MainDataFile) + string(copiedFile) + ".sav";
							var _oldSpeedname = _oldDir + string(global.SpeedDataFile) + string(copiedFile) + ".sav";
							var _oldActionname = _oldDir + string(global.ActionDataFile) + string(copiedFile) + ".sav";
							var _oldNoMindname = _oldDir + string(global.NoMindDataFile) + string(copiedFile) + ".sav";
							
							var _newDir = working_directory + "/saves/" + string(fileChoice + 1) + "/";
							var _newFilename = _newDir + string(global.MainDataFile) + string(fileChoice + 1) + ".sav";
							var _newSpeedname = _newDir + string(global.SpeedDataFile) + string(fileChoice + 1) + ".sav";
							var _newActionname = _newDir + string(global.ActionDataFile) + string(fileChoice + 1) + ".sav";
							var _newNoMindname = _newDir + string(global.NoMindDataFile) + string(fileChoice + 1) + ".sav";
							
							if file_exists(_oldFilename) {
								file_copy(_oldFilename, _newFilename);
							}
							
							if file_exists(_oldSpeedname) {
								file_copy(_oldSpeedname, _newSpeedname);
							}
							
							if file_exists(_oldActionname) {
								file_copy(_oldActionname, _newActionname);
							}
							
							if file_exists(_oldNoMindname) {
								file_copy(_oldNoMindname, _newNoMindname);
							}
							
							obj_SFXManager.breakSonic = true;
							copy = false;
							overwrite = false;
						}
					} else {
						obj_SFXManager.menuCancel = true;
					}
				} else
			#endregion
			
			#region //Erasing
				if erase {
					if erasing {
						if subChoice == 0 {
							erasing = false;
							obj_SFXManager.block = true;
						} else {
							obj_SFXManager.UNDERTALEBombSplosion = true;
							directory_destroy(working_directory + "/saves/" + string(fileChoice + 1));
							erasing = false;
							erase = false;
						}
					} else {
						if subChoice == 0 {
							erase = false;
							confirm = true;
							obj_SFXManager.block = true;
						} else {
							erasing = true;
							subChoice = 0;
							obj_SFXManager.clench = true;
						}
					}
				}
			#endregion
		}
	#endregion
	
	#region //Cancel
		if action_Key {
			if !confirm {
				if copy {
					obj_SFXManager.block = true;
				
					if overwrite {
						overwrite = false;
					} else {
						copy = false;
						
						if fileChoice + 1 == copiedFile {
							confirm = true;
						}
					}
				} else if erase {
					obj_SFXManager.block = true;
				
					if erasing {
						erasing = false;
					} else {
						erase = false;
						confirm = true;
					}
				}
			} else {
				obj_SFXManager.block = true;
				confirm = false;
			}
		}
	#endregion
	
	#region //Secondary Hover
		if confirm or erase {
			var _limit = 3;
			
			if erase {
				_limit = 1;
			}
			
			if right_Key or left_Key {
				chooseTimer--;
			} else {
				chooseTimer = 1;
			}
			
			if chooseTimer <= 0 {
				chooseTimer = chooseFrames;
				obj_SFXManager.funkinFav = true;
				
				if right_Key {
					if subChoice < _limit {
						subChoice++;
					} else {
						subChoice = 0;
					}
				}
				
				if left_Key {
					if subChoice > 0 {
						subChoice--;
					} else {
						subChoice = _limit;
					}
				}
			}
		}
	#endregion
} else {
	if fileChosenTimer > 0 {
		fileChosenTimer--;
	} else {
		var _dir = working_directory + "/saves/" + string(fileChoice + 1) + "/";
		var _filename = _dir + string(global.NoMindDataFile) + string(fileChoice + 1) + ".sav";
		var _filename2 = _dir + string(global.MainDataFile) + string(fileChoice + 1) + ".sav";
		var _room = rm_TitleNormal;
		var _trans = obj_RoomTransitionSEGAMenu;
		
		if !file_exists(_filename) {
			if !file_exists(_filename2) {
				_room = rm_NameMakerNew;
				_trans = obj_RoomTransitionSEGAMenu;
			} else {
				_trans = obj_RoomTransitionSEGALoad;
			}
		}
		
		if !instance_exists(obj_RoomTransParent) {
			with(instance_create_depth(-100000, 0, depth, _trans)) {
				target_rm = _room;
				division = 3;
			}
		}
	}
}