getCharacterControls();

var _menu = gallArt;
	
switch(galleries[galleryChoice]) {
	case "gall_Art":
		_menu = gallArt;
	break;
	
	case "gall_FanArt":
		_menu = gallFanArt;
	break;
	
	case "gall_Concept":
		_menu = gallConcept;
	break;
	
	case "gall_Unused":
		_menu = gallUnused;
	break;
	
	case "gall_Cats":
		_menu = gallCats;
	break;
}

var _array = array_length(_menu) - 1;

#region //Animations
	if colTimer > 0 {
		colTimer--;
	} else {
		colTimer = 10 * 60;
		colChoice = !colChoice;
	}

	if colChoice {
		colNum = lerp(colNum, 1, 0.025);
	} else {
		colNum = lerp(colNum, 0, 0.01);
	}
	
	if zoomChoice {
		zoomAlpha = lerp(zoomAlpha, 0, 0.1);
	} else {
		zoomAlpha = lerp(zoomAlpha, 1, 0.1);
		zoomed = lerp(zoomed, 0, 0.2);
		moveX = lerp(moveX, 0, 0.2);
		moveY = lerp(moveY, 0, 0.2);
	}
	
	if rightArrow {
		rightFrames += 1 / 3;
		
		if rightFrames >= 5 {
			rightFrames = 0;
			rightArrow = false;
		}
	}
	
	if leftArrow {
		leftFrames += 1 / 3;
		
		if leftFrames >= 5 {
			leftFrames = 0;
			leftArrow = false;
		}
	}
	
	gallX = lerp(gallX, -330 * galleryChoice, 0.1);
	extraX = lerp(extraX, 400 * artChoice, 0.1);
#endregion

if !instance_exists(obj_RoomTransParent) {
	#region //Movement
		if right_Key or left_Key {
			if !zoomChoice {
				moveTimer--;
			}
		} else {
			moveTimer = 1;
		}
		
		if moveTimer <= 0 {
			moveTimer = moveFrames;
			obj_SFXManager.homingLockOn = true;
			
			if chosenGallery {
				if right_Key {
					rightArrow = true;
					rightFrames = 0;
					
					if artChoice < _array {
						artChoice++;
					} else {
						artChoice = 0;
					}
				}
			
				if left_Key {
					leftArrow = true;
					leftFrames = 0;
					
					if artChoice > 0 {
						artChoice--;
					} else {
						artChoice = _array;
					}
				}
			} else {
				if right_Key {
					rightArrow = true;
					rightFrames = 0;
					
					if galleryChoice < array_length(galleries) - 1 {
						galleryChoice++;
					} else {
						galleryChoice = 0;
					}
				}
				
				if left_Key {
					leftArrow = true;
					leftFrames = 0;
					
					if galleryChoice > 0 {
						galleryChoice--;
					} else {
						galleryChoice = array_length(galleries) - 1;
					}
				}
			}
		}
		
		if artChoice > _array {
			artChoice = _array;
		}
	#endregion
	
	#region //Selection
		if jump_Key {
			if !chosenGallery {
				chosenGallery = true;
				obj_SFXManager.homingLockOn = true;
			} else {
				if !zoomChoice {
					zoomChoice = true;
					obj_SFXManager.clench = true;
				}
			}
		}
	#endregion
	
	#region //Cancel
		if action_Key {
			obj_SFXManager.UNDERTALEBombFly = true;
			
			if zoomChoice {
				zoomChoice = false;
			} else {
				if chosenGallery {
					chosenGallery = false;
				} else {
					scr_MainMenuTrans("gallery");
					set_song_ingame(noone, 30);
				}
			}
		}
	#endregion
	
	#region //Zooming
		var _thresh = 400;
		var _spd = 3;
	
		if zoomChoice {
			if action2_Key_Held {
				_spd = 5;
			}
				
			moveX += _spd * (left_Key - right_Key);
			moveY += _spd * (up_Key - down_Key);
			
			
			if moveX >= _thresh {
				moveX = _thresh;
			} else if moveX <= -_thresh {
				moveX = -_thresh;
			}
			
			if moveY >= _thresh {
				moveY = _thresh;
			} else if moveY <= -_thresh {
				moveY = -_thresh;
			}
			
			if action1_Key_Held {
				if zoomed < 2 {
					zoomed += 0.01;
				}
			}
			
			if action3_Key_Held {
				if zoomed > 0 {
					zoomed -= 0.01;
				}
			}
		}
	#endregion
}