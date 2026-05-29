getCharacterControls();

var _stringWidth = scr_LocalText(global.JukeboxPlaylist[global.JukeBoxChoice][1]);

if boomChoice == 1 {
	if chosenPlay {
		if !chosenBoom {
			if array_length(global.NewJukes) > 0 {
				_stringWidth = string(filename_name(global.NewJukes[playChoice]));
			} else {
				_stringWidth = scr_LocalText("juke_NoFolders");
			}
		} else {
			if array_length(global.CustomJukeboxPlaylist) > 0 {
				_stringWidth = string(filename_name(global.CustomJukeboxPlaylist[global.CustomJukeChoice]));
			} else {
				_stringWidth = scr_LocalText("juke_NoTracks");
			}
		}
	}
}

if !chosenPlay && !chosenBoom {
	if boomChoice == 0 {
		_stringWidth = scr_LocalText("freeplay_NormJuke");
	} else {
		_stringWidth = scr_LocalText("freeplay_CustJuke");
	}
}

if chosenBoom && boomChoice == 1 {
	if global.CustomJukeChoice > array_length(global.CustomJukeboxPlaylist) - 1 {
		global.CustomJukeChoice = array_length(global.CustomJukeboxPlaylist) - 1;
	}
}

if !ultrakilled {
	#region //Animations
		boxX = lerp(boxX, 192, 0.1);
		boxY = lerp(boxY, 200, 0.1);
		bgAlph = lerp(bgAlph, 0.5, 0.1);
		albumY = lerp(albumY, 0, 0.1);
		
		if rightArrow {
			rightFrames += 1 / 2;
			
			if rightFrames >= 5 {
				rightArrow = false;
				rightFrames = 0;
			}
		}
		
		if leftArrow {
			leftFrames += 1 / 2;
			
			if leftFrames >= 5 {
				leftArrow = false;
				leftFrames = 0;
			}
		}
		
		if upArrow {
			upFrames += 1 / 2;
			
			if upFrames >= 5 {
				upArrow = false;
				upFrames = 0;
			}
		}
		
		if downArrow {
			downFrames += 1 / 2;
			
			if downFrames >= 5 {
				downArrow = false;
				downFrames = 0;
			}
		}
		
		if moveTextTimer > 0 {
			moveTextTimer--;
		} else {
			if trackTimer > 0 {
				trackTimer--;
			} else {
				trackTimer = 10;
				
				if moveTextX > -(string_width(_stringWidth) + 50) {
					moveTextX -= 10; 
				} else {
					moveTextX = 120;
				}
			}
		}
		
		speakerScale = lerp(speakerScale, 4, 0.15);
		
		if obj_MusicManager.songAsset != noone {
			if speakerTimer > 0 {
				speakerTimer--;
			} else {
				speakerTimer = ceil(random(10));
				speakerScale = random_range(4.1, 4.25);
			}
		}
	#endregion
	
	#region //Movement
		if left_Key or right_Key or up_Key or down_Key {
			moveTimer--;
		} else {
			moveTimer = 1;
		}
		
		if moveTimer <= 0 {
			moveTimer = moveFrames;
			
			if !chosenPlay && !chosenBoom {
				if up_Key {
					boomChoice = !boomChoice;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.funkinFav = true;
					upArrow = true;
					upFrames = 0;
					boxY -= 10;
				}
				
				if down_Key {
					boomChoice = !boomChoice;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.funkinFav = true;
					downArrow = true;
					downFrames = 0;
					boxY += 10;
				}
			}

			if boomChoice == 0 && chosenBoom {
				if left_Key {
					obj_SFXManager.funkinFav = true;
					leftArrow = true;
					leftFrames = 0;
					moveTextX = 0;
					moveTextTimer = 60;
						
					do {
						if global.JukeBoxChoice > 0 {
							if curSprite != global.JukeboxPlaylist[global.JukeBoxChoice - 1][2] {
								curSprite = global.JukeboxPlaylist[global.JukeBoxChoice - 1][2];
								albumY = -10;
							}
							
							global.JukeBoxChoice--;
						} else {
							if curSprite != global.JukeboxPlaylist[array_length(global.JukeboxPlaylist) - 1][2] {
								curSprite = global.JukeboxPlaylist[array_length(global.JukeboxPlaylist) - 1][2];
								albumY = -10;
							}
							
							global.JukeBoxChoice = array_length(global.JukeboxPlaylist) - 1;
						}
					} until !global.JukeboxPlaylist[global.JukeBoxChoice][3];
				}
				
				if right_Key {
					obj_SFXManager.funkinFav = true;
					rightArrow = true;
					rightFrames = 0;
					moveTextX = 0;
					moveTextTimer = 60;
					
					do {
						if global.JukeBoxChoice < array_length(global.JukeboxPlaylist) - 1 {
							if curSprite != global.JukeboxPlaylist[global.JukeBoxChoice + 1][2] {
								curSprite = global.JukeboxPlaylist[global.JukeBoxChoice + 1][2];
								albumY = 10;
							}
						
							global.JukeBoxChoice++;
						} else {
							if curSprite != global.JukeboxPlaylist[0][2] {
								curSprite = global.JukeboxPlaylist[0][2];
								albumY = 10;
							}
						
							global.JukeBoxChoice = 0;
						}
					} until !global.JukeboxPlaylist[global.JukeBoxChoice][3];
				}
			} else if boomChoice == 1 {
				if !chosenBoom {
					if right_Key {
						obj_SFXManager.homingLockOn = true;
						rightArrow = true;
						rightFrames = 0;
						moveTextX = 0;
						moveTextTimer = 60;
						boxX += 10;
						
						if playChoice < array_length(global.NewJukes) - 1 {
							playChoice++;
						} else {
							playChoice = 0;
						}
					}
						
					if left_Key {
						obj_SFXManager.homingLockOn = true;
						leftArrow = true;
						leftFrames = 0;
						moveTextX = 0;
						moveTextTimer = 60;
						boxX -= 10;
							
						if playChoice > 0 {
							playChoice--;
						} else {
							playChoice = array_length(global.NewJukes) - 1;
						}
					}
				} else {
					if array_length(global.NewJukes) > 0 && array_length(global.CustomJukeboxPlaylist) > 0 {
						if right_Key {
							obj_SFXManager.funkinFav = true;
							rightArrow = true;
							rightFrames = 0;
							moveTextX = 0;
							moveTextTimer = 60;
							
							if global.CustomJukeChoice < array_length(global.CustomJukeboxPlaylist) - 1 {
								global.CustomJukeChoice++;
							} else {
								global.CustomJukeChoice = 0;
							}
						}
						
						if left_Key {
							obj_SFXManager.funkinFav = true;
							leftArrow = true;
							leftFrames = 0;
							moveTextX = 0;
							moveTextTimer = 60;
							
							if global.CustomJukeChoice > 0 {
								global.CustomJukeChoice--;
							} else {
								global.CustomJukeChoice = array_length(global.CustomJukeboxPlaylist) - 1;
							}
						}
					}
				}
			}
		}
	#endregion
	
	#region //Selection
		if jump_Key or pause_Key {
			if boomChoice == 0 {
				if !chosenBoom {
					chosenBoom = true;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.menuPop = true;
				} else {
					if !audio_is_playing(global.JukeboxPlaylist[global.JukeBoxChoice][0]) {
						set_song_ingame(global.JukeboxPlaylist[global.JukeBoxChoice][0]);
					} else {
						set_song_ingame(noone);
					}
				}
			} else if boomChoice == 1 {
				if !chosenPlay {
					chosenPlay = true;
					moveTextX = 0;
					moveTextTimer = 60;
					obj_SFXManager.menuPop = true;
					scr_LoadCustomMusic();
				} else {
					if array_length(global.NewJukes) > 0 {
						if !chosenBoom {
							chosenBoom = true;
							obj_SFXManager.menuPop = true;
							moveTextX = 0;
							moveTextTimer = 60;
							
							var _musPath = working_directory + "custom_boombox" + "/" + string(filename_name(global.NewJukes[playChoice]));
							var _musDir = file_find_first(string(global.NewJukes[playChoice]) + "/*", fa_directory);
							
							if array_length(global.CustomJukeboxPlaylist) > 0 {
								array_delete(global.CustomJukeboxPlaylist, 0, array_length(global.CustomJukeboxPlaylist));
							}
							
							if file_exists(_musPath + "/" + "album.png") {
								custAlbum = sprite_add(_musPath + "/" + "album.png", 0, false, false, 384, 384);
							} else {
								custAlbum = spr_AlbumPlaceholder;
							}
								
							while (_musDir != "") {
								if string_ends_with(_musDir, ".ogg") {
									array_push(global.CustomJukeboxPlaylist, _musPath + "/" + _musDir);
								}
								
							   _musDir = file_find_next();
							}
					
							file_find_close();
						} else {
							var _track = audio_create_stream(global.CustomJukeboxPlaylist[global.CustomJukeChoice]);
							
							if custNum != global.CustomJukeChoice {
								set_song_ingame(_track);
								custNum = global.CustomJukeChoice;
							} else {
								set_song_ingame(noone);
								custNum = -1;
							}
						}
					} else {
						obj_SFXManager.menuCancel = true;
					}
				}
			}
		}
	#endregion
	
	#region //Cancel
		if action_Key {
			if chosenBoom {
				obj_SFXManager.UNDERTALEBombFly = true;
				chosenBoom = false;
				
				if global.CustomJukeChoice < 0 {
					global.CustomJukeChoice = 0;
				}
			} else {
				if !chosenPlay {
					ultrakilled = true;
				} else {
					chosenPlay = false;
				}
				
				obj_SFXManager.UNDERTALEBombFly = true;
			}
		}
	#endregion
} else {
	boxY = lerp(boxY, -170, 0.15);
	bgAlph = lerp(bgAlph, 0, 0.15);
	
	if boxY <= -169.5 {
		instance_destroy();
		
		if obj_MusicManager.songAsset == noone {
			if room == rm_MainMenuNew {
				var _track = mus_WrapItUpK;
				
				if obj_MainMenu.nerd == 1 {
					_track = mus_WrapItUpL;
				}
				
				set_song_ingame(_track, 60, 0);
			}
			
			if room == rm_FreeplayNew {
				set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60);
			}
		}
	}
}