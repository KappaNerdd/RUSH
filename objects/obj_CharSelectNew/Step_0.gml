getCharacterControls();

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}

if !finished {
	#region //Image Alpha
		image_alpha = lerp(image_alpha, 0.35, 0.05);
		arrowAlpha = lerp(arrowAlpha, 1, 0.05);
		
		if charStats or charMoves {
			charY = lerp(charY, 1200, 0.1);
		} else {
			charY = lerp(charY, 0, 0.1);
		}
	#endregion
	
	#region	//Movement & Animation
		bottomShitY = lerp(bottomShitY, 500, 0.1);
		
		if !switchChar && !confirmed {
			#region //Move Shit
				if right_Key && !checkUniversalMoves && !askGirly {
					do {
				        if global.SelectedPlayer < global.PlayerNum - 1 {
							global.SelectedPlayer++;
						} else {
							global.SelectedPlayer = 1;
						}
				    } until (global.PlayerSelection[global.SelectedPlayer][1]); //Skip unplayable characters
					
					obj_SFXManager.menuPop = true;
					switchChar = true;
					ballAngle = 0;
					iconAngle = 360;
					ballScale = 0;
					arrowRight = true;
					
					charSpriteAlpha = 0;
					charSpriteX = 0;
				} else if left_Key && !checkUniversalMoves && !askGirly {
					do {
				        if global.SelectedPlayer > 1 {
							global.SelectedPlayer--;
						} else {
							global.SelectedPlayer = global.PlayerNum - 1;
						}
				    } until (global.PlayerSelection[global.SelectedPlayer][1]); //Skip unplayable characters
					
					obj_SFXManager.menuPop = true;
					switchChar = true;
					ballAngle = 0;
					iconAngle = 360;
					ballScale = 0;
					arrowLeft = true;
					
					charSpriteAlpha = 0;
					charSpriteX = 0;
				}
			#endregion
			
			#region //White Ball
				if !global.SimplifyVFX {
					whiteBallFrames += whiteBallAnimation;
				}
		
				if whiteBallFrames >= 4 {
					whiteBallFrames = 0;
				}
			#endregion
		} else {
			whiteBallFrames = 4;
		}
		
		#region //Sonic Rush Spikes
			if !global.SimplifyVFX {
				srSpikesFrames += srSpikesAnimation;
			}
		
			if srSpikesFrames >= 19 {
				srSpikesFrames = 0;
			}
			
			srSpikesX = lerp(srSpikesX, 0, 0.1);
			srSpikesNegaX = lerp(srSpikesNegaX, 768, 0.1);
		#endregion
	#endregion
	
	#region //Switch Char & Confirm Char
		if switchChar {
			if (arrowRight or arrowLeft) && !cancelled {
				arrowFrames += arrowAnim;
				
				if arrowFrames >= 5 {
					switchChar = false;
					arrowRight = false;
					arrowLeft = false;
					arrowFrames = 0;
				}
			}
			
			charNameY = lerp(charNameY, 250, 0.2);
		} else if switchCost {
			if (arrowDown or arrowUp) && !cancelled {
				arrowFrames += arrowAnim;
				
				if arrowFrames >= 5 {
					switchCost = false;
					arrowUp = false;
					arrowDown = false;
					arrowFrames = 0;
				}
			}
		} else {
			charNameY = lerp(charNameY, 0, 0.25);
			arrowFrames = 0;
		}
		
		if lockAnim {
			if !global.SimplifyVFX {
				lockFrames += lockAnimation;
			}
			
			if lockFrames >= 5 {
				lockAnim = false;
				lockFrames = 0;
			}
		} else {
			lockFrames = 0;
		}
		
		if !confirmed {
			if (jump_Key or pause_Key) && !cancelled && !checkUniversalMoves {
				if !askGirly {
					if !global.PlayerSelection[global.SelectedPlayer][2] && global.PlayerSelection[global.SelectedPlayer][4][global.PlayerCostume][0] {
						if !global.PlayerSelection[global.SelectedPlayer][3] {
							global.Girly = global.PlayerSelection[global.PlayerChar][0][1];
							confirmed = true;
							
							if !global.SimplifyVFX {
								confirmedOpacity = 1;
							}
								
							obj_SFXManager.funkinCheckpoint = true;
							set_song_ingame(noone, 90);
						} else {
							askGirly = true;
							obj_SFXManager.funkinFav = true;
						}
					} else {
						lockAnim = true;
						obj_SFXManager.funkinLocked = true;
					}
				} else {
					global.Girly = askGirlySelect;
					askGirly = false;
					confirmed = true;
					
					if !global.SimplifyVFX {
						confirmedOpacity = 1;
					}
					
					obj_SFXManager.funkinCheckpoint = true;
					set_song_ingame(noone, 90);
				}
			}
			
			if askGirly {
				if right_Key_Once {
					if askGirlySelect == 0 {
						askGirlySelect = 1;
					} else {
						askGirlySelect = 0;
					}
					
					obj_SFXManager.menuTap = true;
				}
				
				if left_Key_Once {
					if askGirlySelect == 0 {
						askGirlySelect = 1;
					} else {
						askGirlySelect = 0;
					}
					
					obj_SFXManager.menuTap = true;
				}
			}
			
			if !cancelled {
				if action_Key {
					if !askGirly {
						cancelled = true;
						obj_SFXManager.UNDERTALEBombFly = true;
						set_song_ingame(noone, 30);
						global.SelectedPlayer = setPlayer;
					} else {
						askGirly = false;
						obj_SFXManager.menuTap = true;
					}
				}
			} else {
				cancelledTimer--;
				
				if cancelledTimer <= 0 {
					finished = true;
				}
			}
			
			confirmedTimer = confirmedFrames;
		} else {
			checkStats = false;
			checkMoves = false;
			checkUniversalMoves = false;
			
			if confirmedTimer > 0 {
				confirmedTimer--;
			} else {
				finished = true;
			}
		}
	#endregion
	
	#region //Change Char Costume
		var _costumeLength = array_length(global.PlayerSelection[global.SelectedPlayer][4]);
		
		if _costumeLength > 1 {
			if !switchCost && !confirmed && !checkUniversalMoves && !askGirly {
				if up_Key {
					switchCost = true;
					arrowUp = true;
					charY = 1200;
					charSpriteAlpha = 0;
					charSpriteX = 0;
					
					obj_SFXManager.homingLockOn = true;
					
					if global.SelectedCostume > 0 {
						global.SelectedCostume--;
					} else {
						global.SelectedCostume = _costumeLength - 1;
					}
				}
				
				if down_Key {
					switchCost = true;
					arrowDown = true;
					charY = 1200;
					charSpriteAlpha = 0;
					charSpriteX = 0;
					
					obj_SFXManager.homingLockOn = true;
					
					if global.SelectedCostume < _costumeLength - 1 {
						global.SelectedCostume++;
					} else {
						global.SelectedCostume = 0;
					}
				}
			}
		}
		
		if global.SelectedCostume > _costumeLength - 1 {
			global.SelectedCostume = _costumeLength - 1;
		}
	#endregion
	
	#region //Char Stats & Moves
		if !confirmed && !cancelled {
			if action3_Key {
				obj_SFXManager.funkinFav = true;
			
				if !checkStats {
					checkStats = true;
					checkMoves = false;
				} else {
					checkStats = false;
				}
			}
		
			if action1_Key {
				obj_SFXManager.funkinFav = true;
			
				if !checkMoves {
					checkMoves = true;
					checkStats = false;
				} else {
					checkMoves = false;
				}
			}
			
			if checkMoves {
				if action2_Key {
					obj_SFXManager.funkinFav = true;
					
					if !checkUniversalMoves {
						checkUniversalMoves = true;
					} else {
						checkUniversalMoves = false;
					}
				}
			}
		}
		
		if checkUniversalMoves {
			checkUniversalMovesX = lerp(checkUniversalMovesX, -480, 0.1);
			
			if !checkMoves {
				checkUniversalMoves = false;
			}
		} else {
			checkUniversalMovesX = lerp(checkUniversalMovesX, 0, 0.1);
		}
	#endregion
	
	#region	//Extra Shit
		whiteBallX = lerp(whiteBallX, whiteBallXBase + (-120 * global.SelectedPlayer), 0.1);
		charX = lerp(charX, charBaseX + (-700 * global.SelectedPlayer), 0.1);
		charSpriteAlpha = lerp(charSpriteAlpha, 1, 0.05);
		charSpriteX = lerp(charSpriteX, 50, 0.05);
		global.PlayerChar = global.SelectedPlayer;
		global.PlayerCostume = global.SelectedCostume;
		
		if ballScale < 1.5 {
			ballScale += 0.075;
		}
		
		if otherBallScale < 1.6 {
			otherBallScale += 0.075;
		}
		
		if !global.SimplifyVFX {
			ballAngle -= 8;
		}
			
		iconAngle = lerp(iconAngle, 0, 0.1);
		charBoxY = lerp(charBoxY, 20, 0.1);
		
		charNameX -= 1;
		
		if charNameX <= -384 {
			charNameX = 384;
		}
	#endregion
} else {
	image_alpha = lerp(image_alpha, 0, 0.1);
	bottomShitY = lerp(bottomShitY, 732, 0.1);
	srSpikesX = -100;
	srSpikesNegaX = 868;
	ballScale = lerp(ballScale, 0, 0.1);
	otherBallScale = lerp(otherBallScale, 0, 0.1);
	charBoxY = lerp(charBoxY, -40, 0.1);
	charNameY = lerp(charNameY, -60, 0.1);
	charY = lerp(charY, 1200, 0.1);
	iconAngle = lerp(iconAngle, 360, 0.1);
	arrowAlpha = lerp(arrowAlpha, 0, 0.1);
	charSpriteX = lerp(charSpriteX, 0, 0.1);
	charSpriteAlpha = lerp(charSpriteAlpha, 0, 0.1);
	checkStatsX = lerp(checkStatsX, 0, 0.1);
	checkUniversalMovesX = lerp(checkUniversalMovesX, 0, 0.1);
	
	if ballScale <= 0.5 {
		if !instance_exists(obj_RoomTransParent) {
			with(instance_create_depth(-1000000, 0, 0, obj_RoomTransitionSEGAMenu)) {
				target_rm = rm_FreeplayNew;
			}
		}
	}
}

#region //BPM Animations
	if global.RealBPM > 0 {
		global.RealBPM -= delta_time / 1000000;
	} else {
		if !global.SimplifyVFX {
			nameScale = 1;
			arrowScale = 1.75;
			circleScale = 1.5;
			whiteCircleScale = 2;
			whiteBarScale = 1.25;
			iconScale = 0.25;
		}
		
		global.RealBPM = global.ConvertedBPM;
	}
	
	nameScale = lerp(nameScale, 0.9, 0.1);
	arrowScale = lerp(arrowScale, 1.25, 0.1);
	circleScale = lerp(circleScale, 1.25, 0.1);
	whiteCircleScale = lerp(whiteCircleScale, 1.5, 0.1);
	whiteBarScale = lerp(whiteBarScale, 1.13, 0.1);
	iconScale = lerp(iconScale, 0, 0.1);
#endregion

confirmedOpacity = lerp(confirmedOpacity, 0, 0.05);
charSpriteFrames += charSpriteAnim;

var _gloChar = global.PlayerSelection[global.SelectedPlayer];

if charSpriteFrames >= _gloChar[4][global.PlayerCostume][2] + 1 {
	charSpriteFrames = 0;
}

if checkStats or checkMoves {
	checkStatsX = lerp(checkStatsX, 670, 0.1);
} else {
	checkStatsX = lerp(checkStatsX, 0, 0.1);
}

if askGirly {
	askGirlyY = lerp(askGirlyY, 136, 0.1);
} else {
	askGirlyY = lerp(askGirlyY, 432, 0.1);
}
