function scr_SemiSolidCheck(_x, _y) {
	var _rtrn = noone;
	
	if yspd >= 0 && place_meeting(_x, _y, obj_SemiSolid) {
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, obj_SemiSolid, _list, false);
		
		for(var i = 0; i < _listSize; i++) {
			var _listInst = _list[| i];
			
			if floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd) {
				_rtrn = _listInst;
				
				i = _listSize;
			}
		}
		
		ds_list_destroy(_list);
	}
	
	return _rtrn;
}

function scr_XCollision() {
	if !global.Death {
		#region //X Collision (Old)
			/*var _subPixel = 0.5;

			if place_meeting(x + vel, y, obj_Solid) {
				//First check if there is a slope to go up
				var _blockCheck = collision_rectangle(vel + bbox_left, y - 50, vel + bbox_right, y - 40, obj_Solid, true, true);
			
				if !_blockCheck {
					if (isSlope or railGrindCheck) {
						while(place_meeting(x + vel, y, obj_Solid)) {
							y -= _subPixel;
						}
					}
				} else { //If no slope, regular collision
					//Scoot up to wall precisely
					if !place_meeting(x + vel, y, obj_RailParent) {
						var _pixelCheck = _subPixel * sign(vel);
				
						while !place_meeting(x + _pixelCheck, y, obj_Solid) {
						   x += _pixelCheck;
						}
					
						vel = 0;
						groundSpeed = 0;
					}
				}   
			}
		
			//Slope collision
			downSlopeSemiSolid = noone;
		
			var _lineCheck = collision_rectangle(vel + bbox_left, y, vel + bbox_right, y + 85, obj_Solid, false, true);
		
			if yspd >= 0 && (isSlope or railGrindCheck) && ground && (!place_meeting(x + vel, y + 1, obj_Solid) && _lineCheck) {
				while(!place_meeting(x + vel, y + _subPixel, obj_Solid)) {
					y += _subPixel;
				}
			}
		
			x += vel;*/
		#endregion
	}
}

function scr_YCollision() {
	if !global.Death {
		#region //Other Special BS
			#region //Breakable Floor (Head)
				var _floor = instance_place(x, y + yspd + 5, obj_HeadFloorBreakable);
				var _ceiling = instance_place(x, y + yspd - 5, obj_HeadFloorBreakable);

				if _floor {
					if stomping or fallVel {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							instance_create_depth(_floor.x + 144, _floor.y + 80, depth, obj_HeadFloorPiece1);
							instance_create_depth(_floor.x + 149, _floor.y + 9, depth, obj_HeadFloorPiece2);
							instance_create_depth(_floor.x + 112, _floor.y + 14, depth, obj_HeadFloorPiece3);
							instance_create_depth(_floor.x + 44, _floor.y + 63, depth, obj_HeadFloorPiece4);
							instance_create_depth(_floor.x + 107, _floor.y + 23, depth, obj_HeadFloorPiece5);
							instance_create_depth(_floor.x + 116, _floor.y + 66, depth, obj_HeadFloorPiece6);
							instance_create_depth(_floor.x + 129, _floor.y + 54, depth, obj_HeadFloorPiece7);
							instance_create_depth(_floor.x + 80, _floor.y + 42, depth, obj_HeadFloorPiece8);
							instance_create_depth(_floor.x + 22, _floor.y + 22, depth, obj_HeadFloorPiece9);
							instance_create_depth(_floor.x + 5, _floor.y + 36, depth, obj_HeadFloorPiece10);
						}
		
						instance_destroy(_floor);
					}
				}
				
				
				if _ceiling {
					if yspd <= -12 {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							instance_create_depth(_ceiling.x + 144, _ceiling.y + 80, depth, obj_HeadFloorPiece1);
							instance_create_depth(_ceiling.x + 149, _ceiling.y + 9, depth, obj_HeadFloorPiece2);
							instance_create_depth(_ceiling.x + 112, _ceiling.y + 14, depth, obj_HeadFloorPiece3);
							instance_create_depth(_ceiling.x + 44, _ceiling.y + 63, depth, obj_HeadFloorPiece4);
							instance_create_depth(_ceiling.x + 107, _ceiling.y + 23, depth, obj_HeadFloorPiece5);
							instance_create_depth(_ceiling.x + 116, _ceiling.y + 66, depth, obj_HeadFloorPiece6);
							instance_create_depth(_ceiling.x + 129, _ceiling.y + 54, depth, obj_HeadFloorPiece7);
							instance_create_depth(_ceiling.x + 80, _ceiling.y + 42, depth, obj_HeadFloorPiece8);
							instance_create_depth(_ceiling.x + 22, _ceiling.y + 22, depth, obj_HeadFloorPiece9);
							instance_create_depth(_ceiling.x + 5, _ceiling.y + 36, depth, obj_HeadFloorPiece10);
						}
		
						instance_destroy(_ceiling);
					}
				}
			#endregion
			
			#region //Breakable Wall (Head)
				var _floor1 = instance_nearest(x + vel, y, obj_HeadWallBreakable);

				if distance_to_object(_floor1) <= 80 {
					if abs(vel) >= max_Speed or boost {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece1)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece2)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece3)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece4)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece5)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece6)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece7)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece8)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece9)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece10)) {
								xspd = other.vel;
							}
						}
		
						instance_destroy(_floor1);
					}
				}
			#endregion
			
			#region //Breakable Floor (Hometown)
				var _floor2 = instance_place(x, y + yspd + 5, obj_HometownBreakable);

				if _floor2 {
					if stomping or fallVel {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							instance_create_depth(_floor2.x, _floor2.y, depth, obj_HometownBreak1);
							instance_create_depth(_floor2.x + 10, _floor2.y + 4, depth, obj_HometownBreak2);
							instance_create_depth(_floor2.x + 38, _floor2.y, depth, obj_HometownBreak3);
							instance_create_depth(_floor2.x + 39, _floor2.y + 11, depth, obj_HometownBreak4);
						}
		
						instance_destroy(_floor2);
					}
				}
			#endregion
		#endregion
		
		#region //Y Collision (Old)
			/*var _subPixel = 0.5;
			var _clampYspd = max(0, yspd);
			var _list = ds_list_create();
			var _array = array_create(0);
		
			array_push(_array, obj_Solid, obj_SemiSolid, obj_RailParent);
		
			var _listSize = instance_place_list(x, y + 5 + _clampYspd + termVel, _array, _list, false);
		
			for(var i = 0; i < _listSize; i++) {
				var _listInst = _list[| i];
			
				if _listInst != forgetSemiSolid && (_listInst.yspd <= yspd or instance_exists(myFloorPlat)) && (_listInst.yspd > 0 or place_meeting(x, y + 5 + _clampYspd, _listInst)) {
					if (_listInst.object_index == obj_Solid or object_is_ancestor(_listInst.object_index, obj_Solid)) or floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd) {
						if !instance_exists(myFloorPlat) or _listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd or _listInst.bbox_top + _listInst.yspd <= bbox_bottom {
							myFloorPlat = _listInst;
						}
					}
				}
			}
		
			ds_list_destroy(_list);
		
			if instance_exists(myFloorPlat) && !place_meeting(x, y + termVel, myFloorPlat) && !place_meeting(x, y + termVel / 2, myFloorPlat) && !place_meeting(x, y + termVel / 2.5, myFloorPlat) {
				myFloorPlat = noone;
				isSlope = false;
				railGrindCheck = false;
			}
		
			if instance_exists(myFloorPlat) {
				while !place_meeting(x, y + _subPixel, myFloorPlat) && !place_meeting(x, y, obj_Solid) {
					y += _subPixel;
				}
			
				if ((myFloorPlat.object_index == obj_SemiSolid or object_is_ancestor(myFloorPlat.object_index, obj_SemiSolid)) or (myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent)) && railGrindCheckingTimer <= 0) {
					if railGrind {
						if railGrindCheckingTimer <= 0 {
							while place_meeting(x, y, myFloorPlat) {
								y -= _subPixel;
							}
						
							if !angleChecked {
								if global.Squash {
									extraXscale = 1.25;
								}
							
								if winningAngle != 0 {
									vel += yspd * 0.5 * -sign(sin(winningAngle));
								}
							
								scr_Landing(footStep);
							
								angleChecked = true;
							}
						
							yspd = 0;
							wallJumpVel = 0;
							ground = true;
							jumping = false;
							dJumping = false;
							rampRing = false;
							afterRailJump = false;
						}
					} else {
						while place_meeting(x, y, myFloorPlat) {
							y -= _subPixel;
						}
					
						if !angleChecked {
							if global.Squash {
								extraXscale = 1.25;
							}
						
							if winningAngle != 0 {
								vel += yspd * 0.5 * -sign(sin(winningAngle));
							}
						
							if myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent) {
								obj_SFXManager.railGrindOn = true;
							}
						
							scr_Landing(footStep);
							
							angleChecked = true;
						}
					
						yspd = 0;
						wallJumpVel = 0;
						ground = true;
						jumping = false;
						dJumping = false;
						rampRing = false;
						afterRailJump = false;
					}
				
					isSlope = false;
				
					if railGrindCheckingTimer <= 0 {
						if myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent) {
							railGrindCheck = true;
						} else {
							railGrindCheck = false;
						}
					}
				} else {
					if railGrind {
						if railGrindCheckingTimer <= 0 {
							while place_meeting(x, y, myFloorPlat) {
								y -= _subPixel;
							}
						
							if !angleChecked {
								if global.Squash {
									extraXscale = 1.25;
								}
							
								if winningAngle != 0 {
									vel += yspd * 0.5 * -sign(sin(winningAngle));
								}
							
								scr_Landing(footStep);
							
								angleChecked = true;
							}
						
							yspd = 0;
							wallJumpVel = 0;
							ground = true;
							jumping = false;
							dJumping = false;
							rampRing = false;
							afterRailJump = false;
						}
					} else {
						while place_meeting(x, y, myFloorPlat) {
							y -= _subPixel;
						}
					
						if !angleChecked {
							if global.Squash {
								extraXscale = 1.25;
							}
						
							if winningAngle != 0 {
								vel += yspd * 0.5 * -sign(sin(winningAngle));
							}
						
							scr_Landing(footStep);
							
							angleChecked = true;
						}
					
						yspd = 0;
						wallJumpVel = 0;
						ground = true;
						jumping = false;
						dJumping = false;
						rampRing = false;
						afterRailJump = false;
					}
				
					isSlope = true;
				
					if railGrindCheckingTimer <= 0 {
						if myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent) {
							railGrindCheck = true;
						} else {
							railGrindCheck = false;
						}
					}
				}
			
				y = floor(y);
				coyoteJumpTimer = coyoteJumpFrames;
			} else {
				ground = false;
				jumping = true;
			}
		
			if place_meeting(x, y + yspd, obj_Solid) && !place_meeting(x, y + yspd, obj_RailParent) && !ground && yspd < 0 {
				//Scoot up to wall precisely
				var _pixelCheck = _subPixel * sign(yspd);
		
				while !place_meeting(x, y + _pixelCheck, obj_Solid) {
					y += _pixelCheck;
				}
	
				//Bonk
				if yspd == 0 {
					yspd = 0;
				}
			
				yspd = 0;
			}
		
		
			#region //Old Y Collision
				/*var _subPixel = 0.5;
		
				if place_meeting(x, y + yspd, obj_Solid) && yspd > -1 {
					//Scoot up to wall precisely
					var _pixelCheck = _subPixel * sign(yspd);
		
					while !place_meeting(x, y + _pixelCheck, obj_Solid) {
						y += _pixelCheck;
					}

					//Bonk
					if yspd == 0 {
						yspd = 0;
					}
		
					if dJumping == true && ground == false {
						dJumping = true;
					}
	
					//Set gravity to collide
					yspd = 0;
					ground = true;
					jumping = false;
					dJumping = false;
					afterRailJump = false;
					rampRing = false;
		
				} else if place_meeting(x, y + yspd, obj_Solid) && ground == false {
					//Scoot up to wall precisely
					var _pixelCheck = _subPixel * sign(yspd);
		
					while !place_meeting(x, y + _pixelCheck, obj_Solid) {
						y += _pixelCheck;
					}
	
					//Bonk
					if yspd == 0 {
						yspd = 0;
					}
		
					yspd = 0;
				}

				//Check if touching a ground
				if place_meeting(x, y + 4, obj_Solid) && yspd > -1 {
					ground = true;
				} else {
					ground = false;
				}

				//If no ground, turn state to jumping without jumping
				if ground == false {
					jumping = true;
				}
			#endregion
		
			//Y position influenced by yspd variable
			y += yspd;
	
			//Gravity
			if gravTimer > 0 {
				gravTimer--;
			} else {
				yspd += grav;
			}
		
			//Terminal Velocity
			if yspd >= termVel { 
				yspd = termVel;
			}
		
			#region //Vel BS
				movePlatVel = 0;
			
				if instance_exists(myFloorPlat) {
					movePlatVel = myFloorPlat.vel;
				}
			
				if place_meeting(x + movePlatVel, y, obj_Solid) {
					var _subPixel = 0.5;
					var _pixelCheck = _subPixel * sign(movePlatVel);
				
					while !place_meeting(x + _pixelCheck, y, obj_Solid) {
						x += _pixelCheck;
					}
				
					movePlatVel = 0;
				}
			
				x += movePlatVel;
			#endregion
		
			#region //Yspd BS
				if instance_exists(myFloorPlat) && myFloorPlat.yspd != 0 {
					if myFloorPlat.yspd < 0 && place_meeting(x, y + myFloorPlat.yspd, obj_Solid) {
						if myFloorPlat.object_index == obj_SemiSolid or object_is_ancestor(myFloorPlat.object_index, obj_SemiSolid) {
							var _subPixel = 0.25;
					
							while place_meeting(x, y + myFloorPlat.yspd, obj_Solid) {
								y += _subPixel;
							}
					
							while place_meeting(x, y, obj_Solid) {
								y -= _subPixel
							}
					
							y = round(y);
						}
					
						global.Health = 0;
						global.Death = true;
					}
				}
			#endregion
		
			if instance_exists(myFloorPlat) && myFloorPlat.yspd != 0 {
				if !place_meeting(x, myFloorPlat.bbox_top, obj_Solid) && myFloorPlat.bbox_top >= bbox_bottom - 1 {
					y = myFloorPlat.bbox_top;
				}
			}*/
		#endregion
		
		#region //Special BS
			#region //Trinkets
				var _twinkList = ds_list_create();
				var _twinkLmao = instance_place_list(x, y, obj_Trinket, _twinkList, false);
				
				var _twink2List = ds_list_create();
				var _twink2 = instance_place_list(x, y, obj_LostTrinkets, _twink2List, false);
				
				if _twinkLmao > 0 && (invincibleTimer < 90 or !invincible) { //Y'know the meme
					for(var i = 0; i < _twinkLmao; i++) {
						global.Rings++;
						instance_create_depth(_twinkList[| i].x + 10, _twinkList[| i].y + 8, depth, obj_GOALRingSparkles);
					
						obj_SFXManager.funkinFav = true;
						
						if instance_exists(obj_Timer) {
							obj_Timer.trinket = true;
							obj_Timer.trinketFrames = 0;
							obj_Timer.trinketScale = 1.5;
						}
					
						with(instance_create_depth(-100000, y, -8, obj_TrinketUI)) {
							var _camX = camera_get_view_x(view_camera[0]);
							var _camY = camera_get_view_y(view_camera[0]);
						
							var _relX = _twinkList[| i].x - _camX;
							var _relY = _twinkList[| i].y - _camY;

							startX = _relX;
							startY = _relY;
						}
					
						instance_destroy(_twinkList[| i]);
					}
				}
				
				ds_list_destroy(_twinkList);
				
				//Lost ones
				if _twink2 > 0 && (invincibleTimer < 90 or !invincible) {
					for(var i = 0; i < _twink2; i++) {
						global.Rings++;
						instance_create_depth(_twink2List[| i].x + 10, _twink2List[| i].y + 8, depth, obj_GOALRingSparkles);
					
						obj_SFXManager.funkinFav = true;
						
						if instance_exists(obj_Timer) {
							obj_Timer.trinket = true;
							obj_Timer.trinketFrames = 0;
							obj_Timer.trinketScale = 1.5;
						}
						
						with(instance_create_depth(-100000, y, -8, obj_TrinketUI)) {
							var _camX = camera_get_view_x(view_camera[0]);
							var _camY = camera_get_view_y(view_camera[0]);
						
							var _relX = _twink2List[| i].x - _camX;
							var _relY = _twink2List[| i].y - _camY;

							startX = _relX;
							startY = _relY;
						}
					
						instance_destroy(_twink2List[| i]);
					}
				}
				
				ds_list_destroy(_twink2List);
			#endregion
			
			#region //Sprays
				var _sprays = instance_place(x, y, obj_JSRSecretSpray);
				
				if _sprays {
					with(_sprays) {
						if alive {
							event_user(0);
							obj_SFXManager.itemBreak = true;
						}
					}
				}
			#endregion
			
			#region //C90 Cassette
				var _c90 = instance_place(x, y, obj_C90Cassette);
				
				if _c90 {
					with(_c90) {
						if alive {
							event_user(0);
							obj_SFXManager.itemBreak = true;
							obj_SFXManager.pauseMenuSplash = true;
						}
					}
				}
			#endregion
			
			#region //Power-Ups
				var _power = instance_place(x, y, obj_PowerOrb);
				var _stomped = instance_find(obj_StompVFX, 0);
				
				if _power {
					if _power.active {
						with(_power) {
							event_user(0);
						}
	
						if yspd > 0 && !ground && !stomping && !fallVel {
							yspd = -4;
						}
					}
				}
				
				if _stomped != noone {
					with(_stomped) {
						var _otherPower = instance_place(x, y, obj_PowerOrb);
						
						if _otherPower && image_index >= 2 {
							if _otherPower.active {
								with(_otherPower) {
									event_user(0);
								}
							}
						}
					}
				}
			#endregion
			
			#region //Extra Life
				var _extraLife = instance_place(x, y, obj_CollectableExtraLife);
				
				if _extraLife {
					with (instance_create_depth(_extraLife.x, _extraLife.y, depth, obj_ExtraLifeSil)) {
						sprite_index = _extraLife.sprite_index;
						image_index = _extraLife.image_index;
					}
	
					if !global.Freeplay {
						global.PlayerExtraLives += 1;
						global.CollectedLives += 1;
						obj_PlayerExtraLives.lifeScale = 1.5;
						obj_SFXManager.funkinCheckpoint = true;
					} else {
						obj_SFXManager.rushModeGain = true;
						rushMode = true;
						boostEnergy = 300;
						rushModeTimer = rushModeFrames;
					}
					
					instance_destroy(_extraLife);
				}
			#endregion
			
			#region //Launcher Ramp
				var _ramp = PlayerCollisionObjectMain(x, y + 5, obj_Ramp);
				
				if _ramp && !global.Death {
					if !_ramp.launchConfirmed {
						if ground && abs(vel) >= max_Speed {
							if (PlayerCollisionLeftEdge(x - abs(vel), y, 0) && !PlayerCollisionRightEdge(x + abs(vel), y, 0)) or (!PlayerCollisionLeftEdge(x - abs(vel), y, 0) && PlayerCollisionRightEdge(x + abs(vel), y, 0)) {
								#region //Actual Function
									jumping = true;
									PlayerSetGround(false);
									angle = 0;
									slowSkid = false;
									
									if rushTrickFinish {
										rushTrickFinish = false;
										rushTrickCombo = 0;
									}
									
									if trick or altTrick {
										rushTrickCombo = 0;
										trick = false;
										altTrick = false;
									}
							
									obj_SFXManager.jumpDash = true;
									_ramp.launchConfirmed = true;
	
									scr_StopPlayerHurt();
		
									event_user(0);
									event_user(1);
									event_user(2);
									rampRing = true;
									realJumping = false;
							
									rushTrickTimer = 0;
									
									sideLaunch = true;
									upLaunch = false;
							
									if _ramp.giveScore {
										getScore = true;
										_ramp.giveScore = false;
									}
		
									if _ramp.launchVel > 0 {
										if vel < _ramp.launchVel {
											vel = _ramp.launchVel;
										}
									} else if _ramp.launchVel < 0 {
										if vel > _ramp.launchVel {
											vel = _ramp.launchVel;
										}
									}
							
									if _ramp.launchVel > 0 {
										if leftFacer {
											face_Left = false;
										} else {
											visXScale = 1;
										}
									} else if _ramp.launchVel < 0 {
										if leftFacer {
											face_Left = true;
										} else {
											visXScale = -1;
										}
									}
		
									yspd = _ramp.launchYspd;
								#endregion
							} else
							
							if jump_Key {
								#region //Actual Function
									jumping = true;
									PlayerSetGround(false);
									angle = 0;
									slowSkid = false;
									
									if rushTrickFinish {
										rushTrickFinish = false;
										rushTrickCombo = 0;
									}
									
									if trick or altTrick {
										rushTrickCombo = 0;
										trick = false;
										altTrick = false;
									}
							
									obj_SFXManager.jumpDash = true;
									obj_SFXManager.trickPanel = true;
									_ramp.launchConfirmed = true;
	
									scr_StopPlayerHurt();
		
									event_user(0);
									event_user(1);
									event_user(2);
									rampRing = true;
									realJumping = false;
							
									rushTrickTimer = 0;
									
									rainbowLaunch = true;
							
									if _ramp.giveScore {
										getScore = true;
										_ramp.giveScore = false;
										scr_BonusPoints(5000);
									}
		
									if _ramp.launchVel > 0 {
										if vel < _ramp.launchVel {
											vel = _ramp.launchVel;
										}
									} else if _ramp.launchVel < 0 {
										if vel > _ramp.launchVel {
											vel = _ramp.launchVel;
										}
									}
							
									if _ramp.launchVel > 0 {
										if leftFacer {
											face_Left = false;
										} else {
											visXScale = 1;
										}
									} else if _ramp.launchVel < 0 {
										if leftFacer {
											face_Left = true;
										} else {
											visXScale = -1;
										}
									}
		
									yspd = _ramp.launchYspd - 2;
								#endregion
							}
						}
					}
				}
			#endregion
			
			#region //Launcher Ring
				var _launchRing = instance_place(x, y, obj_LaunchRingColl);

				if _launchRing && !global.Death {
					if !_launchRing.launchConfirmed {
						_launchRing.launchConfirmed = true;
						
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
									
						if trick or altTrick {
							rushTrickCombo = 0;
							trick = false;
							altTrick = false;
						}
						
						ground = false;
						jumping = true;
						realJumping = false;
						PlayerSetGround(false);
						angle = 0;
						slowSkid = false;
						
						if !_launchRing.rainbow {
							obj_SFXManager.dashPanel = true;
							
							if _launchRing.launchYspd == 0 {
								sideLaunch = true;
								upLaunch = false;
							} else {
								upLaunch = true;
								sideLaunch = false;
							}
							
							rainbowLaunch = false;
						} else {
							obj_SFXManager.trickPanel = true;
							
							if _launchRing.giveScore {
								scr_BonusPoints(5000);
							}
							
							sideLaunch = false;
							upLaunch = false;
							rainbowLaunch = true;
						}
	
						x = _launchRing.x;
						y = _launchRing.y + 16;
		
						if _launchRing.giveScore {
							getScore = true;
							_launchRing.giveScore = false;
						} else {
							getScore = false;
						}
		
						event_user(0);
						event_user(1);
						event_user(2);
						
						rushTrickTimer = 0;
		
						can_MoveFULL = true;
						preTrickTimer = preTrickFrames;
	
						rampRing = true;
						
						if _launchRing.launchVel > 0 {
							if leftFacer {
								face_Left = false;
							} else {
								visXScale = 1;
							}
						} else if _launchRing.launchVel < 0 {
							if leftFacer {
								face_Left = true;
							} else {
								visXScale = -1;
							}
						}
						
						vel = _launchRing.launchVel;
						yspd = _launchRing.launchYspd;
						gravTimer = _launchRing.launchFrames;
						noMoveTimer = _launchRing.launchFrames;
					}
				}
			#endregion
			
			#region //Rail-Trick Collision
				var _block = instance_place(x, y, obj_RailTrickColl);

				if _block && jump_Key && railGrind && !global.Death {
					yspd = -10.5;
					ground = false;
					PlayerSetGround(false);
					jumping = true;
					rampRing = true;
					trickWait = 2;
					rainbowLaunch = true;
					realJumping = false;
					obj_SFXManager.trickPanel = true;
					
					rushTrickTimer = 0;
		
					if rushTrickFinish {
						rushTrickFinish = false;
						rushTrickCombo = 0;
					}
	
					if _block.giveScore {
						_block.giveScore = false;
						getScore = true;
						scr_BonusPoints(_block.bonus);
					}
				}
			#endregion
			
			#region //Rail-Stopper
				if PlayerCollisionObjectMain(x, y, obj_RailStopper) && railGrind && ground {
					railGrind = false;
					ground = false;
					PlayerSetGround(false);
					jumping = true;
					realJumping = false;
					obj_SFXManager.bump = true;
					
					yspd = -4;
					
					if vel > max_Speed {
						vel -= 4;
					}
					
					if vel < -max_Speed {
						vel += 4;
					}
				}
			#endregion
			
			#region //Boost Pad
				var _boost = instance_place(x, y, obj_BoostPad);

				if _boost && ground {
					scr_ControllerRumble();
					stomping = false;
					stomped = false;
					slowSkid = false;
					
					noMoveTimer = 30;
		
					if !leftFacer {
						visXScale = _boost.image_xscale;
					} else {
						if _boost.image_xscale == 1 {
							face_Left = false;
						} else if _boost.image_xscale == -1 {
							face_Left = true;
						}
					}
		
					if _boost.omega {
						if !_boost.soundHit {
							obj_SFXManager.boostPad = true;
							_boost.soundHit = true;
						}
				
						speedBreak = true;
			
						if _boost.image_xscale == 1 {
							if vel < full_Speed {
								vel = full_Speed;
							}
						} else if _boost.image_xscale == -1 {
							if vel > -full_Speed {
								vel = -full_Speed;
							}
						}
					} else {
						if !_boost.soundHit {
							obj_SFXManager.airDashSound = true;
							_boost.soundHit = true;
						}
					
						if _boost.image_xscale == 1 {
							if vel < max_Speed * 1.25 {
								vel = max_Speed * 1.25;
							}
						} else if _boost.image_xscale == -1 {
							if vel > -max_Speed * 1.25 {
								vel = -max_Speed * 1.25;
							}
						}
					}
				}
			#endregion
			
			#region //Springs
				var _spring = instance_place(x, y, obj_SpringParent);
			
				if _spring {
					if !_spring.active {
						obj_SFXManager.rushSpring = true;
						_spring.active = true;
						_spring.image_speed = 1;
						angle = 0;
		
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
									
						if trick or altTrick {
							rushTrickCombo = 0;
							trick = false;
							altTrick = false;
						}
						
						if _spring.hori {
							noMoveTimer = 30;
						}
						
						slowSkid = false;
						realJumping = false;
						
						if _spring.giveScore {
							getScore = true;
							_spring.giveScore = false;
						} else {
							getScore = false;
						}
						
						if _spring.launchYspd == 0 {
							sideLaunch = true;
							upLaunch = false;
						} else {
							upLaunch = true;
							sideLaunch = false;
						}
						
						rainbowLaunch = false;
						
						event_user(0);
						event_user(1);
						event_user(2);
						
						rushTrickTimer = 0;
					
						can_MoveFULL = true;
						preTrickTimer = preTrickFrames;
					
						if _spring.verti && !_spring.hori {
							yspd = _spring.launchYspd;
							rampRing = true;
							PlayerSetGround(false);
							bottomCollision = false;
							jumping = true;
						} else if _spring.hori && !_spring.verti {
							vel = _spring.launchVel;
							
							if _spring.launchVel > 0 {
								if leftFacer {
									face_Left = false;
								} else {
									visXScale = 1;
								}
							} else if _spring.launchVel < 0 {
								if leftFacer {
									face_Left = true;
								} else {
									visXScale = -1;
								}
							}
						} else if _spring.verti && _spring.hori {
							yspd = _spring.launchYspd;
							vel = _spring.launchVel;
							rampRing = true;
							jumping = true;
							PlayerSetGround(false);
							bottomCollision = false;
							
							if _spring.launchVel > 0 {
								if leftFacer {
									face_Left = false;
								} else {
									visXScale = 1;
								}
							} else if _spring.launchVel < 0 {
								if leftFacer {
									face_Left = true;
								} else {
									visXScale = -1;
								}
							}
						}
					}
				}
			#endregion
			
			#region //Trampoline
				var _tramp = instance_place(x, y, obj_Trampoline);
				
				if _tramp {
					if yspd >= 0 {
						obj_SFXManager.rushSpring = true;
						_tramp.active = true;
						_tramp.image_speed = 1;
						_tramp.image_index = 0;
						angle = 0;
						slowSkid = false;
						
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
									
						if trick or altTrick {
							rushTrickCombo = 0;
							trick = false;
							altTrick = false;
						}
						
						if _tramp.giveScore {
							getScore = true;
							_tramp.giveScore = false;
						} else {
							getScore = false;
						}
						
						upLaunch = true;
						sideLaunch = false;
						rainbowLaunch = false;
						realJumping = false;
						
						event_user(0);
						event_user(1);
						event_user(2);
						
						rampRing = true;
		
						rushTrickTimer = 0;
					
						can_MoveFULL = true;
						preTrickTimer = preTrickFrames;
						
						jumping = true;
						
						if ground {
							yspd = -normalJspd;
							PlayerSetGround(false);
						} else {
							PlayerSetGround(false);
							
							if yspd < 25 {
								yspd = -yspd;
							} else {
								yspd = -25;
							}
						}
					}
				}
			#endregion
			
			#region //Balloons
				var _balloon = instance_place(x, y, obj_Balloons);
				
				if _balloon {
					if !_balloon.popped {
						_balloon.popped = true;
						obj_SFXManager.balloonPop = true;
					
						scr_StopCharShit();
						scr_StopPlayerHurt();
						
						ground = false;
						jumping = true;
						realJumping = false;
						dJumping = false;
						airBoost = false;
						PlayerSetGround(false);
						angle = 0;
					
						if _balloon.cluster {
							if rushTrickFinish {
								rushTrickFinish = false;
								rushTrickCombo = 0;
							}
									
							if trick or altTrick {
								rushTrickCombo = 0;
								trick = false;
								altTrick = false;
							}
							
							event_user(0);
							event_user(1);
							event_user(2);
							rampRing = true;
							realJumping = false;
							
							if _balloon.giveScore {
								_balloon.giveScore = false;
								getScore = true;
								scr_GivePoints(1000);
							} else {
								getScore = false;
							}
		
							rushTrickTimer = 0;
							
							rainbowLaunch = true;
							
							can_MoveFULL = true;
							preTrickTimer = preTrickFrames;
							
							yspd = -10;
						} else {
							if _balloon.giveScore {
								_balloon.giveScore = false;
								getScore = true;
								scr_GivePoints(500);
							} else {
								getScore = false;
							}
							
							yspd = -8;
						}
					}
				}
			#endregion
			
			#region //Water Geyser
				var _geyser = instance_place(x, y, obj_WaterSpout);
				
				if _geyser && yspd >= 0 {
					scr_StopCharShit();
					scr_StopPlayerHurt();
					angle = 0;
					
					if rushTrickFinish {
						rushTrickFinish = false;
						rushTrickCombo = 0;
					}
									
					if trick or altTrick {
						rushTrickCombo = 0;
						trick = false;
						altTrick = false;
					}
					
					if _geyser.giveScore {
						_geyser.giveScore = false;
						getScore = true;
					} else {
						if yspd > 0 {
							getScore = false;
						}
					}
					
					obj_SFXManager.waterSpout = true;
					
					vel = 0;
					groundSpeed = 0;
					yspd = -15;
						
					ground = false;
					PlayerSetGround(false);
					jumping = true;
					rampRing = true;
					realJumping = false;
					
					rainbowLaunch = true;
					sideLaunch = false;
					upLaunch = false;
					
					event_user(0);
					event_user(1);
					event_user(2);
		
					rushTrickTimer = 0;
					
					can_MoveFULL = true;
					preTrickTimer = preTrickFrames;
				}
			#endregion
			
			#region //Pully
				var _pully = instance_place(x, y - 10, obj_Pully);

				if _pully {
					if !_pully.pulledDone {
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
									
						if trick or altTrick {
							rushTrickCombo = 0;
							trick = false;
							altTrick = false;
						}
						
						event_user(0);
						event_user(1);
						event_user(2);
						PlayerSetGround(false);
						jumping = true;
						realJumping = false;
						yspd = 0;
						vel = 0;
						groundSpeed = 0;
						slowSkid = false;
						
						obj_SFXManager.clench = true;
						scr_StopCharControls();
		
						array_push(_pully.pulledChars, id);
		
						rushTrickTimer = 0;
			
						preTrickTimer = preTrickFrames;
						
						can_Move = false;
						can_MoveFULL = false;
						_pully.pulled = true;
					}
				}
			#endregion
			
			#region //Spikes
				var _spikeDown = instance_place(x, y + 2, obj_Spikes);
				var _spikeUp = instance_place(x, y - 2, obj_Spikes);
				var _spikeLeft = instance_place(x - 4, y, obj_Spikes);
				var _spikeRight = instance_place(x + 2, y, obj_Spikes);
				
				if _spikeDown {
					if _spikeDown.image_angle == 0 && PlayerCollisionObjectBottom(x, y + 1, angle, maskMid, obj_Spikes) {
						scr_SpikeHurt();
					}
				}
				
				if _spikeUp {
					if _spikeUp.image_angle == 180 && PlayerCollisionObjectTop(x, y - sensorTopDistance - 60, angle, maskBig, obj_Spikes) && yspd < 0 {
						scr_SpikeHurt();
					}
				}
				
				if _spikeLeft {
					if _spikeLeft.image_angle == 270 && (PlayerCollisionObjectLeft(x - 3, y, angle, maskMid, obj_Spikes) or PlayerCollisionObjectLeft(x - 3, y - sensorTopDistance, angle, maskMid, obj_Spikes)) && vel <= 0 {
						scr_SpikeHurt();
					}
				}
				
				if _spikeRight {
					if _spikeRight.image_angle == 90 && (PlayerCollisionObjectRight(x + 2, y, angle, maskMid, obj_Spikes) or PlayerCollisionObjectRight(x + 2, y - sensorTopDistance, angle, maskMid, obj_Spikes)) && vel >= 0 {
						scr_SpikeHurt();
					}
				}
			#endregion
			
			#region //Checkpoint
				var _checkpoint = instance_nearest(x, y, obj_Checkpoint);
				
				if distance_to_object(_checkpoint) <= 100 && !_checkpoint.active {
					global.RespawnX = _checkpoint.x;
					global.RespawnY = _checkpoint.y;
	
					scr_BonusPoints(2000);
	
					if instance_exists(obj_Timer) {
						with (instance_create_depth(-100000000, y, depth, obj_CheckpointTimer)) {
							selfMinutes = global.minutes;
							selfSeconds = global.seconds;
						}
					}
	
					_checkpoint.sprColor = c_gray;
					_checkpoint.active = true;
					boostEnergy += 50;
	
					if rushMode {
						rushModeTimer = rushModeFrames;
						obj_SFXManager.rushModeTrick = true;
					}
	
					obj_SFXManager.rushCheckpoint = true;
	
					if global.Particles {
						repeat(20) {
							instance_create_depth(_checkpoint.x, _checkpoint.y, depth, obj_CheckpointPart);
						}
					}
				}
			#endregion
			
			#region //Rain (Unused)
				/*var _rain = instance_place(x, y, obj_Rain);
				
				if _rain {
					repeat(_rain.selRandom) {
						instance_create_depth(_rain.x, _rain.y + 20, _rain.depth, obj_RainSplash);
					}
	
					instance_destroy(_rain);
				}*/
			#endregion
			
			#region //Dying (Bottomless)
				var _death = instance_place(x, y, obj_KillColl);

				if _death && !global.Death {
					global.Death = true;
					global.Health = 0;
					scr_ScreenShake();
					scr_ControllerRumble();
					scr_LoseTrinkets(100);
	
					if instance_exists(obj_StageTrackerSpeed) {
						global.PRank = false;
					}
	
					if rushMode {
						rushMode = false;
						boostEnergy = 100;
						obj_SFXManager.rushModeLose = true;
					}
	
					event_user(0);
					event_user(1);
					event_user(2);
					event_user(3);
	
					sprite_index = sprDeath;
	
					if audio_is_playing(snd_Stomping) {
						audio_stop_sound(snd_Stomping);
					}
				}
			#endregion
			
			#region //Goal Collision
				var _goal = instance_place(x, y, obj_GOALColl);

				if _goal && !global.Death {
					if !_goal.goal {
						_goal.goal = true;
						speedBreak = false;
						speedBreakTimer = speedBreakFrames;
						enemyComboTimer = 1;
	
						event_user(0);
						event_user(1);
						event_user(2);
						event_user(3);
						scr_StopCharControls();
	
						with (instance_create_depth(-100000, 0, 0, obj_MoreBonus)) {
							_goal.bonus3 = 20000;
						}
						
						var _xMove = vel;
						
						if ground {
							_xMove = groundSpeed;
						}
	
						if _xMove > 0 && _xMove > boost_Speed {
							
							if !ground {
								vel = boost_Speed;
							} else {
								groundSpeed = boost_Speed;
							}
		
							if !leftFacer {
								visXScale = 1;
							} else {
								face_Left = false;
							}
						} else if _xMove < 0 && _xMove < -boost_Speed {
							if !ground {
								vel = -boost_Speed;
							} else {
								groundSpeed = -boost_Speed;
							}
		
							if !leftFacer {
								visXScale = -1;
							} else {
								face_Left = true;
							}
						}
	
						can_Move = false;
	
						set_song_ingame(noone, 180, 0);
	
						if ground {
							obj_SFXManager.slideSound = true;
						}
					}
				}
			#endregion
			
			#region //Damage Hazard Beam
				var _beam = instance_place(x, y, obj_HeadBeamHazard);
			
				if _beam && !invincible && !playerHurt {
					var _dir = 1;
			
					if vel >= 0 {
						_dir = -1;
					} else {
						_dir = 1;
					}
					
					event_user(0);
					event_user(1);
					event_user(3);
					
					PlayerSetGround(false);
			
					scr_HurtPlayer(200000, _dir * 3, false, -6);
				}
			#endregion
			
			#region //Head Beam
				var _beam2 = instance_place(x, y, obj_HeadBeam);
				var _beam3 = instance_place(x, y, obj_HeadBeamHead10);
			
				if (_beam2 or _beam3) && !invincible && !playerHurt {					
					event_user(0);
					event_user(1);
					event_user(3);
					
					PlayerSetGround(false);
			
					scr_HurtPlayer(200000, -8, false, -6);
				}
			#endregion
			
			#region //Kill & Get Hurt By Enemies
				scr_PlayerToEnemyShit();
			#endregion
		#endregion
		
		#region //Furry Collision
			//Gradual angle rotation
			/*if ground {
				angle_step = angle_step_g;
				state = scr_PstGround();
			} else {
				angle_step = angle_step_a
				state = scr_PstAerial();
			}

			if abs(angle_difference(drawAngle, target_angle)) < angle_step {
			    drawAngle = target_angle;
			} else {
			    drawAngle -= angle_step * sign(angle_difference(drawAngle, target_angle));
			}
			
			//image_angle = drawAngle;
			
			if !ground {
				yspd += grav;
				
				if yspd >= termVel {
					yspd = termVel;
				}
			}*/
		#endregion
		
		#region //Astral Collision
			PlayerAngleLocals();
			PlayerHandleLayers();
			
			if wallJumpTimer > 0 {
				wallJumpTimer--;
			}
			
			ceilY = 0;
			winningAngle = angleHolder;

			#region //Bullshit
				#region
					x += angleCos * vel;
					y -= angleSin * vel;
					
					var repFactor = 1;

					if abs(vel) > max_Speed {
						repFactor = round(abs(vel) / 9);
					}

					if vel > 0 {
						while (PlayerCollisionRight(x, y, angle, maskMid)) {
							x -= angleCos;
							y += angleSin;
						}
					}

					if vel < 0 {
						while (PlayerCollisionLeft(x, y, angle, maskMid)) {
							x += angleCos;
							y -= angleSin;
						}
					}
					
					if drawAngle == 0 && !sliding && !railGrind && !smallChar {
						if vel > 0 {
							while (PlayerCollisionRight(x, y - sensorTopDistance, angle, maskMid)) {
								x -= angleCos;
								y += angleSin;
							}
						}

						if vel < 0 {
							while (PlayerCollisionLeft(x, y - sensorTopDistance, angle, maskMid)) {
								x += angleCos;
								y -= angleSin;
							}
						}
					}

					//Cache collision
					PlayerCollisionCache();
				#endregion
				
				#region
					if ground {
						repeat (repFactor) {
							if edgeCollision {
								while (PlayerCollisionMain(x, y)) {
									x -= angleSin;
									y -= angleCos;
								}
							}

							if PlayerCollisionSlope(x, y, angle, maskMid) && !PlayerCollisionMain(x, y) {
								while (!PlayerCollisionMain(x, y)) {
									x += angleSin;
									y += angleCos;
								}
							}
						}

						PlayerCollisionCache();

						/*//Crushing
						if (bottomCollision && PlayerCollisionTop(x, y, angle, maskBig)) {
							// Kill player
							PlayerSetState(PlayerStateDead);
							exit;
						}*/

						//Fall if there is not enough speed.
						if angle >= 75 && angle <= 285 && abs(vel) < xMinSpeedToFall {
							PlayerFlight();
						}

						PlayerCollisionCache();

						//Fall off the ground if the edges aren't colliding
						if angle != 0 && !edgeCollision {
							PlayerFlight();               
						} 
        
						//Get new angle
						if edgeCollision && ground {
							//Store the new angle
							angleHolder = PlayerGetAngle(x, y, angle);
    
							//Smooth angle
							if abs(angle - angleHolder) < 45 {
								PlayerSetAngle(angle + (angleHolder - angle) * 0.5);
							} else {
								PlayerSetAngle(angleHolder);
							}
						} else {
							PlayerSetAngle(0);
						}
    
						//Leave the ground
						if !bottomCollision {
							PlayerSetGround(false);
							PlayerSetAngle(0);
						}
					}
				#endregion
				
				#region
					//Vertical movement        
					if !ground {  
						y += yspd;
        
						//Cache collision
						PlayerCollisionCache();
        
						/*//Crushing
						if bottomCollision && PlayerCollisionTop(x, y, angle, maskBig) {
							//Kill player
							PlayerSetState(PlayerStateDead);
							exit;                        
						}*/
        
						//Ceiling
						if yspd < 0 && PlayerCollisionTop(x, y, 0, maskBig) {
							if PlayerCollisionLeftEdge(x, y - sensorTopDistance - 5, 180) && PlayerCollisionRightEdge(x, y - sensorTopDistance - 5, 180) {
								PlayerSetAngle(PlayerGetAngle(x, y, 180));
                                        
								if angle < 140 or angle > 220 {
									vel = -angleSin * (yspd * 1.5);
									yspd = 0;     
									PlayerSetGround(true);
									PlayerCollisionCache();
								} else {
									PlayerSetAngle(0);
								}
							}
						}
                
						//Move the player outside in case he has got stuck into the floor or the ceiling           
						while (yspd < 0 && PlayerCollisionTop(x, y, 0, maskMid)) {
							y += 1;
						}
						
						while (yspd > 0 && PlayerCollisionBottom(x, y, 0, maskMid)) {
							y -= 1;
						}
    
						//Wall collision (needs to be performed because y axis has recently changed)
						while (PlayerCollisionRight(x, y, angle, maskMid)) {
							x -= angleCos;
							y += angleSin;
						}
        
						while (PlayerCollisionLeft(x, y, angle, maskMid)) {
							x += angleCos;
							y -= angleSin;
						}
						
						if drawAngle == 0 && !sliding && !railGrind && !smallChar {
							while (PlayerCollisionRight(x, y - sensorTopDistance, angle, maskMid)) {
								x -= angleCos;
								y += angleSin;
							}

							while (PlayerCollisionLeft(x, y - sensorTopDistance, angle, maskMid)) {
								x += angleCos;
								y -= angleSin;
							}
						}
						
						//Add gravity
						if gravTimer == 0 {
							yspd = min(yspd + grav, termVel);
						}

						PlayerCollisionCache();
					
						//Land
						if yspd >= 0 && bottomCollision {
							if edgeCollision {
								PlayerSetAngle(PlayerGetAngle(x, y, angle));
								PlayerCollisionCache();
								scr_Landing();
							}
    
							vel -= angleSin * (yspd * 1);
							yspd = 0;
							PlayerSetGround(true);
						}
    
						//Check if we're in the air but we collided with the ceiling
						if yspd < 0 && PlayerCollisionTop(x, y, 0, maskBig) {
							yspd = 0;
							gravTimer = 0;
						}
					}
				#endregion
				
				#region
					/*//Limit speed
					if abs(xSpeed) > xMaxSpeed {
						xSpeed -= (xFriction * 1.2) * sign(xSpeed);
					}*/

					//Acceleration and deceleration on slopes
					if ground && angle > 20 && angle < 340 {
						if angle > 35 && angle < 325 {
							var _slopeFactor = slopeFactor;
						
							if sliding {
								_slopeFactor = slopeFactorSlide;
							}
							
							if noMoveTimer == 0 {
								vel -= angleSin * _slopeFactor;
							}
						}
					}

					//Stop on wall
					if smallChar {
						if vel > 0 && PlayerCollisionRight(x, y - 1, angle, maskBig) {
							vel = 0;
							pushingWall = true;
						} else if vel < 0 && PlayerCollisionLeft(x, y - 1, angle, maskBig) {
							vel = 0;
							pushingWall = true;
						} else {
							pushingWall = false;
						}
					} else {
						if vel > 0 && PlayerCollisionRight(x, y - 1, angle, maskBig) {
							vel = 0;
							pushingWall = true;
						} else if vel < 0 && PlayerCollisionLeft(x, y - 1, angle, maskBig) {
							vel = 0;
							pushingWall = true;
						} else if drawAngle == 0 && !sliding && !railGrind {
							if vel > 0 && PlayerCollisionRight(x, y - sensorTopDistance + 5, angle, maskBig) {
								vel = 0;
								pushingWall = true;
							} else if vel < 0 && PlayerCollisionLeft(x, y - sensorTopDistance + 5, angle, maskBig) {
								vel = 0;
								pushingWall = true;
							} else {
								pushingWall = false;
							}
						} else {
							pushingWall = false;
						}
					}
					
					/*//Pushing
					if ground && !ducking && !look_up && !sliding && !railGrind && angle == 0 {
						if PlayerCollisionRight(x + 1, y - 20, 0, maskBig) && right_Key {
							pushingWall = true;
						} else if PlayerCollisionLeft(x - 1, y - 20, 0, maskBig) && left_Key {
							pushingWall = true;
						} else {
							pushingWall = false;
						}
					}*/
					
					//Decrease gravity freeze timer
					if gravTimer > 0 {
						gravTimer--;
					}
				
					if ground {
						//Rotate while moving on the ground
						drawAngle = ApproachAngle(drawAngle, angle, 6 + abs(vel));
					} else {
						drawAngle = ApproachAngle(drawAngle, 0, 6);
						angle = ApproachAngle(angle, 0, 4);
					}
				#endregion
			#endregion
		#endregion
	}
}


function scr_Landing(_type = "hard") {
	if global.Footstep {
		if _type == "grass" {
			obj_SFXManager.landGrass = true;
		} else {
			obj_SFXManager.landHard = true;
		}
		
		if PlayerCollisionObjectBottom(x, y, angle, maskBig, obj_RailParent) or PlayerCollisionObjectBottom(x, y, angle, maskBig, obj_RailParentA) or PlayerCollisionObjectBottom(x, y, angle, maskBig, obj_RailParentB) {
			obj_SFXManager.railGrindOn = true;
		}
	}
	
	if playerHurt {
		playerHurt = false;
	}
	
	if angleHolder == 0 {
		drawAngle = 0;
	}
	
	if global.Particles {
		if stomping or fallVel {
			scr_StompedVFX();
		}
		
		instance_create_depth(x + angleSin, y + angleCos, depth, obj_SlideDustVFX);
		instance_create_depth(x + angleSin, y + angleCos, depth, obj_SlideDustVFX);
		instance_create_depth(x + angleSin, y + angleCos, depth, obj_SlideDustVFX);
		instance_create_depth(x + angleSin, y + angleCos, depth, obj_SlideDustVFX);
	}
}


//Rail-Grind
function scr_RailGrindCreate() {
	railGrind = false;
	railGrindCrouch = false;
	railGrindFloor = noone;
	railGrindCheckingTimer = 0;
	railGrindCheckingFrames = 15;
	
	forgetSemiSolid = noone;
	
	afterRailJump = 0;
	afterRailJumpTimer = 0;
	afterRailJumpFrames = 10;
}

function scr_RailGrindingStep() {
	if railGrindCheckingTimer > 0 {
		railGrindCheckingTimer -= 1;
	}
	
	if !global.Death {
		/*if instance_exists(obj_RailParent) {
			var _list = ds_list_create();
			var _array = array_create(0);
			
			array_push(_array, obj_RailParent);
			
			var _collision = instance_place_list(x, y + 1, _array, _list, false);
			var _collision2 = instance_place(x, y + 1, obj_RailParent);
			
			for(var i = 0; i < _collision; i++) {
				var _listInst = _list[| i];
				
				if (_listInst.yspd < yspd or instance_exists(railGrindFloor)) && (_listInst.yspd > 0 or place_meeting(x, y + 1, _listInst)) {
					if (_listInst.object_index == obj_RailParent or object_is_ancestor(_listInst.object_index, obj_RailParent)) or floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd) {
						if !instance_exists(railGrindFloor) or _listInst.bbox_top + _listInst.yspd <= railGrindFloor.bbox_top + railGrindFloor.yspd or _listInst.bbox_top + _listInst.yspd <= bbox_bottom {
							if railGrindCheckingTimer <= 0 {
								railGrindFloor = _listInst;
							}
						}
					}
				}
			}
			
			ds_list_destroy(_list);
		
			if instance_exists(railGrindFloor) && ground && railGrindCheck && yspd >= 0 {
				railGrind = true;
				
				if !leftFacer {
					if vel == 0 {
						vel = 3 * image_xscale;
					}
				} else {
					if !face_Left && vel == 0 {
						vel = 3;
					} else if face_Left && vel == 0 {
						vel = -3;
					}
				}
			} else {
				railGrind = false;
				railGrindCrouch = false;
			}
			
			if instance_exists(railGrindFloor) && !place_meeting(x, y + 1, railGrindFloor) {
				railGrindFloor = noone;
			}
		}*/
		
		if ground && ((PlayerCollisionObjectBottom(x, y, angle, maskBig, obj_RailParent)
		or (PlayerCollisionObjectBottom(x, y, angle, maskBig, obj_RailParentA) && terrainLayer == 0)
		or (PlayerCollisionObjectBottom(x, y, angle, maskBig, obj_RailParentB) && terrainLayer == 1))) {
			railGrind = true;
		} else {
			railGrind = false;
		}
		
		if railGrind {
			obj_SFXManager.railGrinding = true;
			
			jumping = false;
			dJumping = false;
			sliding = false;
			stomped = false;
			afterRailJump = false;
			
			var _accAlt = (slopeFactor + acc) * sin(groundAngle);
			
			if !leftFacer {
				if vel == 0 {
					vel = (max_Speed / 3) * visXScale;
				}
			} else {
				if !face_Left && vel == 0 {
					vel = max_Speed / 3;
				} else if face_Left && vel == 0 {
					vel = -max_Speed / 3;
				}
			}
			
			if !speedBreak {
				if vel > 0 && vel < max_Speed && right_Key {
					vel += acc;
				} else if vel < 0 && vel > -max_Speed && left_Key {
					vel -= acc;
				}
			} else {
				if !boost {
					if vel > 0 && vel < full_Speed && right_Key {
						vel += acc;
					} else if vel < 0 && vel > -full_Speed && left_Key {
						vel -= acc;
					}
				} else {
					if vel > 0 && vel < boost_Speed && right_Key {
						vel += acc;
					} else if vel < 0 && vel > -boost_Speed && left_Key {
						vel -= acc;
					}
				}
			}

			
			if !leftFacer {
				if vel > 0 {
					visXScale = 1;
				} else if vel < 0 {
					visXScale = -1;
				}
			} else {
				if vel > 0 {
					face_Left = false;
				} else if vel < 0 {
					face_Left = true;
				}
			}
		} else {
			if audio_is_playing(snd_RushRailGrindOn) {
				audio_stop_sound(snd_RushRailGrindOn);
			}
			
			obj_SFXManager.railGrinding = false;
		}
		
		//Shit for ramps and rings
		if rampRing {
			beforeTrick = true;
			afterRailJump = false;
		}
	}
}


//Wall Cling
function scr_WallClingCreate() {
	wallJump = false;
	afterWallJump = false;
	wallJumping = false;
	onWall = 0;
	
	gravTimer = 0;
	
	wallJumpVel = 6;
	
	canWallJump = false;
	
	facingLeft = 1;
	extraRealX = 12; //Idk why the fuck I named it this
}

function scr_WallClingStep() {
	var _collisionGet = obj_Solid;
	var _wall = instance_place(x, y, _collisionGet);
	onWall = place_meeting(x + 1, y, _collisionGet) - place_meeting(x - 1, y, _collisionGet);
	
	if onWall == 1 {
		_wall = instance_place(x + 1, y, _collisionGet);
	} else if onWall == -1 {
		_wall = instance_place(x - 1, y, _collisionGet);
	} else {
		_wall = noone;
	}
		
	/*if !global.Death && !playerHurt && !rampRing && !afterRailJump && !stomping && wallJumpTimer == 0 {
		if onWall != 0 && !ground && yspd >= 0 {
			if _wall {
				canWallJump = _wall.wallJumpable;
			}
				
			if canWallJump {
				if !wallJump {
					if yspd > 1 {
						yspd = 1;
					}
					
					event_user(1);
					event_user(3);
					
					wallJump = true;
					obj_SFXManager.clench = true;
				}
				
				afterWallJump = false;
					
				if !leftFacer {
					if onWall {
						image_xscale = -1;
					} else if !onWall {
						image_xscale = 1;
					}
				} else {
					if onWall {
						face_Left = true;
					} else if -onWall {
						face_Left = false;
					}
				}
			}
		} else if onWall == 0 {
			wallJump = false;
		}
	} else {
		wallJump = false;
	}*/
}


function scr_CeilingDetect() {
	var _ceilingDetect = collision_point(x, y - 25, obj_Solid, true, true);
	var _ceilingDetect2 = collision_point(x, y - 25, obj_Solid, true, true);
	
	if terrainLayer == 1 {
		_ceilingDetect = collision_point(x, y - 25, obj_SolidB, true, true);
	} else if terrainLayer == 0 {
		_ceilingDetect = collision_point(x, y - 25, obj_SolidA, true, true);
	}
	
	if (_ceilingDetect or _ceilingDetect2) && ground && !smallChar && !jumping && angle == 0 {
		collide = true;
	} else {
		collide = false;
	}
	
	if collide {
		collideTimer = collideFrames;
	}
	
	if ground && collideTimer > 0 {
		if vel != 0 {
			sliding = true;
		} else {
			ducking = true;
		}
	}
	
	if collideTimer > 0 && !collide && railGrind {
		collideTimer -= 1;
	}
	
	if action2_Key && !collide && collideTimer > 0 && !railGrind {
		collideTimer = 0;
	}
	
	if !railGrind && !collide {
		collideTimer = 0;
	}
	
	
	//Fail-Safe if ceiling collides with idle mask while sliding
	if collide && sliding && vel > 0 {
		vel += dcc / 4;
	} else if collide && sliding && vel < 0 {
		vel -= dcc / 4;
	}
}


//Spike Shit
function scr_SpikeHurt() {
	if !boost && !invincible && !playerHurt {
		scr_HurtPlayer(200000, 5, 1, -7);
		obj_SFXManager.playerHurt = true;
		obj_SFXManager.spikeHurt = true;
							
		PlayerSetGround(false);
		scr_StopCharControls();
	
		event_user(0);
		event_user(1);
		event_user(3);
		
		if rushTrickFinish {
			rushTrickFinish = false;
			rushTrickCombo = 0;
		}
			
		can_MoveFULL = true;
		preTrickTimer = preTrickFrames;
	}
}