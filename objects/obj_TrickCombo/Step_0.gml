//Change Scale BS

if !global.SimplifyVFX {
	if personalTrick >= 6 {
		iconFrames += iconAnim;
		
		if iconFrames >= 4 {
			iconFrames = 0;
		}
	} else {
		iconFrames = 0;
	}
}

//Check Icon Position
if completeSpinTimer > 0 {
	if personalTrick >= 1 { //Icon 1
		startI1X = lerp(startI1X, textX - 15 + lengthdir_x(50, 150), 0.25);
		startI1Y = lerp(startI1Y, textY - 15 + lengthdir_y(50, 150), 0.25);
	}
	
	if personalTrick >= 2 { //Icon 2
		startI2X = lerp(startI2X, textX - 15 + lengthdir_x(50, 210), 0.25);
		startI2Y = lerp(startI2Y, textY - 15 + lengthdir_y(50, 210), 0.25);
	}
	
	if personalTrick >= 3 { //Icon 3
		startI3X = lerp(startI3X, textX - 15 + lengthdir_x(50, 270), 0.25);
		startI3Y = lerp(startI3Y, textY - 15 + lengthdir_y(50, 270), 0.25);
	}
	
	if personalTrick >= 4 { //Icon 4
		startI4X = lerp(startI4X, textX - 15 + lengthdir_x(50, 330), 0.25);
		startI4Y = lerp(startI4Y, textY - 15 + lengthdir_y(50, 330), 0.25);
	}
	
	if personalTrick >= 5 { //Icon 5
		startI5X = lerp(startI5X, textX - 15 + lengthdir_x(50, 390), 0.25);
		startI5Y = lerp(startI5Y, textY - 15 + lengthdir_y(50, 390), 0.25);
	}
	
	if personalTrick >= 6 { //Icon 6
		startI6X = lerp(startI6X, textX - 15 + lengthdir_x(50, 450), 0.25);
		startI6Y = lerp(startI6Y, textY - 15 + lengthdir_y(50, 450), 0.25);
	}
}

//Normal Bull
if !completed && !died {
	if personalTrick < obj_Player.rushTrickCombo {
		personalTrick = obj_Player.rushTrickCombo;
	}
}

//Completing
if !died {
	with(obj_Player) {
		if rushTrickFinish or altFinish {
			other.completed = true;
		}
	}
}

if completed {
	if completeSpinTimer > 0 {
		completeSpinTimer -= 1;
	}
	
	if completeSpinTimer <= 0 {
		if changeAngle < 15 {
			changeAngle += 1;
		}
		
		#region //Icon 1
			if icon1Angle > -120 {
				icon1Angle -= changeAngle;
		
				startI1X = textX - 15 + lengthdir_x(50, icon1Angle);
				startI1Y = textY - 15 + lengthdir_y(50, icon1Angle);
			} else if icon1Angle <= -120 {
				if startI1X > 8 {
					startI1X -= 15;
				}
				
				if startI1X <= 8 && !icon1Boost {
					if giveScore {
						scr_GivePoints(100);
					}
					
					icon1Boost = true;
						
					if !obj_Player.rushMode {
						obj_Player.boostEnergy += 10;
						obj_SFXManager.funkinFav = true;
					} else {
						obj_Player.rushModeTimer = obj_Player.rushModeFrames;
						obj_SFXManager.rushModeTrick = true;
					}
				}
		
				if startI1Y > 100 {
					startI1Y -= 0.25;
				}
			}
		#endregion
	
		#region //Icon 2
			if icon2Angle > -120 {
				icon2Angle -= changeAngle;
		
				startI2X = textX - 15 + lengthdir_x(50, icon2Angle);
				startI2Y = textY - 15 + lengthdir_y(50, icon2Angle);
			} else if icon2Angle <= -120 {
				if startI2X > 8 {
					startI2X -= 15;
				}
				
				if startI2X <= 8 && !icon2Boost {
					if giveScore {
						scr_GivePoints(200);
					}
					
					icon2Boost = true;
						
					if !obj_Player.rushMode {
						obj_Player.boostEnergy += 10;
						obj_SFXManager.funkinFav = true;
					} else {
						obj_Player.rushModeTimer = obj_Player.rushModeFrames;
						obj_SFXManager.rushModeTrick = true;
					}
				}
		
				if startI2Y > 100 {
					startI2Y -= 0.25;
				}
			}
		#endregion
	
		#region //Icon 3
			if personalTrick >= 3 {
				if icon3Angle > -120 {
					icon3Angle -= changeAngle;
		
					startI3X = textX - 15 + lengthdir_x(50, icon3Angle);
					startI3Y = textY - 15 + lengthdir_y(50, icon3Angle);
				} else if icon3Angle <= -120 {
					if startI3X > 8 {
						startI3X -= 15;
					}
					
					if startI3X <= 8 && !icon3Boost {
						if giveScore {
							scr_GivePoints(400);
						}
						
						icon3Boost = true;
						
						if !obj_Player.rushMode {
							obj_Player.boostEnergy += 10;
							obj_SFXManager.funkinFav = true;
						} else {
							obj_Player.rushModeTimer = obj_Player.rushModeFrames;
							obj_SFXManager.rushModeTrick = true;
						}
					}
		
					if startI3Y > 100 {
						startI3Y -= 0.25;
					}
				}
			}
		#endregion
	
		#region //Icon 4
			if personalTrick >= 4 {
				if icon4Angle > -120 {
					icon4Angle -= changeAngle;
		
					startI4X = textX - 15 + lengthdir_x(50, icon4Angle);
					startI4Y = textY - 15 + lengthdir_y(50, icon4Angle);
				} else if icon4Angle <= -120 {
					if startI4X > 8 {
						startI4X -= 15;
					}
					
					if startI4X <= 8 && !icon4Boost {
						if giveScore {
							scr_GivePoints(800);
						}
						
						icon4Boost = true;
						
						if !obj_Player.rushMode {
							obj_Player.boostEnergy += 10;
							obj_SFXManager.funkinFav = true;
						} else {
							obj_Player.rushModeTimer = obj_Player.rushModeFrames;
							obj_SFXManager.rushModeTrick = true;
						}
					}
		
					if startI4Y > 100 {
						startI4Y -= 0.25;
					}
				}
			}
		#endregion
	
		#region //Icon 5
			if personalTrick >= 5 {
				if icon5Angle > -120 {
					icon5Angle -= changeAngle;
		
					startI5X = textX - 15 + lengthdir_x(50, icon5Angle);
					startI5Y = textY - 15 + lengthdir_y(50, icon5Angle);
				} else if icon5Angle <= -120 {
					if startI5X > 8 {
						startI5X -= 15;
					}
					
					if startI5X <= 8 && !icon5Boost {
						if giveScore {
							scr_GivePoints(1600);
						}
						
						icon5Boost = true;
						
						if !obj_Player.rushMode {
							obj_Player.boostEnergy += 10;
							obj_SFXManager.funkinFav = true;
						} else {
							obj_Player.rushModeTimer = obj_Player.rushModeFrames;
							obj_SFXManager.rushModeTrick = true;
						}
					}
		
					if startI5Y > 100 {
						startI5Y -= 0.25;
					}
				}
			}
		#endregion
	
		#region //Icon 6
			if personalTrick >= 6 {
				if icon6Angle > -120 {
					icon6Angle -= changeAngle;
		
					startI6X = textX - 15 + lengthdir_x(50, icon6Angle);
					startI6Y = textY - 15 + lengthdir_y(50, icon6Angle);
				} else if icon6Angle <= -120 {
					if startI6X > 8 {
						startI6X -= 15;
					}
					
					if startI6X <= 8 && !icon6Boost {
						if giveScore {
							scr_GivePoints(3200);
						}
						
						icon6Boost = true;
						
						if !obj_Player.rushMode {
							obj_Player.boostEnergy += 10;
							obj_SFXManager.funkinFav = true;
						} else {
							obj_Player.rushModeTimer = obj_Player.rushModeFrames;
							obj_SFXManager.rushModeTrick = true;
						}
					}
		
					if startI6Y > 100 {
						startI6Y -= 0.25;
					}
				}
			}
		#endregion
	}
	
	if personalTrick == 1 {
		if startI1X <= 8 {
			if completeTimer > 0 {
				completeTimer -= 1;
			}
		}
	} else 
	
	if personalTrick == 2 {
		if startI2X <= 8 {
			if completeTimer > 0 {
				completeTimer -= 1;
			}
		}
	} else 
	
	if personalTrick == 3 {
		if startI3X <= 8 {
			if completeTimer > 0 {
				completeTimer -= 1;
			}
		}
	} else 
	
	if personalTrick == 4 {
		if startI4X <= 8 {
			if completeTimer > 0 {
				completeTimer -= 1;
			}
		}
	} else 
	
	if personalTrick == 5 {
		if startI5X <= 8 {
			if completeTimer > 0 {
				completeTimer -= 1;
			}
		}
	} else 
	
	if personalTrick >= 6 {
		if startI6X <= 8 {
			if completeTimer > 0 {
				completeTimer -= 1;
			}
		}
	}
	
	if completeTimer <= 0 {
		numberScale = lerp(numberScale, 0, 0.1);
	}
	
	if numberScale <= 0 {
		instance_destroy();
	}
}


//Dying
if !completed {
	with(obj_Player) {
		if !rampRing {
			other.died = true;
		}
	}
	
	numberScale = lerp(numberScale, 2, 0.1);
}

if died {
	if !global.DisableHUD {
		if !global.SimplifyVFX {
			dyingTimer -= 1;
		
			if dyingTimer <= 0 {
				dyingTimer = 1;
			
				visible = !visible;
			}
		}
	}
	
	diedTimer -= 1;
	
	if diedTimer <= 0 {
		instance_destroy();
	}
	
	addedY += 0.5;
	
	textY += addedY;
	
	startI1Y += random_range(0.5, 5);
	startI2Y += random_range(0.5, 5);
	startI3Y += random_range(0.5, 5);
	startI4Y += random_range(0.5, 5);
	startI5Y += random_range(0.5, 5);
	startI6Y += random_range(0.5, 5);
} else {
	visible = !global.DisableHUD;
}