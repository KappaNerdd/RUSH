getCharacterControls();
scr_ChangeControlSprites();
scr_SetControl();
scr_GetCharRushBoostIcon();

if !done {
	#region //Animations
		setY = lerp(setY, 16, 0.1);
		optX = lerp(optX, -800 * opt, 0.1);
		iconX = lerp(iconX, 12 * opt, 0.1);
		iconY = lerp(iconY, 32 * choice, 0.1);
		leftSpikesX = lerp(leftSpikesX, 190, 0.1);
		
		if iconFrames >= 4 {
			iconFrames = 0;
		}
		
		if spikesFrames >= 20 {
			spikesFrames = 0;
		}
		
		arrowFrames += arrowAnim;
		
		if arrowFrames >= 3 {
			arrowFrames = 0;
		}
		
		if animatedArrow {
			if arrowLeft {
				arrowFrames2 += arrowAnim2;
			}
			
			if arrowRight {
				arrowFrames3 += arrowAnim2;
			}
			
			if arrowFrames2 >= 5 {
				arrowFrames2 = 0;
				animatedArrow = false;
				arrowLeft = false;
			}
			
			if arrowFrames3 >= 5 {
				arrowFrames3 = 0;
				animatedArrow = false;
				arrowRight = false;
			}
		} else {
			arrowFrames2 = 0;
			arrowFrames3 = 0;
		}
		
		if !global.SimplifyVFX {
			image_speed = 1;
			iconFrames += iconAnim;
			spikesFrames += spikesAnim;
		} else {
			image_speed = 0;
		}
	#endregion
	
	#region //Choices
		if !changeBind {
			#region //Options
				if left_Key_Once {
					if opt > 0 {
						opt--;
					} else {
						opt = array_length(allOpts) - 1;
					}
					
					animatedArrow = true;
					arrowLeft = true;
					arrowFrames2 = 0;
					obj_SFXManager.homingLockOn = true;
				}
			
				if right_Key_Once {
					if opt < array_length(allOpts) - 1 {
						opt++;
					} else {
						opt = 0;
					}
				
					animatedArrow = true;
					arrowRight = true;
					arrowFrames3 = 0;
					obj_SFXManager.homingLockOn = true;
				}
			#endregion
		
			#region //Choices
				var _optArray = audio;
				
				if opt == 0 {
					_optArray = audio;
				} else if opt == 1 {
					_optArray = visual
				} else if opt == 2 {
					_optArray = misc;
				} else if opt == 3 {
					_optArray = pref;
				} else if opt == 4 {
					_optArray = display;
				} else if opt == 5 {
					_optArray = online;
				} else if opt == 6 {
					_optArray = conGeneral;
				} else if opt == 7 {
					_optArray = conSpeed1;
				} else if opt == 8 {
					_optArray = conSpeed2;
				} else if opt == 9 {
					_optArray = conAct1;
				} else if opt == 10 {
					_optArray = conAct2;
				}
			
				var _array = array_length(_optArray);
			
				if choice > _array - 1 {
					choice = _array - 1;
					obj_SFXManager.menuTap = true;
				}
		
				if up_Key_Once {
					if choice > 0 {
						choice--;
					} else {
						choice = _array - 1;
					}
				
					obj_SFXManager.menuTap = true;
				}
			
				if down_Key_Once {
					if choice < _array - 1 {
						choice++;
					} else {
						choice = 0;
					}
				
					obj_SFXManager.menuTap = true;
				}
			#endregion
		}
	#endregion
	
	if jump_Key && !changeBind {
		obj_SFXManager.funkinFav = true;
		
		#region //Audio
			if opt == 0 {
				if choice == 0 {
					if global.MASTER_VOL > 0 {
						global.MASTER_VOL -= 0.1;
					} else {
						global.MASTER_VOL = 1;
					}
				}
				
				if choice == 1 {
					if global.MUSIC_VOL > 0 {
						global.MUSIC_VOL -= 0.1;
					} else {
						global.MUSIC_VOL = 1;
					}
				}
				
				if choice == 2 {
					if global.SFX_VOL > 0 {
						global.SFX_VOL -= 0.1;
					} else {
						global.SFX_VOL = 1;
					}
				}
				
				if choice == 3 {
					if global.TEXT_VOL > 0 {
						global.TEXT_VOL -= 0.1;
					} else {
						global.TEXT_VOL = 1;
					}
				}
				
				if choice == 4 {
					if global.AMBIENCE_VOL > 0 {
						global.AMBIENCE_VOL -= 0.1;
					} else {
						global.AMBIENCE_VOL = 1;
					}
				}
				
				if choice == 5 {
					global.UniquePauseTheme = !global.UniquePauseTheme;
				}
				
				if choice == 6 {
					global.Footstep = !global.Footstep;
				}
			}
		#endregion
		
		#region //Visual
			if opt == 1 {
				if choice == 0 {
					global.ExtendCamera = !global.ExtendCamera;
				}
				
				if choice == 1 {
					global.ScreenShake = !global.ScreenShake;
				}
				
				if choice == 2 {
					global.SimplifyVFX = !global.SimplifyVFX;
				}
				
				if choice == 3 {
					global.Particles = !global.Particles;
				}
				
				if choice == 4 {
					global.Outline = !global.Outline;
				}
				
				if choice == 5 {
					global.Squash = !global.Squash;
				}
				
				if choice == 6 {
					global.ConDisplay = !global.ConDisplay;
				}
			}
		#endregion
		
		#region //Misc
			if opt == 2 {
				if choice == 0 {
					if global.Language == 1 {
						global.Language = 2;
					} else {
						global.Language = 1;
					}
				}
				
				if choice == 1 {
					if global.TextSpd == 0.5 {
						global.TextSpd = 1
					} else if global.TextSpd == 1 {
						global.TextSpd = 2;
					} else if global.TextSpd == 2 {
						global.TextSpd = 3;
					} else if global.TextSpd == 3 {
						global.TextSpd = 0.5;
					}
				}
				
				if choice == 2 {
					global.SongTag = !global.SongTag;
				}
				
				if choice == 3 {
					if global.ConType < 2 {
						global.ConType++;
					} else {
						global.ConType = 0;
					}
				}
				
				if choice == 4 {
					global.ConRumble = !global.ConRumble;
				}
				
				if choice == 5 {
					global.Speedrun = !global.Speedrun;
				}
				
				if choice == 6 {
					global.FPSOn = !global.FPSOn;
				}
			}
		#endregion
		
		#region //Preferences
			if opt == 3 {
				if choice == 0 {
					global.ColorCode = !global.ColorCode;
				}
				
				if choice == 1 {
					var _colArray = array_length(global.ColorBase) - 1;
					
					if global.ChangeColor < _colArray {
						global.ChangeColor++;
					} else {
						global.ChangeColor = 0;
					}
				}
				
				if choice == 2 {
					global.FocusLoss = !global.FocusLoss;
				}
			}
		#endregion
		
		#region //Display
			if opt == 4 {
				if choice == 0 {
					global.FullScreen = !global.FullScreen;
				}
				
				if choice == 1 {
					if global.WindowSize == 0.5 {
						global.WindowSize = 0.75;
					} else if global.WindowSize == 0.75 {
						global.WindowSize = 1;
					} else if global.WindowSize == 1 {
						global.WindowSize = 1.25;
					} else if global.WindowSize == 1.25 {
						global.WindowSize = 1.5;
					} else if global.WindowSize == 1.5 {
						global.WindowSize = 1.75;
					} else if global.WindowSize == 1.75 {
						global.WindowSize = 0.5;
					}
					
					window_set_size(1280 * global.WindowSize, 720 * global.WindowSize);
					window_center();
				}
				
				if choice == 2 {
					global.VSync = !global.VSync;
					display_reset(0, global.VSync);
				}
			}
		#endregion
		
		#region //Online
			if opt == 5 {
				if choice == 0 {
					global.ShowGhost = !global.ShowGhost;
				}
			}
		#endregion
		
		#region //Con General
			if opt == 6 {
				if choice == 0 or choice == 1 {
					changeBind = true;
				}
				
				if choice == 2 {
					if global.ConDeadZone > 0 {
						global.ConDeadZone -= 0.1;
					} else {
						global.ConDeadZone = 1;
					}
				}
				
				if choice == 3 {
					if global.TrigDeadZone > 0 {
						global.TrigDeadZone -= 0.1;
					} else {
						global.TrigDeadZone = 1;
					}
				}
			}
		#endregion
		
		#region //Con Speed
			if opt == 7 or opt == 8 { //Don't
				changeBind = true;
			}
		#endregion
		
		#region //Con Action
			if opt == 9 or opt == 10 {
				changeBind = true;
			}
		#endregion
	}
	
	if action3_Key && !changeBind {
		obj_SFXManager.UNDERTALEBombFly = true;
		
		#region ///-----Default Options-----///
			//Audio
			global.MASTER_VOL = 1;
			global.MUSIC_VOL = 1;
			global.SFX_VOL = 1;
			global.TEXT_VOL = 1;
			global.AMBIENCE_VOL = 1;
			global.UniquePauseTheme = false;
			global.Footstep = true;

			//Visual
			global.ScreenShake = true;
			global.ExtendCamera = true;
			global.SimplifyVFX = false;
			global.Particles = true;
			global.ConDisplay = false;
			global.Outline = true;
			global.Squash = true;

			//Misc
			global.Language = 1;
			global.TextSpd = 1;
			global.SongTag = true;
			global.ConRumble = true
			global.ConType = 0;
			global.FPSOn = true;
			global.Speedrun = false;
	
			//Display
			global.WindowSize = 1;
			window_set_size(1280, 720);
			window_center();
			global.FullScreen = false;
			global.VSync = false;
			display_reset(0, false);
	
			//Preferences
			global.FocusLoss = false;
			global.ColorCode = true;
			global.ChangeColor = 0;
	
			//Online
			global.DiscordRich = true;
			global.ShowGhost = true;

			//Controls
			global.ConDeadZone = 0.5;
			global.TrigDeadZone = 0.5;
			global.ControllerOnly = false;
			global.KeyboardP1 = false;
		#endregion

		#region ///-----Speed & Menu Controls-----///

			//Controls Keyboard
			global.LeftKeySpeed = vk_left;
			global.RightKeySpeed = vk_right;
			global.UpKeySpeed = vk_up;
			global.DownKeySpeed = vk_down;
			global.JumpKeySpeed = "Z";
			global.ActionKeySpeed = "X";
			global.Action1KeySpeed = "C";
			global.Action2KeySpeed = vk_space;
			global.Action3KeySpeed = "V";
			global.Action4KeySpeed = vk_lshift;
			global.PauseKeySpeed = vk_enter;
			global.SelectKeySpeed = vk_lcontrol;


			//Controls Controller
			global.LeftPadSpeed = gp_padl;
			global.RightPadSpeed = gp_padr;
			global.UpPadSpeed = gp_padu;
			global.DownPadSpeed = gp_padd;
			global.JumpButtonSpeed = gp_face1;
			global.ActionButtonSpeed = gp_face2;
			global.Action1ButtonSpeed = gp_face3;
			global.Action2ButtonSpeed = gp_shoulderr;
			global.Action3ButtonSpeed = gp_face4;
			global.Action4ButtonSpeed = gp_shoulderl;
			global.PauseButtonSpeed = gp_start;
			global.SelectButtonSpeed = gp_select;
		#endregion

		#region ///-----Action Controls-----///

			//Controls Keyboard
			global.LeftKeyAction = vk_left;
			global.RightKeyAction = vk_right;
			global.UpKeyAction = vk_up;
			global.DownKeyAction = vk_down;
			global.LightKeyAction = "X";
			global.MediumKeyAction = "C";
			global.HeavyKeyAction = "V";
			global.SpecialKeyAction = "Z";
			global.DashKeyAction = vk_space;
			global.SuperDashKeyAction = vk_lshift;
			global.ParryKeyAction = "G";
			global.ChargeKeyAction = "B";


			//Controls Controller
			global.LeftPadAction = gp_padl;
			global.RightPadAction = gp_padr;
			global.UpPadAction = gp_padu;
			global.DownPadAction = gp_padd;
			global.LightButtonAction = gp_face3;
			global.MediumButtonAction = gp_face4;
			global.HeavyButtonAction = gp_face2;
			global.SpecialButtonAction = gp_face1;
			global.DashButtonAction = gp_shoulderrb;
			global.SuperDashButtonAction = gp_shoulderr;
			global.ParryButtonAction = gp_shoulderl;
			global.ChargeButtonAction = gp_shoulderlb;
		#endregion
		
		var _dir = working_directory + "/options/"
		
		file_delete(_dir + string(global.OptionsDataFile) + ".sav");
		file_delete(_dir + string(global.ControlsDataFile) + ".sav");
	}
	
	if action_Key && !changeBind {
		save_options();
		scr_SaveControls();
		done = true;
		obj_SFXManager.menuConfirm = true;
	}
	
	#region //Timers
		if changeBind {	
			changeBindY = lerp(changeBindY, 48, 0.2);
			
			if waitTimer <= 1 {
				if opt == 4 {
					#region //Con General
						if choice == 0 {
							if !gamepad_is_connected(global.Player1Con) {
								global.PauseKeySpeed = remappedBind;
							} else {
								global.PauseButtonSpeed = remappedBind;
							}
						}
						
						if choice == 1 {
							if !gamepad_is_connected(global.Player1Con) {
								global.SelectKeySpeed = remappedBind;
							} else {
								global.SelectButtonSpeed = remappedBind;
							}
						}
					#endregion
				}
				
				if opt == 5 {
					#region //Con Speed 1
						if choice == 0 {
							if !gamepad_is_connected(global.Player1Con) {
								global.LeftKeySpeed = remappedBind;
							} else {
								global.LeftPadSpeed = remappedBind;
							}
						}
						
						if choice == 1 {
							if !gamepad_is_connected(global.Player1Con) {
								global.RightKeySpeed = remappedBind;
							} else {
								global.RightPadSpeed = remappedBind;
							}
						}
						
						if choice == 2 {
							if !gamepad_is_connected(global.Player1Con) {
								global.UpKeySpeed = remappedBind;
							} else {
								global.UpPadSpeed = remappedBind;
							}
						}
						
						if choice == 3 {
							if !gamepad_is_connected(global.Player1Con) {
								global.DownKeySpeed = remappedBind;
							} else {
								global.DownPadSpeed = remappedBind;
							}
						}
						
						if choice == 4 {
							if !gamepad_is_connected(global.Player1Con) {
								global.JumpKeySpeed = remappedBind;
							} else {
								global.JumpButtonSpeed = remappedBind;
							}
						}
						
						if choice == 5 {
							if !gamepad_is_connected(global.Player1Con) {
								global.ActionKeySpeed = remappedBind;
							} else {
								global.ActionButtonSpeed = remappedBind;
							}
						}
					#endregion
				}
				
				if opt == 6 {
					#region //Con Speed 2
						if choice == 0 {
							if !gamepad_is_connected(global.Player1Con) {
								global.Action1KeySpeed = remappedBind;
							} else {
								global.Action1ButtonSpeed = remappedBind;
							}
						}
						
						if choice == 1 {
							if !gamepad_is_connected(global.Player1Con) {
								global.Action2KeySpeed = remappedBind;
							} else {
								global.Action2ButtonSpeed = remappedBind;
							}
						}
						
						if choice == 2 {
							if !gamepad_is_connected(global.Player1Con) {
								global.Action3KeySpeed = remappedBind;
							} else {
								global.Action3ButtonSpeed = remappedBind;
							}
						}
						
						if choice == 3 {
							if !gamepad_is_connected(global.Player1Con) {
								global.Action4KeySpeed = remappedBind;
							} else {
								global.Action4ButtonSpeed = remappedBind;
							}
						}
					#endregion
				}
				
				if opt == 7 {
					#region //Con Action 1
						if choice == 0 {
							if !gamepad_is_connected(global.Player1Con) {
								global.LeftKeyAction = remappedBind;
							} else {
								global.LeftPadAction = remappedBind;
							}
						}
						
						if choice == 1 {
							if !gamepad_is_connected(global.Player1Con) {
								global.RightKeyAction = remappedBind;
							} else {
								global.RightPadAction = remappedBind;
							}
						}
						
						if choice == 2 {
							if !gamepad_is_connected(global.Player1Con) {
								global.UpKeyAction = remappedBind;
							} else {
								global.UpPadAction = remappedBind;
							}
						}
						
						if choice == 3 {
							if !gamepad_is_connected(global.Player1Con) {
								global.DownKeyAction = remappedBind;
							} else {
								global.DownPadAction = remappedBind;
							}
						}
						
						if choice == 4 {
							if !gamepad_is_connected(global.Player1Con) {
								global.LightKeyAction = remappedBind;
							} else {
								global.LightButtonAction = remappedBind;
							}
						}
						
						if choice == 5 {
							if !gamepad_is_connected(global.Player1Con) {
								global.MediumKeyAction = remappedBind;
							} else {
								global.MediumButtonAction = remappedBind;
							}
						}
					#endregion
				}
				
				if opt == 8 {
					#region //Con Action 2
						if choice == 0 {
							if !gamepad_is_connected(global.Player1Con) {
								global.HeavyKeyAction = remappedBind;
							} else {
								global.HeavyButtonAction = remappedBind;
							}
						}
						
						if choice == 1 {
							if !gamepad_is_connected(global.Player1Con) {
								global.DashKeyAction = remappedBind;
							} else {
								global.DashButtonAction = remappedBind;
							}
						}
						
						if choice == 2 {
							if !gamepad_is_connected(global.Player1Con) {
								global.SuperDashKeyAction = remappedBind;
							} else {
								global.SuperDashButtonAction = remappedBind;
							}
						}
						
						if choice == 3 {
							if !gamepad_is_connected(global.Player1Con) {
								global.ParryKeyAction = remappedBind;
							} else {
								global.ParryButtonAction = remappedBind;
							}
						}
						
						if choice == 4 {
							if !gamepad_is_connected(global.Player1Con) {
								global.ChargeKeyAction = remappedBind;
							} else {
								global.ChargeButtonAction = remappedBind;
							}
						}
					#endregion
				}
			}
		} else {
			changeBindY = lerp(changeBindY, 500, 0.2);
		}
	#endregion
} else {
	setY = lerp(setY, 500, 0.2);
	leftSpikesX = lerp(leftSpikesX, 0, 0.1);
	
	if setY >= 499.5 {
		if room == rm_TitleNormal {
			if !instance_exists(obj_TitleCursor) {
				instance_create_depth(640 / 2, 360 / 2, depth, obj_TitleCursor);
				global.TitleOpt = "MAIN MENU";
			}
		}
		
		if room == rm_OptionsHead {
			with(instance_create_depth(-100000, 0, depth, obj_RoomTransitionBasic)) {
				target_rm = rm_TitleHead;
			}
		}
		
		instance_destroy();
	}
}