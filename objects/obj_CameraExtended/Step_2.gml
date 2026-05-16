#region //Old
	/*//Exit if no player or if a cutscene is playing
	if !instance_exists(obj_Player) or global.Death {
		exit;
	}

	var _effect = 0.2;

	//Get camera size
	var _camWidth = camera_get_view_width(view_camera[0]);
	var _camHeight = camera_get_view_height(view_camera[0]);

	//Get camera target coords
	var _camX = floor(following.x - _camWidth / 2);
	var _camY = floor(following.y - _camHeight / 2);

	if !global.ExtendCamera {
		_camX = floor((following.x + _changeX) - _camWidth / 2);
		_camY = floor((following.y + _changeY) - _camHeight / 2);
	
		if lookTimer == 0 {
			var _bot = 0;
		
			//Move Camera Up if Looking Up
			if obj_Player.look_up {
				_bot = -1;
			}

			//Move Camera Down if Crouching
			if obj_Player.ducking {
				_bot = 1;
			}
		
			_changeY = lerp(_changeY, 250 * _bot, _effect / 2);
		}
	} else if global.ExtendCamera && following == obj_Player {
		var _dir = 1;
	
		if obj_Player.vel > 0 {
			_dir = 1;
		} else if obj_Player.vel < 0 {
			_dir = -1;
		}
	
		_camX = floor(((following.x + _changeX) - _camWidth / 2));
		_camY = floor(((following.y + _changeY) - _camHeight / 2));
	
		if !blackBars {
			_changeX = lerp(_changeX, (obj_Player.vel * obj_Player.angleCos) * 10, 0.05);
		} else {
			_changeX = lerp(_changeX, 0, 0.05);
		}
	
		if obj_Player.yspd >= 0 {
			if !obj_Player.ground {
				_changeY = lerp(_changeY, obj_Player.yspd * 8, 0.05);
			}
		} else {
			_changeY = lerp(_changeY, 0, 0.1);
		}
	
		if obj_Player.ground {
			if !blackBars {
				_changeY = lerp(_changeY, (obj_Player.vel * -obj_Player.angleSin) * 8, 0.05);
			} else {
				_changeY = lerp(_changeY, 0, 0.05);
			}
		
			if lookTimer == 0 {
				var _bot = 0;
		
				//Move Camera Up if Looking Up
				if obj_Player.look_up {
					_bot = -1;
				}

				//Move Camera Down if Crouching
				if obj_Player.ducking {
					_bot = 1;
				}
		
				_changeY = lerp(_changeY, 250 * _bot, _effect / 2);
			}
		}
	}



	if (gamepad_is_connected(global.Player2Con) && instance_exists(obj_Partner)) && !gamepad_is_connected(global.Player3Con) {
		_camX = mean(obj_Player.x - _camWidth / 2, obj_Partner.x - _camWidth / 2);
		_camY = mean(obj_Player.y - _camHeight / 2, obj_Partner.y - _camHeight / 2);
	} else if (gamepad_is_connected(global.Player2Con) && instance_exists(obj_Partner)) && (gamepad_is_connected(global.Player3Con) && instance_exists(obj_Partner2)) {
		_camX = mean(obj_Player.x - _camWidth / 2, obj_Partner.x - _camWidth / 2, obj_Partner2.x - _camWidth / 2);
		_camY = mean(obj_Player.y - _camHeight / 2, obj_Partner.y - _camHeight / 2, obj_Partner2.y - _camHeight / 2);
	} else {
		_camX = floor(obj_Player.x - _camWidth / 2);
		_camY = floor(obj_Player.y - _camHeight / 2);
	}

	//Constrain camera to room borders
	_camX = clamp(_camX, 0, room_width - _camWidth);
	_camY = clamp(_camY, 0, room_height - _camHeight);

	//Shake
	if shakeValue > 0 && shakeTimer <= 0 {
		shakeValue -= 0.05;
	}

	if shakeTimer > 0 {
		shakeTimer -= 1;
	}

	//Apply Shake
	if shakePowerTimer > 0 {
		shakePowerTimer -= 1;
	}

	if shakePowerTimer <= 0 {
		shakePowerTimer = shakePowerFrames;
		shakePower = -shakePower;
	}
	
	var shake = shakePower * shakeValue;
	//_camX += random_range(-shake, shake);
	_camY += shake;

	camX2 = lerp(camX2, ingameCamX, camSpd);
	camY2 = lerp(camY2, ingameCamY, camSpd);

	if blackBars {
		blackBarsPos = lerp(blackBarsPos, 1, camSpd)
	} else {
		blackBarsPos = lerp(blackBarsPos, 0, 0.1);
	}

	camera_set_view_size(view_camera[0], global.CamWidth * camX2, global.CamHeight * camY2);

	if !global.Death {
		//Looking Timer
		if (obj_Player.look_up or obj_Player.ducking) && lookTimer > 0 {
			lookTimer -= 1;
		}

		if lookTimer <= 0 {
			lookTimer = 0;
		}

		if !obj_Player.look_up && !obj_Player.ducking {
			lookTimer = lookFrames;
		}
	}

	if resetTimer > 0 {
		resetTimer -= 1;
	}

	if inactiveTimer > 0 {
		inactiveTimer -= 1;
	}

	if inactiveTimer <= 0 or resetTimer > 0 {
		if global.ExtendCamera {
			finalCamX += (_camX - finalCamX) * camTrailSpd;
			finalCamY += (_camY - finalCamY) * camTrailSpd;
		} else {
			finalCamX += (_camX - finalCamX);
			finalCamY += (_camY - finalCamY);
		}
	}


	//Set camera coords
	camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

	x = finalCamX;
	y = finalCamY;

	if instance_exists(obj_CutsceneParent) {
		instance_change(obj_CameraCutscene, true);
	}*/
#endregion

#region //New
	#region //Timers
		var _effect = 0.2;
	
		#region //Stop Cam
			if resetTimer > 0 {
				resetTimer -= 1;
			}

			if inactiveTimer > 0 {
				inactiveTimer -= 1;
			}
		#endregion
		
		#region //Scroll Up & Down
			var _bot = 0;
		
			if !camDown && !camUp {
				lookTimer = lookFrames;
			} else {
				if lookTimer > 0 {
					lookTimer--;
				} else {
					if camUp {
						_bot = -1;
					} else if camDown {
						_bot = 1;
					}
				}
			}
		#endregion
		
		#region //Shake
			//Countdown
			if shakeTimer > 0 {
				shakeTimer--;
			} else {
				if shakeValue > 0 {
					shakeValue -= 0.05;
				}
			}

			//Apply Shake
			if shakePowerTimer > 0 {
				shakePowerTimer--;
			} else {
				shakePowerTimer = shakePowerFrames;
				shakePower = -shakePower;
			}
		#endregion
		
	#endregion

	#region //Variables
		//Get Camera Size
		var _camWidth = camera_get_view_width(view_camera[0]);
		var _camHeight = camera_get_view_height(view_camera[0]);
		
		#region //Check if it's Following the Player
			if following == obj_Player {
				var _char = following;
				var _dir = sign(_char.vel);
				var _extraX = (_char.vel * _char.angleCos) * 10;
				var _extraY = (_char.vel * -_char.angleSin) * 8;
				var _airY = _char.yspd * 7;
				var _fxMod = 3;
				
				if !global.ExtendCamera {
					_extraX = 0;
					_extraY = 0;
					_airY = 0;
				}
				
				if !camHori {
					_extraX = 0;
				}
				
				if !camVerti {
					_extraY = 0;
				}
				
				//Up & Down Camera Pan
				camDown = _char.ducking;
				camUp = _char.look_up;
				
				//Rotate Camera
				if followAngle {
					camAngle = scr_Approach(camAngle, round(-_char.angle), 10);
				} else {
					camAngle = scr_Approach(camAngle, 0, 10);
				}
				
				//Player Movement Camera
				if _char.ground {
					if _char.vel != 0 {
						if !blackBars {
							_changeX = lerp(_changeX, _extraX, _effect / _fxMod);
							_changeY = lerp(_changeY, _extraY, _effect / _fxMod);
						} else {
							_changeX = lerp(_changeX, 0, _effect / _fxMod);
							_changeY = lerp(_changeY, 0, _effect / _fxMod);
						}
					} else {
						_changeX = lerp(_changeX, 0, _effect / _fxMod);
						_changeY = scr_Approach(_changeY, 200 * _bot, 10);
					}
				} else {
					_changeX = lerp(_changeX, _extraX, _effect / _fxMod);
					_changeY = lerp(_changeY, _airY, _effect / _fxMod);
				}
			} else if following == noone {
				var _fxMod = 3;
				
				_changeX = lerp(_changeX, 0, _effect / _fxMod);
				_changeY = lerp(_changeY, 0, _effect / _fxMod);
				camAngle = lerp(camAngle, 0, _effect / _fxMod);
				
				cutCamX = ease(cutCamX, targetCutX, targetEffect, easeType);
				cutCamY = ease(cutCamY, targetCutY, targetEffect, easeType);
			} else {
				var _fxMod = 3;
				
				_changeX = lerp(_changeX, 0, _effect / _fxMod);
				_changeY = lerp(_changeY, 0, _effect / _fxMod);
				camAngle = lerp(camAngle, 0, _effect / _fxMod);
			}
		#endregion
		
		//Get Camera Target Coordinates
		var _camX = floor((cutCamX + _changeX));
		var _camY = floor((cutCamY + _changeY));
		
		if following != noone {
			_camX = floor((following.x + _changeX) - _camWidth / 2);
			_camY = floor((following.y + _changeY) - _camHeight / 2);
		}
		
		//Constrain Camera to Room Borders
		_camX = clamp(_camX, 0, room_width - _camWidth);
		_camY = clamp(_camY, 0, room_height - _camHeight);
		
		//Shake Camera
		var _shake = shakePower * shakeValue;
		
		if shakeHori {
			_camX += _shake;
		}
		
		if shakeVerti {
			_camY += _shake;
		}
		
		//Set Camera Zoom
		camX2 = lerp(camX2, ingameCamX, barSpd);
		camY2 = lerp(camY2, ingameCamY, barSpd);
		
		camera_set_view_size(view_camera[0], global.CamWidth * camX2, global.CamHeight * camY2);
		
		//Set Camera Angle
		camera_set_view_angle(view_camera[0], camAngle);
		
		//Set Camera Coordinates
		if inactiveTimer <= 0 or resetTimer > 0 {
			var _moveX = (_camX - finalCamX) * camTrailSpd;
			var _moveY = (_camY - finalCamY) * camTrailSpd;
			
			if global.ExtendCamera {
				camTrailSpd = 0.4;
			} else {
				camTrailSpd = 1;
			}
			
			if !camHori {
				_moveX = 0;
			}
			
			if !camVerti {
				_moveY = 0;
			}
			
			finalCamX += _moveX;
			finalCamY += _moveY;
		}
		
		camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

		x = finalCamX;
		y = finalCamY;
		
		if camHori {
			baseX = _camX;
		}
		
		if camVerti {
			baseY = _camY;
		}
		
		//Cinematic Bars
		var _bar = 0;
		
		if blackBars {
			_bar = 1;
		} 
		
		blackBarsPos = lerp(blackBarsPos, _bar, barSpd);
	#endregion
#endregion