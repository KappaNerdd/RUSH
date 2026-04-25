display_set_gui_size(768, 432);


var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _playX = 0;
var _playY = 0;

if instance_exists(obj_Player) {
	_playX = obj_Player.x;
	_playY = obj_Player.y;
}

var _relX = _playX - _camX;
var _relY = _playY - _camY;


if _relX <= 100 {
	image_alpha = lerp(image_alpha, 0.5, 0.5);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}


if instance_exists(obj_Player) {
	var _boost = personalBoost;
	var _maxBoost = obj_Player.maxBoostEnergy;

	var _rushMode = obj_Player.rushModeTimer;
	var _maxRushMode = obj_Player.rushModeFrames;
	
	var _sprCol = 3;
	
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 98 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 108 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 118 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 128 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 138 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 148 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 158 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 168 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 178 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 188 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 198 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 208 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 218 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 228 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 238 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 248 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 258 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 268 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 278 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(boostSprite, _sprCol, 14 + newX, 288 + newY, 1.5, 1.5, 0, c_black, image_alpha);
	
	
	if obj_Player.camShakeTimer > 0 && obj_Player.boost {
		if !global.SimplifyVFX {
			var shake = power(4, 2) * 0.1;
			
			newX = xMove + random_range(-shake, shake);
			newY = 50 + random_range(-shake, shake);
		}
	} else {
		newX = xMove + 0;
		newY = 50;
	}
	
	if !obj_Player.rushMode or _boost < _maxBoost - 1 {
		if _boost <= 100 {
			draw_sprite_ext(boostEmblem, 0, 11 + newX, 68 + newY, 1.5, 1.5, 0, c_black, image_alpha);
			draw_sprite_ext(boostEmblem, 0, 14 + newX, 65 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		} else if _boost > 100 && _boost < 200 {
			if emblemSpeed < 2 {
				emblemSpeed += 1 / 6;
			}
		
			if emblemSpeed >= 2 {
				emblemSpeed = 0;
			}
			
			draw_sprite_ext(boostEmblem, emblemSpeed, 11 + newX, 68 + newY, 1.5, 1.5, 0, c_black, image_alpha);
			draw_sprite_ext(boostEmblem, emblemSpeed, 14 + newX, 65 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		} else if _boost >= 200 && _boost < _maxBoost - 1 {
			if emblemSpeed < 4 {
				emblemSpeed += 1 / 8;
			}
		
			if emblemSpeed >= 4 {
				emblemSpeed = 0;
			}
			
			draw_sprite_ext(boostEmblem, emblemSpeed, 11 + newX, 68 + newY, 1.5, 1.5, 0, c_black, image_alpha);
			draw_sprite_ext(boostEmblem, emblemSpeed, 14 + newX, 65 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		}
	} else if obj_Player.rushMode && _boost >= _maxBoost - 1 {
		emblemSpeed += emblemSpeedRush;
	
		if obj_Player.rushModeTimer >= 150 {
			emblemSpeedRush = 1 / 2;
		} else if obj_Player.rushModeTimer >= 100 && obj_Player.rushModeTimer < 150 {
			emblemSpeedRush = 1 / 4;
		} else if obj_Player.rushModeTimer >= 50 && obj_Player.rushModeTimer < 100 {
			emblemSpeedRush = 1 / 8;
		} else {
			emblemSpeedRush = 1 / 12;
		}
	
	
		if emblemSpeed >= 4 {
			emblemSpeed = 0;
		}
		
		draw_sprite_ext(rushEmblem, emblemSpeed, 11 + newX, 68 + newY, 1.5, 1.5, 0, c_black, image_alpha);
		draw_sprite_ext(rushEmblem, emblemSpeed, 14 + newX, 65 + newY, 1.5, 1.5, 0, c_white, image_alpha);
	}

	var _top = spr_BoostMeterBackBottom;
	var _mid = spr_BoostMeterBackMid;
	var _bottom = spr_Speedometer;
	var _speedMeter = abs(obj_Player.vel);
	
	if abs(obj_Player.vel) >= 30 {
		_speedMeter = 30;
	}
	
	if global.MIND or global.PlayerChar == 0 {
		_bottom = spr_SpeedometerHead;
	}
	
	draw_sprite_ext(_bottom, _speedMeter, 2 + newX, 153 + newY, 1, 1, 0, c_black, image_alpha);
	draw_sprite_ext(_bottom, _speedMeter, 5 + newX, 150 + newY, 1, 1, 0, c_white, image_alpha);
	
	var _mainSize = 2.5;

	if !obj_Player.rushMode or _boost < _maxBoost - 1 or _bar1SizeC > 1.5 {
		#region //Boost Bar 1
			draw_sprite_ext(boostSprite, 0, 17 + newX, 95 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 100 {
				_bar1SizeA = _mainSize;
			} else if _boost >= 100 {
				if _bar1SizeA > 1.5 {
					_bar1SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 95 + newY, _bar1SizeA, _bar1SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 200 {
				_bar1SizeB = _mainSize;
			} else if _boost >= 200 {
				if _bar1SizeB > 1.5 {
					_bar1SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 95 + newY, _bar1SizeB, _bar1SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 299 {
				_bar1SizeC = _mainSize;
			} else if _boost >= 299 {
				if _bar1SizeC > 1.5 {
					_bar1SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 95 + newY, _bar1SizeC, _bar1SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 2
			draw_sprite_ext(boostSprite, 0, 17 + newX, 105 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 95 {
				_bar2SizeA = _mainSize;
			} else if _boost >= 95 {
				if _bar2SizeA > 1.5 {
					_bar2SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 105 + newY, _bar2SizeA, _bar2SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 195 {
				_bar2SizeB = _mainSize;
			} else if _boost >= 195 {
				if _bar2SizeB > 1.5 {
					_bar2SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 105 + newY, _bar2SizeB, _bar2SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 295 {
				_bar2SizeC = _mainSize;
			} else if _boost >= 295 {
				if _bar2SizeC > 1.5 {
					_bar2SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 105 + newY, _bar2SizeC, _bar2SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 3
			draw_sprite_ext(boostSprite, 0, 17 + newX, 115 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 90 {
				_bar3SizeA = _mainSize;
			} else if _boost >= 90 {
				if _bar3SizeA > 1.5 {
					_bar3SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 115 + newY, _bar3SizeA, _bar3SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 190 {
				_bar3SizeB = _mainSize;
			} else if _boost >= 190 {
				if _bar3SizeB > 1.5 {
					_bar3SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 115 + newY, _bar3SizeB, _bar3SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 290 {
				_bar3SizeC = _mainSize;
			} else if _boost >= 290 {
				if _bar3SizeC > 1.5 {
					_bar3SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 115 + newY, _bar3SizeC, _bar3SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 4
			draw_sprite_ext(boostSprite, 0, 17 + newX, 125 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 85 {
				_bar4SizeA = _mainSize;
			} else if _boost >= 85 {
				if _bar4SizeA > 1.5 {
					_bar4SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 125 + newY, _bar4SizeA, _bar4SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 185 {
				_bar4SizeB = _mainSize;
			} else if _boost >= 185 {
				if _bar4SizeB > 1.5 {
					_bar4SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 125 + newY, _bar4SizeB, _bar4SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 285 {
				_bar4SizeC = _mainSize;
			} else if _boost >= 285 {
				if _bar4SizeC > 1.5 {
					_bar4SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 125 + newY, _bar4SizeC, _bar4SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 5
			draw_sprite_ext(boostSprite, 0, 17 + newX, 135 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 80 {
				_bar5SizeA = _mainSize;
			} else if _boost >= 80 {
				if _bar5SizeA > 1.5 {
					_bar5SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 135 + newY, _bar5SizeA, _bar5SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 180 {
				_bar5SizeB = _mainSize;
			} else if _boost >= 180 {
				if _bar5SizeB > 1.5 {
					_bar5SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 135 + newY, _bar5SizeB, _bar5SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 280 {
				_bar5SizeC = _mainSize;
			} else if _boost >= 280 {
				if _bar5SizeC > 1.5 {
					_bar5SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 135 + newY, _bar5SizeC, _bar5SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 6
			draw_sprite_ext(boostSprite, 0, 17 + newX, 145 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 75 {
				_bar6SizeA = _mainSize;
			} else if _boost >= 75 {
				if _bar6SizeA > 1.5 {
					_bar6SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 145 + newY, _bar6SizeA, _bar6SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 175 {
				_bar6SizeB = _mainSize;
			} else if _boost >= 175 {
				if _bar6SizeB > 1.5 {
					_bar6SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 145 + newY, _bar6SizeB, _bar6SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 275 {
				_bar6SizeC = _mainSize;
			} else if _boost >= 275 {
				if _bar6SizeC > 1.5 {
					_bar6SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 145 + newY, _bar6SizeC, _bar6SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 7
			draw_sprite_ext(boostSprite, 0, 17 + newX, 155 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 70 {
				_bar7SizeA = _mainSize;
			} else if _boost >= 70 {
				if _bar7SizeA > 1.5 {
					_bar7SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 155 + newY, _bar7SizeA, _bar7SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 170 {
				_bar7SizeB = _mainSize;
			} else if _boost >= 170 {
				if _bar7SizeB > 1.5 {
					_bar7SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 155 + newY, _bar7SizeB, _bar7SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 270 {
				_bar7SizeC = _mainSize;
			} else if _boost >= 270 {
				if _bar7SizeC > 1.5 {
					_bar7SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 155 + newY, _bar7SizeC, _bar7SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 8
			draw_sprite_ext(boostSprite, 0, 17 + newX, 165 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 65 {
				_bar8SizeA = _mainSize;
			} else if _boost >= 65 {
				if _bar8SizeA > 1.5 {
					_bar8SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 165 + newY, _bar8SizeA, _bar8SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 165 {
				_bar8SizeB = _mainSize;
			} else if _boost >= 165 {
				if _bar8SizeB > 1.5 {
					_bar8SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 165 + newY, _bar8SizeB, _bar8SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 265 {
				_bar8SizeC = _mainSize;
			} else if _boost >= 265 {
				if _bar8SizeC > 1.5 {
					_bar8SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 165 + newY, _bar8SizeC, _bar8SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 9
			draw_sprite_ext(boostSprite, 0, 17 + newX, 175 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 60 {
				_bar9SizeA = _mainSize;
			} else if _boost >= 60 {
				if _bar9SizeA > 1.5 {
					_bar9SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 175 + newY, _bar9SizeA, _bar9SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 160 {
				_bar9SizeB = _mainSize;
			} else if _boost >= 160 {
				if _bar9SizeB > 1.5 {
					_bar9SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 175 + newY, _bar9SizeB, _bar9SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 260 {
				_bar9SizeC = _mainSize;
			} else if _boost >= 260 {
				if _bar9SizeC > 1.5 {
					_bar9SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 175 + newY, _bar9SizeC, _bar9SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 10
			draw_sprite_ext(boostSprite, 0, 17 + newX, 185 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 55 {
				_bar10SizeA = _mainSize;
			} else if _boost >= 55 {
				if _bar10SizeA > 1.5 {
					_bar10SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 185 + newY, _bar10SizeA, _bar10SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 155 {
				_bar10SizeB = _mainSize;
			} else if _boost >= 155 {
				if _bar10SizeB > 1.5 {
					_bar10SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 185 + newY, _bar10SizeB, _bar10SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 255 {
				_bar10SizeC = _mainSize;
			} else if _boost >= 255 {
				if _bar10SizeC > 1.5 {
					_bar10SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 185 + newY, _bar10SizeC, _bar10SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 11
			draw_sprite_ext(boostSprite, 0, 17 + newX, 195 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 50 {
				_bar11SizeA = _mainSize;
			} else if _boost >= 50 {
				if _bar11SizeA > 1.5 {
					_bar11SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 195 + newY, _bar11SizeA, _bar11SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 150 {
				_bar11SizeB = _mainSize;
			} else if _boost >= 150 {
				if _bar11SizeB > 1.5 {
					_bar11SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 195 + newY, _bar11SizeB, _bar11SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 250 {
				_bar11SizeC = _mainSize;
			} else if _boost >= 250 {
				if _bar11SizeC > 1.5 {
					_bar11SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 195 + newY, _bar11SizeC, _bar11SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 12
			draw_sprite_ext(boostSprite, 0, 17 + newX, 205 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 45 {
				_bar12SizeA = _mainSize;
			} else if _boost >= 45 {
				if _bar12SizeA > 1.5 {
					_bar12SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 205 + newY, _bar12SizeA, _bar12SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 145 {
				_bar12SizeB = _mainSize;
			} else if _boost >= 145 {
				if _bar12SizeB > 1.5 {
					_bar12SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 205 + newY, _bar12SizeB, _bar12SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 245 {
				_bar12SizeC = _mainSize;
			} else if _boost >= 245 {
				if _bar12SizeC > 1.5 {
					_bar12SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 205 + newY, _bar12SizeC, _bar12SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 13
			draw_sprite_ext(boostSprite, 0, 17 + newX, 215 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 40 {
				_bar13SizeA = _mainSize;
			} else if _boost >= 40 {
				if _bar13SizeA > 1.5 {
					_bar13SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 215 + newY, _bar13SizeA, _bar13SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 140 {
				_bar13SizeB = _mainSize;
			} else if _boost >= 140 {
				if _bar13SizeB > 1.5 {
					_bar13SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 215 + newY, _bar13SizeB, _bar13SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 240 {
				_bar13SizeC = _mainSize;
			} else if _boost >= 240 {
				if _bar13SizeC > 1.5 {
					_bar13SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 215 + newY, _bar13SizeC, _bar13SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 14
			draw_sprite_ext(boostSprite, 0, 17 + newX, 225 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 35 {
				_bar14SizeA = _mainSize;
			} else if _boost >= 35 {
				if _bar14SizeA > 1.5 {
					_bar14SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 225 + newY, _bar14SizeA, _bar14SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 135 {
				_bar14SizeB = _mainSize;
			} else if _boost >= 135 {
				if _bar14SizeB > 1.5 {
					_bar14SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 225 + newY, _bar14SizeB, _bar14SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 235 {
				_bar14SizeC = _mainSize;
			} else if _boost >= 235 {
				if _bar14SizeC > 1.5 {
					_bar14SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 225 + newY, _bar14SizeC, _bar14SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 15
			draw_sprite_ext(boostSprite, 0, 17 + newX, 235 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 30 {
				_bar15SizeA = _mainSize;
			} else if _boost >= 30 {
				if _bar15SizeA > 1.5 {
					_bar15SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 235 + newY, _bar15SizeA, _bar15SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 130 {
				_bar15SizeB = _mainSize;
			} else if _boost >= 130 {
				if _bar15SizeB > 1.5 {
					_bar15SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 235 + newY, _bar15SizeB, _bar15SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 230 {
				_bar15SizeC = _mainSize;
			} else if _boost >= 230 {
				if _bar15SizeC > 1.5 {
					_bar15SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 235 + newY, _bar15SizeC, _bar15SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 16
			draw_sprite_ext(boostSprite, 0, 17 + newX, 245 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 25 {
				_bar16SizeA = _mainSize;
			} else if _boost >= 25 {
				if _bar16SizeA > 1.5 {
					_bar16SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 245 + newY, _bar16SizeA, _bar16SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 125 {
				_bar16SizeB = _mainSize;
			} else if _boost >= 125 {
				if _bar16SizeB > 1.5 {
					_bar16SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 245 + newY, _bar16SizeB, _bar16SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 225 {
				_bar16SizeC = _mainSize;
			} else if _boost >= 225 {
				if _bar16SizeC > 1.5 {
					_bar16SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 245 + newY, _bar16SizeC, _bar16SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 17
			draw_sprite_ext(boostSprite, 0, 17 + newX, 255 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 20 {
				_bar17SizeA = _mainSize;
			} else if _boost >= 20 {
				if _bar17SizeA > 1.5 {
					_bar17SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 255 + newY, _bar17SizeA, _bar17SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 120 {
				_bar17SizeB = _mainSize;
			} else if _boost >= 120 {
				if _bar17SizeB > 1.5 {
					_bar17SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 255 + newY, _bar17SizeB, _bar17SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 220 {
				_bar17SizeC = _mainSize;
			} else if _boost >= 220 {
				if _bar17SizeC > 1.5 {
					_bar17SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 255 + newY, _bar17SizeC, _bar17SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 18
			draw_sprite_ext(boostSprite, 0, 17 + newX, 265 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 15 {
				_bar18SizeA = _mainSize;
			} else if _boost >= 15 {
				if _bar18SizeA > 1.5 {
					_bar18SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 265 + newY, _bar18SizeA, _bar18SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 115 {
				_bar18SizeB = _mainSize;
			} else if _boost >= 115 {
				if _bar18SizeB > 1.5 {
					_bar18SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 265 + newY, _bar18SizeB, _bar18SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 215 {
				_bar18SizeC = _mainSize;
			} else if _boost >= 215 {
				if _bar18SizeC > 1.5 {
					_bar18SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 265 + newY, _bar18SizeC, _bar18SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 19
			draw_sprite_ext(boostSprite, 0, 17 + newX, 275 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 10 {
				_bar19SizeA = _mainSize;
			} else if _boost >= 10 {
				if _bar19SizeA > 1.5 {
					_bar19SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 275 + newY, _bar19SizeA, _bar19SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 110 {
				_bar19SizeB = _mainSize;
			} else if _boost >= 110 {
				if _bar19SizeB > 1.5 {
					_bar19SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 275 + newY, _bar19SizeB, _bar19SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 210 {
				_bar19SizeC = _mainSize;
			} else if _boost >= 210 {
				if _bar19SizeC > 1.5 {
					_bar19SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 275 + newY, _bar19SizeC, _bar19SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
		#region //Boost Bar 20
			draw_sprite_ext(boostSprite, 0, 17 + newX, 285 + newY, 1.5, 1.5, 0, c_white, image_alpha);
			
			if _boost < 1 {
				_bar20SizeA = _mainSize;
			} else if _boost >= 1 {
				if _bar20SizeA > 1.5 {
					_bar20SizeA -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 1, 17 + newX, 285 + newY, _bar20SizeA, _bar20SizeA, 0, c_white, image_alpha);
			}
			
			if _boost < 101 {
				_bar20SizeB = _mainSize;
			} else if _boost >= 101 {
				if _bar20SizeB > 1.5 {
					_bar20SizeB -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 2, 17 + newX, 285 + newY, _bar20SizeB, _bar20SizeB, 0, c_white, image_alpha);
			}
			
			if _boost < 201 {
				_bar20SizeC = _mainSize;
			} else if _boost >= 201 {
				if _bar20SizeC > 1.5 {
					_bar20SizeC -= 0.1;
				}
				
				draw_sprite_ext(boostSprite, 3, 17 + newX, 285 + newY, _bar20SizeC, _bar20SizeC, 0, c_white, image_alpha);
			}
		#endregion
		
	} else if obj_Player.rushMode && _boost >= _maxBoost - 1 && _bar1SizeC <= 1.5 {
		var _sprCol = 3;
	
		if rushCol {
			_sprCol = 4;
		} else {
			_sprCol = 3;
		}
		
		draw_sprite_ext(spr_RainSplash, 0, 47 + newX, 303 + newY, 1, 110 / _maxRushMode * _rushMode, 180, c_black, image_alpha);
		draw_sprite_ext(spr_RainSplash, 0, 50 + newX, 300 + newY, 1, 110 / _maxRushMode * _rushMode, 180, global.fullRGB, image_alpha);
	
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 95 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 105 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 115 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 125 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 135 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 145 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 155 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 165 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 175 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 185 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 195 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 205 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 215 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 225 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 235 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 245 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 255 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 265 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 275 + newY, 1.5, 1.5, 0, c_white, image_alpha);
		draw_sprite_ext(boostSprite, _sprCol, 17 + newX, 285 + newY, 1.5, 1.5, 0, c_white, image_alpha);
	}
}