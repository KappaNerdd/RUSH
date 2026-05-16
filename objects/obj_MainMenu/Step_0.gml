getCharacterControls();

#region //Animation
	#region //Menu Check
		var _menu = menu;
		var _dir = working_directory + "/saves/" + string(global.saveFile) + "/";
		var _filename = _dir + string(global.MainDataFile) + string(global.saveFile) + ".sav";
		
		if moveGameplay {
			if moveStory {
				_menu = story;
			} else {
				_menu = gameplay;
			}
		}
		
		if moveExtra {
			_menu = extra;
		}
	#endregion

	#region //Background Shit
		extraScale = lerp(extraScale, 0, 0.15);
		
		if realBPM > 0 {
			realBPM -= delta_time;
		} else {
			realBPM += conBPM;
			
			if !global.SimplifyVFX {
				extraScale = 1;
				
				if !menuChosen {
					menuRet = !menuRet;
				}
			}
		}
	
		if !global.SimplifyVFX {
			backTextX--;
			otherBackTextX++;
		
			if backTextX <= -384 {
				backTextX = baseTextX;
				otherBackTextX = otherBaseTextX;
			}
			
			srSpikesIndex++;
			
			if srSpikesIndex >= 20 {
				srSpikesIndex = 0;
			}
			
			if menuChosen {
				retTimer--;
				
				if retTimer <= 0 {
					retTimer = 5;
					menuRet = !menuRet;
				}
			}
		} else {
			menuRet = true;
		}
		
		if !storyChosen && !goContinue {
			if nerd == 0 {
				global.PlayerChar = 1;
			} else {
				global.PlayerChar = 11;
			}
		}
	#endregion

	#region //Sonic Rush Boss Ball
		if waitTimer <= 30 {
			anotherAngle += 5;
			changedAngle += anotherAngle;
			
			menuAngle = ease(menuAngle, -changedAngle, 0.2, Easings.QUAD_IO);
			renderX = ease(renderX, -changedAngle, 0.2, Easings.QUAD_IO);
		} else {
			menuAngle = lerp(menuAngle, -(360 / array_length(_menu)) * menuChoice, 0.15);
			renderX = lerp(renderX, -800 * menuChoice, 0.15);
			changedAngle = 0;
			anotherAngle = 5;
		}
			
		menuX = lerp(menuX, 0, 0.1);
		menuY = lerp(menuY, 0, 0.1);
		iconScale = lerp(iconScale, 1, 0.1);
	#endregion
#endregion

if !confirm {	
	#region //Menu Navigation
		if up_Key or down_Key or left_Key or right_Key {
			if !instance_exists(obj_NewOptions) && !instance_exists(obj_RoomTransParent) && !menuChosen && !cancelMenu {
				menuMoveTimer--;
			}
		} else {
			menuMoveTimer = 1;
		}
	
		if menuMoveTimer <= 0 && !newGameWarning {
			menuMoveTimer = menuMoveFrames;
			obj_SFXManager.homingLockOn = true;
		
		
			if up_Key or left_Key {
				if menuChoice > 0 {
					menuChoice--;
				} else {
					menuAngle = -360;
					menuChoice = array_length(_menu) - 1;
				}
			}
				
			if down_Key or right_Key {
				if menuChoice < array_length(_menu) - 1 {
					menuChoice++;
				} else {
					menuAngle = 360 / array_length(_menu);
					menuChoice = 0;
				}
			}
		}
		
		if menuChoice > array_length(_menu) - 1 {
			menuChoice = array_length(_menu) - 1;
			obj_SFXManager.homingLockOn = true;
		}
	#endregion
	
	#region //Confirm
		if (jump_Key or pause_Key) && !instance_exists(obj_NewOptions) && !instance_exists(obj_RoomTransParent) && !cancelMenu && !menuChosen && !newGameWarning {
			switch(_menu[menuChoice][0]) {
				#region //Main Menu
					case "title_Gameplay":
						gameplayChosen = true;
						menuChosen = true;
						obj_SFXManager.funkinCheckpoint = true;
					break;
					
					case "fs_FileSelect":
						goFileSelect = true;
						menuChosen = true;
						obj_SFXManager.funkinCheckpoint = true;
						set_song_ingame(noone, 60);
					break;
			
					case "title_Extras":
						extraChosen = true;
						menuChosen = true;
						obj_SFXManager.funkinCheckpoint = true;
					break;
			
					case "title_Options":
						obj_SFXManager.menuPop = true;
						instance_create_depth(0, 0, 0, obj_NewOptions);
					break;
				
					case "title_QuitGame":
						obj_SFXManager.menuPop = true;
						set_song_ingame(noone, 60);
						scr_LeaveTrans();
					break;
				#endregion
					
				#region //Gameplay
					case "title_StoryMode":
						storyChosen = true;
						menuChosen = true;
						obj_SFXManager.funkinCheckpoint = true;
					break;
						
					case "title_Freeplay":
						goFreeplay = true;
						menuChosen = true;
						obj_SFXManager.funkinCheckpoint = true;
						set_song_ingame(noone, 60);
					break;
				#endregion
				
				#region //Story Mode
					case "title_NewGame":
						if file_exists(_filename) {
							newGameWarning = true;
							obj_SFXManager.menuPop = true;
						} else {
							menuChosen = true;
							goNewGame = true;
							obj_SFXManager.funkinCheckpoint = true;
							set_song_ingame(noone, 60);
						}
					break;
					
					case "title_Continue":
						if file_exists(_filename) {
							goContinue = true;
							menuChosen = true;
							set_song_ingame(noone, 60);
							obj_SFXManager.funkinCheckpoint = true;
						} else {
							obj_SFXManager.menuCancel = true;
						}
					break;
					
					#region //Extras
						case "title_Boombox":
							
						break;
						
						case "title_Gallery":
							goGallery = true;
							menuChosen = true;
							obj_SFXManager.funkinCheckpoint = true;
							set_song_ingame(noone, 60);
						break;
						
						case "title_Bios":
							goBio = true;
							menuChosen = true;
							obj_SFXManager.funkinCheckpoint = true;
							set_song_ingame(noone, 60);
						break;
					#endregion
				#endregion
			}
		}
	#endregion
	
	#region //Cancel
		if action_Key && !instance_exists(obj_NewOptions) && !instance_exists(obj_RoomTransParent) && !cancelMenu && !newGameWarning {
			if !moveGameplay && !moveStory && !moveExtra {
				scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_FreeplayNew);
			} else {
				if !menuChosen {
					waitTimer = 30;
					cancelMenu = true;
				
					if nerd == 0 {
						obj_SFXManager.breakSonic = true;
					} else {
						obj_SFXManager.breakBlaze = true;
					}
					
					if moveGameplay {
						menuChoice = 0;
					}
					
					if moveExtra {
						menuChoice = 2;
					}
				} else {
					menuChosen = false;
					obj_SFXManager.UNDERTALEBombFly = true;
				}
			}
		}
	#endregion
	
	#region //Change Menu
		if menuChosen {
			if waitTimer > 0 {
				waitTimer--;
			} else {
				menuChosen = false;
				
				if gameplayChosen {
					moveGameplay = true;
					gameplayChosen = false;
				}
				
				if storyChosen {
					moveStory = true;
					storyChosen = false;
				}
				
				if extraChosen {
					menuChoice = 0;
					moveExtra = true;
					extraChosen = false;
				}
				
				if goFreeplay {
					scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_FreeplayNew);
				}
				
				if goContinue {
					load_game(global.saveFile);
				}
				
				if goFileSelect {
					scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_FileSelectNew);
				}
				
				if goNewGame {
					scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_NameMakerNew);
					global.PlayerChar = 0;
				}
				
				if goBio {
					
				}
				
				if goGallery {
					
				}
			}
		} else if cancelMenu {
			if waitTimer > 0 {
				waitTimer--;
			} else {
				cancelMenu = false;
				
				if moveGameplay {
					if !moveStory {
						moveGameplay = false;
					} else {
						moveStory = false;
					}
				}
				
				if moveExtra {
					moveExtra = false;
				}
			}
		} else {
			waitTimer = waitFrames;
		}
	#endregion
	
	#region //New Game Shit
		if newGameWarning {
			if newGameWait > 0 {
				newGameWait--;
			} else {
				if jump_Key or pause_Key {
					menuChosen = true;
					goNewGame = true;
					newGameWarning = false;
					obj_SFXManager.funkinCheckpoint = true;
					set_song_ingame(noone, 60);
					
					if file_exists(_filename) {
						file_delete(_filename);
					}
				}
			
				if action_Key {
					newGameWarning = false;
					obj_SFXManager.UNDERTALEBombFly = true;
				}
			}
		} else {
			newGameWait = newGameFrame;
		}
	#endregion
} else {
	
}