getCharacterControls();

#region //Visibility
	if image_yscale <= 0.1 {
		visible = false;
		
		if jukeboxOut {
			instance_destroy();
			scr_SaveJuke();
			
			if room == rm_FreeplayNew {
				set_song_ingame(global.PlayerSelection[global.PlayerChar][20], 60, 60);
			}
		}
	} else {
		visible = true;
	}
#endregion

if !jukeboxOut {
	#region //Animations
		if global.SimplifyVFX {
			image_speed = 0;
		} else {
			image_speed = 1;
		}
	
		image_yscale = lerp(image_yscale, 13.5, 0.1);
		
		if image_yscale >= 13.4 {
			textAlpha = lerp(textAlpha, 1, 0.1);
		}
		
		customY = lerp(customY, -64 * chosenCustMus, 0.1);
	#endregion
	
	#region //Move
		var _custArray = global.CustomJukeboxPlaylist;
						
		if global.JukeboxShuffle {
			_custArray = global.CustomJukeShuffled;
		}
	
		if up_Key or down_Key {
			moveTimer--;
		} else {
			moveTimer = 1;
		}
		
		if moveTimer <= 0 {
			obj_SFXManager.homingLockOn = true;
			moveTimer = moveFrames;
			
			if up_Key {
				if !normalJuke && !customJuke && !extraPlay {
					if jukeboxChoice > 0 {
						jukeboxChoice--;
					} else {
						jukeboxChoice = 1;
					}
				}
				
				if extraPlay && !customJuke {
					if extraChoice > 0 {
						extraChoice--;
					} else {
						extraChoice = array_length(global.NewJukes) - 1;
					}
				}
				
				if normalJuke {
					if chosenMusic > 0 {
						chosenMusic--;
					} else {
						chosenMusic = array_length(global.JukeboxPlaylist) - 1;
					}
				}
				
				if customJuke {
					if chosenCustMus > 0 {
						chosenCustMus--;
					} else {
						chosenCustMus = array_length(_custArray) - 1;
					}
				}
			}
			
			if down_Key {
				if !normalJuke && !customJuke && !extraPlay {
					if jukeboxChoice < 1 {
						jukeboxChoice++;
					} else {
						jukeboxChoice = 0;
					}
				}
				
				if extraPlay && !customJuke {
					if extraChoice < array_length(global.NewJukes) - 1 {
						extraChoice++;
					} else {
						extraChoice = 0;
					}
				}
				
				if normalJuke {
					if chosenMusic < array_length(global.JukeboxPlaylist) - 1 {
						chosenMusic++;
					} else {
						chosenMusic = 0;
					}
				}
				
				if customJuke {
					if chosenCustMus < array_length(_custArray) - 1 {
						chosenCustMus++;
					} else {
						chosenCustMus = 0
					}
				}
			}
		}
	#endregion
	
	#region //Cancel
		if action_Key {
			obj_SFXManager.UNDERTALEBombFly = true;
			
			if normalJuke {
				normalJuke = false;
			} else if customJuke {
				customJuke = false;
			} else if extraPlay && !customJuke {
				extraPlay = false;
			} else {
				jukeboxOut = true;
			}
		}
	#endregion
	
	#region //Select
		if jump_Key {
			if !normalJuke && !customJuke && !extraPlay {
				if jukeboxChoice == 0 {
					obj_SFXManager.menuCancel = true;
				} else {
					obj_SFXManager.menuPop = true;
					extraPlay = true;
				}
			} else if extraPlay && !customJuke {
				if array_length(global.NewJukes) > 0 {
					var _musPath = working_directory + "custom_boombox" + "/" + string(filename_name(global.NewJukes[extraChoice]));
					var _musDir = file_find_first(string(global.NewJukes[extraChoice]) + "/*", fa_directory);
					
					array_delete(global.CustomJukeboxPlaylist, 0, array_length(global.CustomJukeboxPlaylist));
					array_delete(global.CustomJukeShuffled, 0, array_length(global.CustomJukeShuffled));
					customJuke = true;
					obj_SFXManager.menuPop = true;
					
					while (_musDir != "") {
						array_push(global.CustomJukeboxPlaylist, _musPath + "/" + _musDir);
					    _musDir = file_find_next();
					}
					
					file_find_close();
					
					if global.JukeboxShuffle {
						global.CustomJukeShuffled = array_shuffle(global.CustomJukeboxPlaylist);
					}
				}
			} else if customJuke {
				var _bullArray = global.CustomJukeboxPlaylist;
				
				if global.JukeboxShuffle {
					_bullArray = global.CustomJukeShuffled;
				}
				
				if array_length(_bullArray) > 0 {
					obj_SFXManager.boostPad = true;
					global.CustomJukeChoice = chosenCustMus;
					var _track = audio_create_stream(_bullArray[chosenCustMus]);
				
					set_song_ingame(_track, 0, 0, pitch);
				}
			}
		}
	#endregion
	
	#region //Add Pitch
		/*if (chosenCustMus == global.CustomJukeChoice && customJuke) {
			if right_Key {
				if pitch < 3 {
					pitch += 0.01;
				}
			}
		
			if left_Key {
				if pitch > 0.05 {
					pitch -= 0.01;
				}
			}
		}*/
	#endregion
	
	#region //Add Track
		if pause_Key {
			/*obj_SFXManager.menuPop = true;
			var _customMus = get_open_filename(".ogg Files|*.ogg", "");
				
			if _customMus != "" {
				custMusFile = _customMus;
				array_push(global.CustomJukeboxPlaylist, _customMus);
				obj_SFXManager.parry = true;
			}*/
			
			if customJuke {
				var _musPath = working_directory + "custom_boombox" + "/" + string(filename_name(global.NewJukes[extraChoice]));
				var _musDir = file_find_first(string(global.NewJukes[extraChoice]) + "/*", fa_directory);
					
				array_delete(global.CustomJukeboxPlaylist, 0, array_length(global.CustomJukeboxPlaylist));
				array_delete(global.CustomJukeShuffled, 0, array_length(global.CustomJukeShuffled));
				customJuke = true;
				
				obj_SFXManager.airDashSound = true;
					
				while (_musDir != "") {
					array_push(global.CustomJukeboxPlaylist, _musPath + "/" + _musDir);
				   _musDir = file_find_next();
				}
					
				file_find_close();
			} else if extraPlay && !customJuke {
				scr_LoadCustomMusic();
				obj_SFXManager.airDashSound = true;
			}
		}
	#endregion
	
	#region //Delete
		if action2_Key {
			/*if customJuke {
				obj_SFXManager.UndertaleDamage = true;
				array_delete(global.CustomJukeboxPlaylist, chosenCustMus, 1);
			}*/
		}
	#endregion
	
	#region //Shuffle
		if action1_Key {
			global.JukeboxShuffle = !global.JukeboxShuffle;
			obj_SFXManager.clench = true;
			global.CustomJukeShuffled = array_shuffle(global.CustomJukeboxPlaylist);
		}
	#endregion
	
	#region //Loop
		if action3_Key {
			global.JukeboxLoop = !global.JukeboxLoop;
			obj_SFXManager.balloonPop = true;
		}
	#endregion
	
	#region //Array Check
		if chosenMusic > array_length(global.JukeboxPlaylist) - 1 {
			chosenMusic = array_length(global.JukeboxPlaylist) - 1;
		}
	
		if chosenCustMus > array_length(_custArray) - 1 {
			chosenCustMus = array_length(_custArray) - 1;
		}
		
		if extraChoice > array_length(global.NewJukes) - 1 {
			extraChoice = array_length(global.NewJukes) - 1;
		}
		
		if chosenMusic < 0 {
			chosenMusic = 0;
		}
	
		if chosenCustMus < 0 {
			chosenCustMus = 0;
		}
	#endregion
} else {
	textAlpha = lerp(textAlpha, 0, 0.1);
	
	if textAlpha <= 0.1 {
		image_yscale = lerp(image_yscale, 0, 0.1);
	} else {
		set_song_ingame(noone, 60, 60);
	}
}